/**
 * Created by H on 2019/6/11.
 */
/**
 * Created by H on 2019/6/10.
 */
function getRecord(){
    var url = "../../project_wl_servlet_action?action=get_record";
    $.post(url,function(json){
        console.log("success");
        console.log(json);
        showRecord(json.data);
    });
}
function modifyRecord(modify_type,id){
    var url = "../../project_wl_servlet_action?action=modify_record_query&id="+id+"&modify_type="+modify_type+"&content="+$("#saved_content").val()+"&dates="+$("#saved_dates").val();
    $.post(url,function(json){
        console.log("modify success");
        console.log(json);
        showRecord(json.data);
    });
}

function deleteRecord(id){
    if(confirm("确定将这个房源移出清单吗?")){
        var url = "../../project_wl_servlet_action?action=delete_record_query&id="+id+"&content="+$("#saved_content").val()+"&dates="+$("#saved_dates").val();
        $.post(url,function(json){
            console.log("delete success");
            console.log(json);
            showRecord(json.data);
        });
    }
}

function showRecord(list){
    var html ="";
    var name;
    var addtime;
    var id;
    var address;
    var price;
    var share_type;
    var modify_type;
    for(var i = 0; i < list.length; i++){
        id = list[i][0];
        name = list[i][1];
        address  = list[i][2]+list[i][3]+list[i][4]+list[i][5];
        price = list[i][6];
        addtime = list[i][7].split(".")[0];
        share_type=list[i][8];
        if(share_type === "公开"){
            modify_type = "私密";
        }
        else if(share_type === "私密"){
            modify_type = "公开";
        }
        html+="<div class=\"col-xl-4 col-lg-6 col-md-6\">";
        html+= "<input type=\"hidden\" name=\"id\" value=\""+id+"\">";
        html+="<div class=\"box_grid\">";
        html+="<figure>";
        html+="<a href=\"javascript:deleteRecord("+id+");\" class=\"wish_bt liked\"></a>";
        html+="<a href=\"tour-detail.html\"><img src=\"../../assets/index/img/tour_2.jpg\" class=\"img-fluid\" alt=\"\" width=\"800\" height=\"533\"></a>";
        html+="<small>民宿</small>";
        html+="<div class=\"read_more\"><span>详细信息</span></div>";
        html+="</figure>";
        html+="<div class=\"wrapper\">";
        html+="<h3><a href=\"tour-detail.html\">"+name+"</a></h3>";
        html+="<p>地址:"+address+"</p>";
        html+="<p>类型:"+share_type+"</p>";
        html+="<span class=\"price\"><strong>￥"+price+"</strong> /晚</span>";
        html+="</div>";
        html+="<ul>";
        html+="<li><i class=\"icon_clock_alt\"></i>于"+addtime+"添加</li>";
        //html+="<a href=\"#0\" class=\"wish_bt liked\"></a>";
        //html+="<li><div class=\"score\"><span>Good<em>350 Reviews</em></span><strong>7.0</strong></div></li>";
        //html+="<li><a href=\"javascript:modifyRecord(\""+modify_type+"\");\" role=\"button\" class=\"btn btn-info\"><small>"+modify_type+"</small></a></li>"
        html+="<li><a href=\"javascript:modifyRecord('"+modify_type+"',"+id+");\" role=\"button\" class=\"btn btn-info\"><small>"+modify_type+"</small></a></li>"
        html+="</ul>";
        html+="</div>";
        html+="</div>";
    }
    $("#wishlist_content").html(html);
}

//function queryRecord(){
//}

//getRecord();
$(function() {
    'use strict';
    $('input[name="dates"]').daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Clear'
        }
    });
    $('input[name="dates"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY-MM-DD') + ' > ' + picker.endDate.format('YYYY-MM-DD'));
    });
    $('input[name="dates"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
});
function initSearch(){
    var formObj = document.getElementById("search_form");
    formObj.method = "post";
    formObj.action = "../../project_wl_servlet_action";
    $("#search_form").ajaxForm(function(json){
        console.log("query success");
        console.log(json.data);
        showRecord(json.data);
        $("#saved_content").val(json.content);
        $("#saved_dates").val(json.dates);
        //console.log(data);
    })
    //formObj.submit();
}

initSearch();