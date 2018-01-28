<?php

namespace app\api\controller;

use think\Controller;


class City extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('City');
    }

    public function getCitysByParentId()
    {
        $id=input('post.id');
        if(!$id){
           $this->error('ID不合法'); 
        }
        $city=$this->obj->getNormalCitysByParentId($id);
        if(!$city){
            return show(0,'error');
        }
        return show(1,'success',$city);
    }

  
}
