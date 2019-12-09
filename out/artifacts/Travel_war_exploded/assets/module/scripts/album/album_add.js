var module="album";
var sub="file";
jQuery(document).ready(function() {
	console.log("js初始化执行开始！");
	Page.init();
//	Record.init();
	console.log("js初始化执行完毕！");
});
/*================================================================================*/
var Record = function() {
	var userId=undefined;
	var userName=undefined;
	var initRecordStyle = function() {
	};
	var initRecordList = function(){
		getRecord();
	}
	var getRecord = function(){
	//	Metronic.startPageLoading({message: '正在查询中，请稍候...'});	//开始等待动画
		var id=$("#id").val();
		var existResultset=$("#exist_resultset").val();
		var url="../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=get_record&id="+id+"&exist_resultset="+existResultset;
		$.post(url,function(json){
			if(json.result_code==0){
				Record.userId=json.user_id;
				Record.userName=json.user_name;
				Page.showResult(json);
			}else{
			}
		//	Metronic.stopPageLoading();	//停止等待动画
		}).error(function(xhr,errorText,errorType){
	        alert('错误信息：'+errorText+",错误类型："+errorType);
	    });
	};
	var viewRecord=function(id){
		window.location.href="record_view.jsp?id="+id;
	};
	var deleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				$.post("../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
					if(json.result_code==0){
						var count=json.count;
						var amount=json.amount;
						window.location.reload();
						alert("已经从数据表删除该记录！");
					}
				})
			}
		}
	};
	var search=function(){
		page_form.submit();
	}
	return {
		init: function() {
			initRecordList();
			initRecordStyle();
		},
		deleteRecord:function(id){
			deleteRecord(id);
		},
		viewRecord:function(id){
			viewRecord(id);
		},
		search:function(){
			search();
		}
	};
}();//Record;
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
	var initPageStyle = function() {
        $('#time_from').datetimepicker({
            weekStart:1,
            todayBtn:1,
            autoclose:1,
            todayHighlight:1,
            startView:2,
            forceParse:0,
            showMeridian:1,
            format:'yyyy-mm-dd hh:ii:ss',
            Date:'yyyy-mm-dd hh:ii:ss'
        }).on('changeDate',function(e){
            var startTime = e.date;
            $('#time_to').datetimepicker('setStartDate',startTime);
        });
        $('#time_to').datetimepicker({
            weekStart:1,
            todayBtn:1,
            autoclose:1,
            todayHighlight:1,
            startView:2,
            forceParse:0,
            showMeridian:1,
            format:'yyyy-mm-dd hh:ii:ss',
            Date:'yyyy-mm-dd hh:ii:ss'
        }).on('changeDate',function(e){
            var endTime = e.date;
            $('#time_from').datetimepicker('setEndDate',endTime);
        });
	};
	var handleButtonEvent=function(){
		$('#submit_button').click(function() {Page.submitRecord();});
	};

	var submitRecord=function(){
	if(checkInput()==true){
        var album_id=$('#album_id').val();
        var album_info=$('#album_info').val();
        var path=$('#path').val();
        window.location.href="../xm13-minsu/"+module+"_"+sub+"_servlet_action?action=add_record&album_id="+album_id+"&album_info="+album_info+"&path="+path;
        }
	};
	var checkInput=function(){
		var bOk=true;
        var album_id=$("#album_id").val();
        var album_info=$("#album_info").val();
        if(album_id==null || album_id==""){
           window.alert("照片名不能为空！");bOk=false;
        }else if(album_info==null || album_info==""){
           window.alert("照片简介不能为空！");bOk=false;
       }
        return bOk;
	};
	var searchRecord=function(){
		submitRecord();
	};
	var confirmBack=function(){
		DraggableDialog.setId("confirm_back");
		DraggableDialog.setCancel(Page.onCancel);
		DraggableDialog.setButtonTitle("确定","取消");
		DraggableDialog.setOk(Page.returnBack);
		DraggableDialog.showMsg("确定要返回上一页吗？","提示");
	};
	var returnBack=function(){
		history.go(-1);
	};
	return {
		init: function() {
			initPageStyle();
			handleButtonEvent();
		},
		submitRecord:function(){
			submitRecord();
		},
		searchRecord:function(){
			searchRecord();
		},
		reload:function(){
			window.location.reload();
		}
	}
}();//Page
/*================================================================================*/
