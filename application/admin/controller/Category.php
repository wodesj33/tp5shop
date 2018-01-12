<?php

namespace app\admin\controller;

use think\Controller;
use think\Validate;
class Category extends Controller
{
    private $obj;
    public function _initialize()
    {
      $this->obj = model("Category");
    }
    public function index()
    {
        $parentId=input('get.parent_id',0,'intval');
        $categorys=$this->obj->getFirstCategory( $parentId);
        return $this->fetch('',[
            'categorys'=>$categorys
            ]);
    }

    public function add()
    {
        $category = $this->obj->getNormalFirstCategory();
        return $this->fetch('',[
            'category' => $category
        ]);
    }

    public function save()
    { 
        //print_r($_post)
        //print_r(input('post.'));
        //print_r(request()->post());
                    $data     = input('post.');
              $data['status'] = 10;
                    $validate = validate('Category');
        if (!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        //把$data 提交给model层
        $res = $this->obj->add($data);
        if($res){
            $this->success('新增成功');
        }else{
            $this->error('新增失败');
        }

    }
}
