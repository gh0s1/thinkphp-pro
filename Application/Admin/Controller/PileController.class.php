<?php
namespace Admin\Controller;
use Admin\Controller;

class PileController extends BaseController
{

	public function index()
	{
	      	$pile = M("pile");
	      	$count = $pile->field("id")->count();
	      	$page = new \Think\Page($count,20);
	      	$page_list = $page->show();

	      	$lists = $pile->order("posttime DESC")->limit($page->firstRow,$page->listRows)->select();

	      	$this->assign("lists",$lists);
	      	$this->assign("page_list",$page_list);

		$this->display();
	}
	
	
	//添加充电桩
	public function edit()
	{
		$pile = M("pile");
		if(IS_POST)
		{	
			if(isset($_POST['id']))
			{

				$id = $_POST['id'];
				$where = array();
				$where['id'] = $id;
				$_POST['posttime'] = time();
				if($_POST['type'] == 5)
				{
					$_POST['mulType'] = implode(',',$_POST['mulType']);
				}
				else
				{
					$_POST['mulType'] = $_POST['type'];
				}
				
				if($pile->where($where)->save($_POST))
				{
					$this->success("保存成功!",U('pile/index'));
				}

			}
			else 
			{

				$_POST['posttime'] = time();
				$_POST['status'] = 1;
				if($_POST['type'] == 5)
				{
					$_POST['mulType'] = implode(',',$_POST['mulType']);
				}
				else
				{
					$_POST['mulType'] = $_POST['type'];	
				}
				
				if($pile->add($_POST))
				{
					$this->success('添加成功!',U('pile/index'));
				}
			}
		}
		else
		{
			if(isset($_GET['id']))
			{
				$flag = $_GET['flag'];
				$id = $_GET['id'];
				$where = array();
				$where['id'] = $id;
				$info = $pile->where($where)->find();
				if($info['type'] == 5)
				{
					$mulType = explode(',',$info['multype']);
					$this->assign("mulType",$mulType);
				}
				$this->assign("id",$id);
				$this->assign("flag",$flag);
				$this->assign("info",$info);
			}
			$type = M("map_type");
			$type_list = $type->order("id ASC")->select();
			$this->assign("type_list",$type_list);
			$this->display();
		}
	}


	//充电桩状态设置
	public function sets()
	{
		$pile = M("pile");
		$id = $_GET['id'];
		$where = array();
		$where['id'] = $id;

		$flag = $_GET['flag'];

		$data = array();
		if($flag == 'deny')
		{
			$data['status'] = 0;
			if($pile->where($where)->save($data))
			{
				$this->success("禁用成功!",U('pile/index'));
			}
		}

		if($flag == 'allow')
		{
			$data['status'] = 1;

			if($pile->where($where)->save($data))
			{
				$this->success('恢复成功!',U('pile/index'));
			}
		}
		
		if($flag == 'del')
		{
			if($pile->where($where)->delete())
			{
				$this->success('删除成功!',U('pile/index'));
			}
		}
	}



	//地图标注类型设置
	public function type()
	{
		
		$type = M("map_type");
		
		if($_GET['flag'] == 'edit')
		{
			if(IS_POST)
			{
				$where = array();
				$where['id'] = $_POST['id'];
				$data = array();

				if($_FILES['img']['name'] != '')
				{
					$imgUrl = $this->upload($_FILES);
					$data['imgUrl'] = $imgUrl;
				}

				$data['type'] = $_POST['type'];
				$data['posttime'] = time();

				if($type->where($where)->save($data))
				{
					$this->success("保存成功!",U('pile/type'));
				}
			}
			else
			{
				$id = $_GET['id'];
				$where = array();
				$where['id'] = $id;

				$info = $type->where($where)->find();

				$this->assign("info",$info);

				$this->display("type_edit");
			}

		}
		else if($_GET['flag'] == 'del')
		{
			$id = $_GET['id'];
			$where = array();
			$where['id'] = $id;

			if($type->where($where)->delete())
			{
				$this->success("删除成功!",U('pile/type'));
			}
		}
		else 
		{
			$list = $type->order("id ASC")->select();
			$this->assign("list",$list);
			$this->display();
		}
	}




	public function upload($file)
	{
		$upload = new \Think\Upload();
		$upload->exts = array("jpg","jpeg","png");
		$upload->rootPath = './upload/';
		$upload->savePath = '';
		$info = $upload->upload();
		$imgUrl = "upload/".$info['img']['savepath'].$info['img']['savename'];
		return $imgUrl;
	}
	
	
	
	
}

?>