/**城市相关二级内容 */
$(".cityId").change(function(){
    city_id=$(this).val();
    //抛送请求
    url=SCOPE.city_url;
    postData={'id':city_id};
    $.post(url,postData,function(result){
        //相关的业务处理
        if(result.status==1){
            data= result.data;
            city_html="";
            $(data).each(function(i){
                city_html +="<option value='"+this.id+"'>"+this.name+"</option>";
                
            })
            $('.se_city_id').html(city_html);
        }else if(result.status==0){
            $('.se_city_id').html(city_html);
            return;
        }
    },'json')
   
});

/**分类二级内容 */
$(".categoryId").change(function(){
    category_id=$(this).val();
    //抛送请求
    url=SCOPE.category_url;
    postData={'id':category_id};
    $.post(url,postData,function(result){
        //相关的业务处理
        if(result.status==1){
            data= result.data;
            category_html="";
            $(data).each(function(i){
                category_html +='<input name="se_category_id[]" type="checkbox" id="checkbox-moban" value="'+this.id+'"/>'+this.name; 
                category_html +='<lable for="checkbox-moban">&nbsp;</label>'
            })
            $('.se_category_id').html(category_html);
        }else if(result.status==0){
            $('.se_category_id').html();
            return;
        }
    },'json')
   
});