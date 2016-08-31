<?php
namespace Admin\Controller;
use Admin\Controller;

class ConfigController extends BaseController{
	
	public function index(){
		
		$config = M('config');
		
		if(IS_POST){
			
			$_POST['posttime'] = time();
			
			if($config->where(array("id"=>1))->save($_POST)){
				
				$this->success('保存成功!',U('config/index'));
			}
			
		}else {
			
			$where = array();
			$where['id'] = 1;
			$info = $config->where($where)->find();
			$this->assign("info",$info);
			$this->display();
		}
	}
	
	
	public function admin(){
		
		$admin = M("admin");
		
		$where = array();
		$where['id'] = 1;
		
		if(IS_POST){
			
			$_POST['password'] = md5($_POST['password']);
			
			if($admin->where($where)->save($_POST)){
				
				$this->success('保存成功!',U('config/admin'));
			}
			
			
		}else {
			
			$info  = $admin->where($where)->find();
			
			$this->assign("info",$info);
			$this->display();
		}
	}
	
}