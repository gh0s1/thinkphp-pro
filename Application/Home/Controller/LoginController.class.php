<?php

namespace Home\Controller;

use Think\Controller;


class LoginController extends Controller{
	
	public function __construct(){
		
		parent::__construct();
		
		if(isset($_COOKIE['userId']) && isset($_COOKIE['flag'])){
			
			redirect(U('index/index'));
		}
	}
	
	public function index(){
		
		$this->display();
	}
	
	public function login(){
		
		if(IS_POST){
			
			$user = M('user');
			$where = array();
			$where['user'] = $_POST['user'];
			$where['password'] = md5($_POST['password']);
			$rs = $user->where($where)->find();
			if($rs){
				
				setcookie('userId',$rs['id'],time()+3600*24,'/');
				
				if($_POST['flag'] == 'on'){
					
					setcookie('flag',true,time()+3600*24,'/');
				}
				
				$this->success("登录成功!",U('index/index'));
			}
			
		}
	}
	
	
	public function logout(){
		
		setcookie("userId","",time()-1,'/');
		
		$this->success('登出成功',U('login/index'));
	}
}