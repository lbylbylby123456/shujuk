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
    var getRecord=function(){
        $.post("../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=get_record",function(json){
            console.log(JSON.stringify(json));
            Page.showResult(json);
        });
    };
    var sortRecord=function(index,sortName){
        $.post("../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=get_record&sort_index="+index+"&order_by="+sortName,function(json){
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
            html="													<div><span id=\"tip_div\"></span>";
            for(var i=0;i<list.length;i++){
                showList(list[i]);
            }
            html=html+"													</div>";
            $("#list").html(html);
        }
    };
    var showList=function(json){
        var id=json[0];
        //var image="../../assets/module/img/public/wkbj.jpg";
        var album_id=json[1];
        var album_info=json[2];
        var create_time=json[3];
        var image=json[5];
        html=html+"<article class=\"blog wow fadeIn\">";
        html=html+"                        <div class=\"row no-gutters\">";
        html=html+"                            <div class=\"col-lg-7\">";
        html=html+"                                <figure>";
        html=html+"                                    <img src=\""+image+"\" >";
        html=html+"                                        <div class=\"preview\"></div>";
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
                $.post("../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
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
        var sort1=$("#sort_01").val();
        var sort2=$("#sort_02").val();
            sort1="convert("+sort1+" using gbk)";
            sort2="convert("+sort2+" using gbk)";
        console.log("排序参数："+sort1+"    "+sort2);
        if(index==1) sortName=sort1;
        if(index==2) sortName=sort1+','+sort2;
        Record.sortRecord(index,sortName);
    };
    var modifyAlbum=function(id){
      window.location.href="album/album_view.jsp?id="+id;
    };
    //var ShowDiv=function(show_div,bg_div){
    //    document.getElementById(show_div).style.display='block';
    //    document.getElementById(bg_div).style.display='block' ;
    //    var bgdiv = document.getElementById(bg_div);
    //    bgdiv.style.width = document.body.scrollWidth;
    //    $("#"+bg_div).height($(document).height());
    //};
    var addAlbum=function(){
        //var album_id=$('#album_id').val();
        //var album_info=$('#album_info').val();
        //window.location.href="../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=add_record&album_id="+album_id+"&album_info="+album_info;
        window.location.href="album/album_add.jsp";
    };
    var printList=function(){
      window.location.href="album/album_print.jsp";
    };
    var queryRecord=function(){
        window.location.href="album/album_query.jsp";
    };
    var statisticRecord=function(){
        window.location.href="album/album_statistic_query.jsp";
    };
    var exportList=function(){
        console.log(22);
        bOk=confirm("下载需消耗流量，确定是否下载");
        if(bOk==true) {
            window.location.href = "../xm13-minsu/" + module + "_" + sub + "_servlet_action?action=export_record";
        }
    };
    var initButton=function(){
        $('#add_button').click(function() {Page.addAlbum();});
        $('#print_button').click(function() {Page.printList();});
        $('#export_button').click(function() {Page.exportList();});
        $('#query_button').click(function() {Page.queryRecord();});
        $('#statistic_button').click(function() {Page.statisticRecord();});
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
                   },
                   queryRecord:function(){
                       queryRecord();
                   },
                   statisticRecord:function(){
                       statisticRecord();
                   }

               }
}();//Page

