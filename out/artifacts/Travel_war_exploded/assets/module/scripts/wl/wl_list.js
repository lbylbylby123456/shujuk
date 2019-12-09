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

function deleteRecord(id){
    if(confirm("确定将这个房源移出清单吗?")){
        var url = "../../project_wl_servlet_action?action=delete_record&id="+id;
        $.post(url,function(json){
            console.log("delete success");
            console.log(json);
            showRecord(json.data);
        });
    }
}

function modifyRecord(modify_type,id){
    var url = "../../project_wl_servlet_action?action=modify_record&id="+id+"&modify_type="+modify_type;
    $.post(url,function(json){
        console.log("modify success");
        console.log(json);
        showRecord(json.data);
    });
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
        html+="<li><a href=\"javascript:modifyRecord('"+modify_type+"',"+id+");\" role=\"button\" class=\"btn btn-info\"><small>"+modify_type+"</small></a></li>"
        html+="</ul>";
        html+="</div>";
        html+="</div>";
    }
    $("#wishlist_content").html(html);
}

function exportRecord(){
    var url = "../../project_wl_servlet_action?action=export_record&&exist_resultset=1";
    $.post(url,function(json){
        if(json.result_code === 0){
            console.log("export success");
            console.log(json);
            if(confirm("文件"+json.filename+"已导出，确定要下载吗?")){
                var url = "/upload/"+json.filename;
                window.open(url);
            }
        }
    });
}

function sortRecord(index){
    var sortName = undefined;
    if(index == 1){
        sortName = $("#sort_01").val();
    }
    if(index == 2){
        sortName =$("#sort_01").val()+","+ $("#sort_02").val();
    }
    if(index == 3){
        sortName =$("#sort_01").val()+","+ $("#sort_02").val()+","+ $("#sort_03").val();
    }

    var id = $("#id").val();
    var url = "../../project_wl_servlet_action?action=sort_record&&sort_index="+index+"&order_by="+sortName;

    console.log(url);

    $.post(url	,function(json){
        console.log(JSON.stringify(json));
        showRecord(json.data);
    });
};

function initSortButton(){
    console.log("start");
    $('#sort_01').on('change', sortRecord(1));
    $('#sort_02').on('change', sortRecord(2));
    $('#sort_03').on('change', sortRecord(3));
    console.log("end");
}
getRecord();
//initSortButton();