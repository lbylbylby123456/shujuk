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
    var initList=function(){
        $.post("../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=get_record",function(json){
            console.log("dddd"+JSON.stringify(json));
            showResult(json);
        });
      };
    var showResult=function(json){
        var list=json.aaData;
        showList(list[0]);
        showName(list[0]);
    };
    var showName=function(json){
        var name=json[2];
        html=html+"<p>欢迎您，"+name+" ！</p>";
        $("#Myname").html(html);
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
        var mail=json[9];
        var connect=json[10];
        var signature=json[11];
       var age=json[12];
        $("#name").val(name);
        $("#sex").val(sex);
        $("#birth").val(birth);
        $("#occupation").val(occupation);
        $("#age").val(age);
        //$("#oldadress").val(province);
        //$("#city1").val(city);
        //$("#county").val(county);
        $("#mail").val(mail);
        $("#connect").val(connect);
        $("#signature").val(signature);
    };
    var modify=function(){
        if(checkInput()==true){
            page_form.action="../xm13-minsu/"+module+"_"+sub+"_servlet_action";
            page_form.submit();
        }
    };
    var checkInput=function(){
        var bOk=true;
        var age=$("#age").val();
        var name=$("#name").val();
        var mail=$("#mail").val();
        var connect=$("#connect").val();
        if(name==null || name==""){
            alert("姓名不能为空！");bOk=false;
        }else if(age==null || age==""){
            alert("年龄不能为空！"); bOk=false;
        }else if(mail==null || mail==""){
            alert("邮箱不能为空！");bOk=false;
        }else if(connect==null || connect==""){
            alert("联系方式不能为空！");bOk=false;
        }
        return bOk;
    };

    var initButton=function(){
        $('#submit_button').click(function() {Page.modify();});
    };
               return {
                   init: function() {
                           // initList();
                            initButton();
                   },
                   modify:function(){
                       modify();
                   }

               }
}();//Page

