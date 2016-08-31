<?php

namespace Home\Controller;

use Think\Controller;


class IndexController extends Controller{

	public function __construct(){
		
			parent::__construct();
			session_start();
			/*
			S(
				array(
					'type'=>'memcache',
					'host'=>'115.28.164.241',
					'port'=>'11211',
					'prefix'=>'think',
					'expire'=>3600
				)
			);
			*/
	}
	
	
	public function index()
	{	
		// tab-1
		$pile = M("pile");
		//$all_rs = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.id,p.pilename,p.positions,p.lng,p.lat,p.type,p.mulType,m.id as typeid,m.imgUrl,m.type")->where($where)->order("p.lat")->select();
		$cache = \Think\Cache::getInstance('Memcache'); 
		
		$all_rs = $cache->get("points");
		if(!$all_rs)
		{
			$all_rs = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.id,p.pilename,p.positions,p.lng,p.lat,p.type,p.mulType,m.id as typeid,m.imgUrl,m.type")->where($where)->order("p.lat")->select();
			$cache->set("points",$all_rs);
		}
		
		
		//获取地图标注点
		$points = array();
		foreach($all_rs as $key => $val)
		{
			
			$points[$key]['lng'] = $val['lng'];
			$points[$key]['lat'] = $val['lat'];
			$points[$key]['pilename'] = $val['pilename'];
			$points[$key]['imgUrl'] = $val['imgurl'];
			$points[$key]['positions'] = $val['positions'];
			if($val['typeid'] == 5)
			{
				$multype = $val['multype'];
				$multype = explode(',',$multype);
				$type = M("map_type");
				$where = array();
				$where['id'] = array('in',$multype);
				$types = $type->where($where)->field("type")->select();
				$str = "";
				foreach($types as $val)
				{
					$str .= $val['type']." ";
				}
				$points[$key]['type'] = $str;
			}
			else 
			{
				$points[$key]['type'] = $val['type'];
			}
		}
		$points = json_encode($points);
		$this->assign("points",$points);
		$this->display();
	}
	
	
	public function lists()
	{
		$pile = M("pile");
		if(isset($_REQUEST['mypos']) || isset($_REQUEST['tags']))
		{	 
			$myLng = $_REQUEST['myLng'];
			$myLat = $_REQUEST['myLat'];
			
			//$range = 180 / pi() * 1 / 6372.797;     //里面的 1 就代表搜索 1km 之内，单位km  
			$range = 180 / pi() * 1000 / 6367.000;
			$lngR = $range / cos($myLat * pi() / 180);  

			$maxLat =  $myLat + $range;    // 最大纬度  
			$minLat  =  $myLat - $range;  // 最小纬度  
			$maxLng = $myLng + $lngR;    // 最大经度  
			$minLng  = $myLng - $lngR;  // 最小经度 
			
			$where = array();
			$where['type'] = $_REQUEST['tagId'];
			
			$all_points = $pile->order('id DESC')->where($where)->select(); 
			foreach($all_points as $key=>$val)
			{
				$all_points[$key]['distance'] = $this->getDistance($myLat,$myLng,$val['lat'],$val['lng']);
			}
			$this->sorts($all_points);
			
			$where = array();
			$where['p.lng'] = array('between',array($minLng, $maxLng));
	        $where['p.lat'] = array('between', array($minLat,$maxLat));
			$where['p.status'] = 1;
			
			if(isset($_REQUEST['tags']))
			{
				$where['p.mulType'] = array(
											array('like','%'.$_REQUEST['tagId'].'%'),
											array('like','%'.$_REQUEST['tagId']),
											array('like',$_REQUEST['tagId'].'%'),
											$_REQUEST['tagId'],
											'OR'
									  ); 
			}
			
			$count = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.id")->where($where)->count();
			
			$curr = isset($_REQUEST['p']) ? $_REQUEST['p'] : 1; 
			
			$page = new \Think\AjaxPage($count,10,"pages","",$curr);
			
			$page_list = $page->show(); 
			$offset = ($curr-1)*10;

			foreach($all_points as $key => $val)
			{ 
				$type = M("map_type");
				if($val['type'] == 5)
				{
					$multype = $val['multype'];
					$multype = explode(',',$multype);
					$where = array();
					$where['id'] = array('in',$multype);
					$types = $type->where($where)->field("type")->select();
					$str = "";
					foreach($types as $v)
					{
						$str .= $v['type']." ";
					}
					$all_points[$key]['type'] = $str;
				}
				else 
				{
					$where = array();
					$where['id'] = $val['type'];
					$types = $type->where($where)->field("type")->find();
					$all_points[$key]['type'] = $types['type']; 
				}
				
			}
			
			$rs = array_slice($all_points,$offset,10);
			
			if(isset($_REQUEST['tags']))
			{
				$this->assign("tagId",$_REQUEST['tagId']);
				$this->assign("clicked",$_SESSION['clicked']);
			}
			$this->assign("myLng",$myLng);
			$this->assign("myLat",$myLat);
			$this->assign("page_list",$page_list);
			$this->assign("rs",$rs);
		}
		$this->display('Index/lists');
	}
	
	//点击
	public function click()
	{
		if(!in_array($_POST['id'],$_SESSION['clicked']))
		{
			$_SESSION['clicked'][] = $_POST['id'];
		}
	}

	//排序
	public function sorts(&$arr)
	{

		for($i=0;$i<count($arr)-1;$i++){
			
			for($j=0;$j<count($arr)-1-$i;$j++){
				
				$temp = array();
				
				if($arr[$j]['distance'] > $arr[$j+1]['distance']){
					
					$temp = $arr[$j];
					$arr[$j] = $arr[$j+1];
					$arr[$j+1] = $temp;
				}
			}
		}
	}

	
	//根据经纬度测算距离
	/**
	*  @desc 根据两点间的经纬度计算距离
	*  @param float $lat 纬度值
	*  @param float $lng 经度值
	*  @单位 米
	*/
	
	public function getDistance($lat1, $lng1, $lat2, $lng2){
		 $earthRadius = 6367000; //approximate radius of earth in meters  

		 $lat1 = ($lat1 * pi() ) / 180;
		 $lng1 = ($lng1 * pi() ) / 180;

		 $lat2 = ($lat2 * pi() ) / 180;
		 $lng2 = ($lng2 * pi() ) / 180;



		 $calcLongitude = $lng2 - $lng1;
		 $calcLatitude = $lat2 - $lat1;
		 
		 $stepOne = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
		 $stepTwo = 2 * asin(min(1, sqrt($stepOne)));
		 $calculatedDistance = $earthRadius * $stepTwo;
		 

		 return round($calculatedDistance);  
	}
	 
	//点赞  报错
	public function set(){
		
		if(IS_POST)
		{
			$flag = $_POST['flag'];
			$id = $_POST['id'];
			$where = array();
			$where['id'] = $id;
			$pile = M('pile');
			
			if($flag == 'error'){
				if($pile->where($where)->setInc("error",1)){ 
					
					$msg = array(
						'flag' => 'error',
						'info' => '报错成功!'
					);
				}
			}
			
			if($flag == 'likes'){
				
				if($pile->where($where)->setInc("likes",1)){
					
					$msg = array(
						'flag' => 'likes',
						'info' => '点赞成功!'
					);
				}
			}
			
			echo json_encode($msg);
		}
	}
	
	
	//授权
	public function Oauth()
	{
		
	}
	
	
	public function get_map_distance()
	{
		$myLat = $_POST['myLat'];
		$myLng = $_POST['myLng'];
		$des_lng = $_POST['des_lng'];
		$des_lat = $_POST['des_lat'];
		$distance = $this->getDistance($myLat,$myLng,$des_lat,$des_lng);
		
		$km = "km";
		$m = "m";
		if($distance >= 1000) {
			
			echo number_format(($distance / 1000),1).$km; 
		}
		
		if($distance <= 100){
			
			echo "<100m"; 
		}
		
		
		if($distance > 100 && $distance < 1000){
		
			echo number_format($distance,1).$m;
		}
	}

	public function __destruct()
	{
		//unset($_SESSION['clicked']);
	}
	
}
