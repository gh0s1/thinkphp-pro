<?php

namespace Home\Controller;

use Think\Controller;


class IndexController extends Controller{

	public function __construct(){
		
			parent::__construct();
	}
	
	/*
	public function index()
	{

	}
	*/


	public function nearby()
	{
		$flag = $_GET['flag'];

		if($flag == 'myposition')
		{

		} 

		if($flag == 'nearby')
		{

			$myLng  = $_GET['mylng'];
			$myLat = $_GET['mylat'];

			//$range = 180 / pi() * 1 / 6372.797;     //里面的 1 就代表搜索 1km 之内，单位km  
			$range = 180 / pi() * 1000 / 6367.000; // 5km 范围内
			$lngR = $range / cos($myLat * pi() / 180);  

			$maxLat =  $myLat + $range;//最大纬度  
			$minLat  =  $myLat - $range;//最小纬度  
			$maxLng = $myLng + $lngR;//最大经度  
			$minLng  = $myLng - $lngR;//最小经度 

			
			$pile = M("pile");
			$where = array();
			$where['p.lng'] = array('between',array($minLng, $maxLng));
	        $where['p.lat'] = array('between', array($minLat,$maxLat));
			$where['p.status'] = 1;
			$count = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.id")->count();
			
			$page = new \Think\Page($count,10);
			
			$page_list = $page->show();
			  
			$rs = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.*,m.imgUrl,m.type")->where($where)->limit($page->firstRow.','.$page->listRows)->order("p.lat")->select();
			
			
			$all_rs = $pile->alias("p")->join("tp_map_type m ON p.type=m.id","LEFT")->field("p.*,m.imgUrl,m.type")->where($where)->order("p.lat")->select();
			
			//首先算出传递过来的经纬度与预存经纬度之间的距离
			foreach($rs as $key => $val)
			{
				
				$rs[$key]['distance'] = $this->getDistance($myLat,$myLng,$val['lat'],$val['lng']);
			}
			
			foreach($all_rs as $key => $val)
			{
				
				$all_rs[$key]['distance'] = $this->getDistance($myLat,$myLng,$val['lat'],$val['lng']);
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
			}
			
			$points = json_encode($points);
			
			$this->sorts($rs);

			$this->assign("myLat",$myLat);
			$this->assign("myLng",$myLng);
			
			$this->assign("points",$points);
			
			$this->assign("rs",$rs);
			$pos = $_GET['pos'];
			
			if($pos == 'true')
			{
				$pilename = $_GET['pilename'];
				$addr = $_GET['addr'];
				$this->assign("pos",1);
				$this->assign("pilename",$pilename);
				$this->assign("addr",$addr);
				
			}
			
			if($pos == 'false')
			{
				$this->assign("pos",0);
			}

			$this->assign("page_list",$page_list);

		}
		$this->assign("flag",$flag);		
		$this->display();
	}


	//排序
	public function sorts(&$arr){

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
		
		$flag = $_GET['flag'];
		$id = $_GET['id'];
		$where = array();
		$where['id'] = $id;
		$pile = M('pile');
		
		if($flag == 'error'){
			if($pile->where($where)->setInc("error",1)){ 
				
				echo "<script>alert('报错成功!');history.go(-1);</script>";
			}
		}
		
		if($flag == 'likes'){
			
			if($pile->where($where)->setInc("likes",1)){
				echo "<script>alert('点赞成功!');history.go(-1);</script>";
			}
		}
	}
	
	
	//授权
	public function Oauth()
	{
		
	}

	
	
}
