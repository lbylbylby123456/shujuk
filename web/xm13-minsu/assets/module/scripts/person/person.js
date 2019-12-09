jQuery(document).ready(function() {
	console.log("js初始化执行开始！");
	Page.init();
	console.log("js初始化执行完毕！");
});
var module="person";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
    var html="";
    var list=new Array();
    var initList=function(){
        $.post("../"+module+"_"+sub+"_servlet_action?action=get_record",function(json){
            console.log("sssssssssssssssssss:"+JSON.stringify(json));
            showResult(json);
        });
      };
    var showResult=function(json){
        var list = json.aaData;
        if(list.length==0){
            html=html+"  <p> 您还没有添加个人信息，点击按钮添加！</p>  ";
            html=html+"   <div onclick=\"Page.addInfo();\" class=\"btn_1 rounded\"> <i class=\"fsl\"></i>添加</div>";
            $("#list").html(html);
            html="";
            html=html+"    <img src=\"../person/profile_user.jpg\" class=\"img-responsive\" >";
            $("#image_div").html(html);
            document.getElementById("isYes").style.visibility="hidden";
            document.getElementById("info").style.visibility="hidden";
            document.getElementById("print_button").style.visibility="hidden";
            document.getElementById("export_button").style.visibility="hidden";
        }else {
            showImage(list[0]);
            showList(list[0]);
            showName(list[0]);
        }
    };
    var showName=function(json){
        var name=json[2];
        html=html+"<p>欢迎您，"+name+" ！</p>";
        $("#Myname").html(html);
        html="";
    };
    var showImage=function(json){
        var path=json[13];
        console.log("ddddddd"+path);
        html=html+"   <img src=\""+path+"\" class=\"img-responsive\" >";
        $("#image_div").html(html);
        html="";
    };
    var showList=function(json){
        //var id=json[0];
      //  var user_id=json[1];
        var name=json[2];
        var sex=json[3];
        var birth=json[4];
        var occupation=json[5];
        var province=json[6];
        var city=json[7];
        var county=json[8];
        var adress=province+" "+city+" "+county;
        var mail=json[9];
        var connect=json[10];
        var signature=json[11];
        var age=json[12];
        list[0]=name;//0
        list[1]=sex;//1
        list[2]=birth;//2
        list[3]=occupation;//3
        list[4]=adress;//4
        list[5]=mail;//5
        list[6]=connect;//6
        list[7]=signature;//7
        list[8]=age;
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">真实姓名 </td>";
        html=html+"               <td style=\"text-align: center\">"+name+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">性别</td>";
        html=html+"               <td style=\"text-align: center\">"+sex+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">年龄</td>";
        html=html+"               <td style=\"text-align: center\">"+age+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">生日</td>";
        html=html+"               <td style=\"text-align: center\">"+birth+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">职业</td>";
        html=html+"               <td style=\"text-align: center\">"+occupation+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">所在地</td>";
        html=html+"               <td style=\"text-align: center\">"+adress+" </td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">邮箱</td>";
        html=html+"               <td style=\"text-align: center\">"+mail+"</td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\"> 电话</td>";
        html=html+"               <td style=\"text-align: center\">"+connect+" </td>";
        html=html+"               </tr>";
        html=html+"               <tr>";
        html=html+"               <td style=\"width: 150px; text-align: center\">个人简介</td>";
        html=html+"               <td style=\"text-align: center\">"+signature+"</td>";
        html=html+"               </tr>";
        $("#list").html(html);
        html="";
    };
    var print=function(){
        console.log(444);
        window.location.href="person_print.jsp";
    };
    var exportExcel=function(){
        console.log(222);
        bOk=confirm("下载需消耗流量，确定是否下载");
        if(bOk==true) {
            window.location.href = "../" + module + "_" + sub + "_servlet_action?action=export_record&name=" + list[0] + "&sex=" + list[1] + "&birth=" + list[2] + "&occupation=" + list[3] + "&adress=" + list[4] + "&mail=" + list[5] + "&connect=" + list[6] + "&signature=" + list[7]+"&age="+list[8];
        }
    };
    var addinfo=function(){
     window.location.href="person_add.jsp";
    };
    var initButton=function(){
       // $('#modify').click(function() {Page.modify();});
        $('#print_button').click(function() {Page.print();});
        $('#export_button').click(function() {Page.exportExcel();});
    };
               return {
                   init: function() {
                            initList();
                            initButton();
                   },
                   print:function(){
                       print();
                   },
                   exportExcel:function(){
                       exportExcel();
                   },
                   addInfo:function(){
                       addinfo();
                   }

               }
}();//Page

