<?php
namespace app\admin\controller;
use think\Controller;

class Category extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
    public function add()
    {
        return $this->fetch();
    }
    public function save()
    {
       //print_r($_post)
       //print_r(input('post.'));
       print_r(request()->post());
    }
}

