<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function status($status)
{
  if($status==1){
      $str="<span class='label label-success radius'>正常</span>";
  }else if($status==0){
    $str="<span class='label label-danger radius'>待审</span>";
  }else{
    $str="<span class='label label-danger radius'>删除</span>";
  }
return $str;
  
}
/**
 * Undocumented function
 *
 * @param [type] $url
 * @param integer $type
 * @param array $data
 * @return void
 */
function doCurl($url,$type=0,$data=[]){
    $ch = curl_init();//初始化
    //设置选项
    curl_setopt($ch,CURLOPT_URL,$URL);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);//如果成功只返回结果,不把内容输出来
    curl_setopt($ch,CURLOPT_HEADER,0);//非0输出header头,0不输出
    if($type==1){
      //POST
      curl_setopt($ch,CURLOPT_POST,1);
      curl_setopt($ch,CURLOPT_POSTFIELDS,$data);//传值
    }
    //执行并获取内容
    $output=curl_exec($ch);
    //释放curl句柄
    return  $output;
}
 