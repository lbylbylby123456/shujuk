/**
 * Created by H on 2019/6/14.
 */
function getRecord(){
    var content = $("#search_content").val();
    var url = "../project_hs_servlet_action?action=get_record&content="+content;
    $.post(url,function(json){
        console.log(json);
        showRecord(json.data);
    })
}

function showRecord(list){
    var html="";
    var id;
    var address;
    var price;
    var name;
    for(var i = 0; i < list.length;i++){
        id = list[i][0];
        name = list[i][1];
        address  = list[i][2]+list[i][3]+list[i][4]+list[i][5];
        price = list[i][6];

        html+="<div class=\"box_list\">";
        html+="<div class=\"row no-gutters\">";
        html+= "<input type=\"hidden\" name=\"id\" value=\""+id+"\">";
        html+="<div class=\"col-lg-5\">";
        html+="<figure>";
        html+="<small>民宿</small>";
        html+="<a href=\"./add_to_order.jsp?id="+id+"&price="+price+"\"><img src=\"../assets/index/img/tour_1.jpg\" class=\"img-fluid\" alt=\"\" width=\"800\" height=\"200\"><div class=\"read_more\"><span>加入订单</span></div></a>";
        html+="</figure>";
        html+="</div>";
        html+="<div class=\"col-lg-7\">";
        html+="<div class=\"wrapper\">";
        html+="<a href=\"javascript:addToWishlist("+id+")\" class=\"wish_bt\"></a>";
        html+="<h3><a href=\"tour-detail.html\">"+name+"</a></h3>";
        html+="<p>地址："+address+"</p>";
        html+="</div>";
        html+="<ul>";
        html+="<span class=\"price\"><strong>￥"+price+"</strong> /晚</span>";
        //html+="<li><i class=\"icon_clock_alt\"></i> 1h 30min</li>";
        //html+="<li><div class=\"score\"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div></li>";
        html+="</ul>";
        html+="</div>";
        html+="</div>";
        html+="</div>";
    }
    $("#house_content").html(html);
}

function addToWishlist(id){
    var sharetype = "公开";
    var url = "../project_wl_servlet_action?action=add_record&id="+id+"&share_type="+sharetype;
    $.post(url,function(json){
        if(json.result_code === 0){
            alert("添加成功");
        }
        else if(json.result_code === 10){
            alert("该民宿已经在心愿清单中");
        }
        else{
            alert("添加失败,错误代码"+json.result_code);
        }
    })
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
    var city = $("#search_content").val();
    var id = $("#id").val();
    var url = "../project_hs_servlet_action?action=sort_record&&sort_index="+index+"&order_by="+sortName+"&city="+city;

    console.log(url);

    $.post(url	,function(json){
        console.log(JSON.stringify(json));
        showRecord(json.data);
    });
};


getRecord();