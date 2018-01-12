<?php

namespace app\admin\controller;

use think\Controller;
use think\Validate;

class Category extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('Category');
    }

    public function index()
    {
        $parentId = input('get.parent_id', 0, 'intval');
        $categorys = $this->obj->getFirstCategory($parentId);

        return $this->fetch('', [
            'categorys' => $categorys,
            ]);
    }

    public function add()
    {
        $category = $this->obj->getNormalFirstCategory();

        return $this->fetch('', [
            'category' => $category,
        ]);
    }

    public function save()
    {
        //print_r($_post)
        //print_r(input('post.'));
        //print_r(request()->post());
        /*
         * 做下严格判定
         */
        if (request()->isPost()) {
            $this->error('请求失败');
        }
        $data = input('post.');
        $data['status'] = 10;
        $validate = validate('Category');
        if (!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        if (!empty($data['id'])) {
            return $this->update($data);
        }
        //把$data 提交给model层
        $res = $this->obj->add($data);
        if ($res) {
            $this->success('新增成功');
        } else {
            $this->error('新增失败');
        }
    }

    /**
     * 编辑页面.
     */
    /*下面这种方法也会输出传过来的值
    public function edit($id){
            echo $id;
            echo input('get.id');
        }
        */
    public function edit($id = 0)
    {
        if (intval($id) < 1) {
            $this->error('参数不合法');
        }
        $category = $this->obj->get($id); //获取记录通过主键id
        // print_r($category);
        $categorys = $this->obj->getNormalFirstCategory();

        return $this->fetch('', [
            'categorys' => $categorys,
            'category' => $category,
        ]);
    }

    public function update($data)
    {
        return $this->obj->save($data, ['id' => intval($data['id'])]);
        if ($rres) {
            $this->success('更新成功');
        } else {
            $this->error('更新失败');
        }
    }
    //排序逻辑
    public function listorder($id,$listorder){
        $res = $this->obj->save(['listorder'=>$listorder], ['id' => intval($id)]);
        if($res){
            $this->result($_SERVER['HTTP_REFERER'],1,'success');//第一个参数需要跳转的链接,第二个参数是状态码,第三为提示语
        }else{
            $this->result($_SERVER['HTTP_REFERER'],1,'更新失败');
        }
    }
    //修改状态
    public function status(){
        
        $data = input('get.');
        $validate = validate('Category');
        if (!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }
       
        $res = $this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);
        if ($res) {
            $this->success('状态更新成功');
        } else {
            $this->error('状态更新失败');
        }
    }
}
