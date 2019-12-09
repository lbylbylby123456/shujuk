jQuery(document).ready(function() {
	console.log("js初始化执行开始！");
    Record.init();
	Page.init();
	console.log("js初始化执行完毕！");
});
var module="album";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Record=function(){
    var search=$("#search").val();
    var time_from=$("#time_from").val();
    var time_to=$("#time_to").val();
    var getRecord=function(){
        $.post("../"+module+"_"+sub+"_servlet_action?action=query_record&search="+search+"&time_from="+time_from+"&time_to="+time_to,function(json){
            console.log(JSON.stringify(json));
            Page.showResult(json);
        });
    };
    var sortRecord=function(index,sortName){
        $.post("../"+module+"_"+sub+"_servlet_action?action=query_record&sort_index="+index+"&order_by="+sortName,function(json){
            console.log(JSON.stringify(json));
            show(json);
        });
    };
    var show=function(json){
        Page.showResult(json);
    };
      return {
        init: function() {
           getRecord();
        },
        sortRecord:function(index,sortName){
            sortRecord(index,sortName);
        }

    }
}();
var Page = function() {
    var html="";
    var showResult=function(json){
        if(json!=null){
            var list=json.aaData;
            for(var i=0;i<list.length;i++){
                showList(list[i]);
            }
            $("#list").html(html);
        }
    };
    var showList=function(json){
        var id=json[0];
        var album_id=json[1];
        var album_info=json[2];
        var create_time=json[3];
        var image=json[5];
        html=html+"<article class=\"blog wow fadeIn\">";
        html=html+"                        <div class=\"row no-gutters\">";
        html=html+"                            <div class=\"col-lg-7\">";
        html=html+"                                <figure>";
        html=html+"                                    <img src=\""+image+"\" >";
        html=html+"                                </figure>";
        html=html+"                            </div>";
        html=html+"                            <div class=\"col-lg-5\">";
        html=html+"                                <div class=\"post_info\">";
        html=html+"                                    <h3><a>"+album_id+"</a></h3><br>";
        html=html+"                                    <p>创建日期："+create_time+"</p>";
        html=html+"                                    <p>简介："+album_info+"</p>";
        html=html+"                                    <ul>";
        html=html+"                                       <div onclick='Page.deleteAlbum("+id+");' class=\"btn_1 rounded\"><i class=\"fsl\" data-icon=\"&#xe019;\"></i>&nbsp;&nbsp;&nbsp;删除</div>";
        html=html+"                                       <div onclick=\"Page.modifyAlbum("+id+");\" class=\"btn_1 rounded\"> <i class=\"fsl\" data-icon=\"&#x6c;\"></i>&nbsp;&nbsp;&nbsp;修改</div>";
        html=html+"                                    </ul>";
        html=html+"                                </div>";
        html=html+"                            </div>";
        html=html+"                        </div>";
        html=html+"</article>";
    };
    var deleteAlbum=function(id){
        if(confirm("您确定要删除该相册吗？")){
            if(id>-1){
                $.post("../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
                    if(json.result_code==0){
                        window.location.reload();
                        alert("已经删除该相册！");
                    }
                })
            }
        }
    };
    var sortRecord=function(index) {
        //Record.sortRecord(index);
        document.getElementById("list").innerHTML = "";
        var sortName=undefined;
        if(index==1) sortName=$("#sort_01").val();
        if(index==2) sortName=$("#sort_01").val()+','+$("#sort_02").val();
        Record.sortRecord(index,sortName);
    };
    var modifyAlbum=function(id){
        window.location.href="album_view.jsp?id="+id;
    };
    //var ShowDiv=function(show_div,bg_div){
    //    document.getElementById(show_div).style.display='block';
    //    document.getElementById(bg_div).style.display='block' ;
    //    var bgdiv = document.getElementById(bg_div);
    //    bgdiv.style.width = document.body.scrollWidth;
    //    $("#"+bg_div).height($(document).height());
    //};
    var addAlbum=function(){
        var album_id=$('#album_id').val();
        var album_info=$('#album_info').val();
        window.location.href="../"+module+"_"+sub+"_servlet_action?action=add_record&album_id="+album_id+"&album_info="+album_info;
    };
    var printList=function(){
      window.location.href="query_print.jsp";
    };
    var exportList=function(){
        bOk=confirm("下载需消耗流量，确定是否下载");
        if(bOk==true) {
            window.location.href = "../" + module + "_" + sub + "_servlet_action?action=export_query_record";
        }
    };
    var initButton=function(){
        $('#addButton').click(function() {Page.addAlbum();});
        $('#print_button').click(function() {Page.printList();});
        $('#export_button').click(function() {Page.exportList();});
    };
               return {
                   init: function() {
                            //initList();
                            initButton();
                   },
                   deleteAlbum:function(id){
                        deleteAlbum(id);
                   },
                   modifyAlbum:function(id){
                       modifyAlbum(id);
                   },
                   addAlbum:function(){
                       addAlbum();
                   },
                   sortRecord:function(index){
                       sortRecord(index);
                   },
                   showResult:function(json){
                       showResult(json);
                   },
                   printList:function(){
                       printList();
                   },
                   exportList:function(){
                       exportList();
                   }

               }
}();//Page

