jQuery(document).ready(function() {

	console.log("js初始化执行开始！");
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	Frame.init(module,sub);
	Page.init();
	console.log("js初始化执行完毕！");

});
var module="order";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
    var html="";
    var initData=function(){
        var id=$("#id").val();
        var url="../../"+module+"_"+sub+"_servlet_action?action=get_record&id="+id;
        console.log("生成的url："+url);
        $.post(url,function(json){
             console.log(JSON.stringify(json));
             showResult(json);
           //  initChardiv(json);
        });
    };
    var showResult=function(json){
        if(json!=null){
            var list=json.aaData;
            showRecordList(list);
        }
    };
    var showRecordList=function(list){
        for(var i=0;i<list.length;i++){
            showRecord(list[i]);
        }
        $("#record_list_div").html(html);
    };
    var showRecord = function(json){
        var status=json[12];
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var createTime=json[3];
        var orderUser=json[7];
        var userConnect=json[8];
        var orderID=json[1];
        html=html+"														<tr>";
        html=html+"                                             <td>"+orderID+"</td>";
        html=html+"                                             <td>"+createTime+"</td>";
        html=html+"                                             <td>"+orderType+"</td>";
        html=html+"                                             <td>"+beginTime+"</td>";
        html=html+"                                             <td>"+endTime+"</td>";
        html=html+"                                             <td>"+orderUser+"</td>";
        html=html+"                                             <td>"+userConnect+"</td>";
        html=html+"                                             <td>"+orderPrice+" &nbsp; ";
        if(status=="已支付"){
            html=html+"  <span class=\"label label-sm label-danger\">已支付</span>";
        }else{
            html=html+"  <span class=\"label label-sm label-info\">未支付</span>";
        }
        html=html+"</td>";
        html=html+"</tr>";
    };
    var initChardiv=function(){
       // console.log("sssddds:"+c1,c2,c3,c4,c5);
     //   console.log(json.toString());
        var c1=$("#c1").val();
        var c2=$("#c2").val();
        var c3=$("#c3").val();
        var c4=$("#c4").val();
        var c5=$("#c5").val();
        var chart;
        var id=$("#id").val();
        console.log(id);
        var chartData = [{
            country: "大床房",
            visits: c1
        }, {
            country: "标间",
            visits: c2
        }, {
            country: "豪华套间",
            visits: c3
        }, {
            country: "三人间",
            visits: c4
        }, {
            country: "商务间",
            visits: c5
        }];

        AmCharts.ready(function () {
            chart = new AmCharts.AmSerialChart();//创建一个AmSerialChart对象
            chart.dataProvider = chartData;//dataProvider 数据提供的对象 对应上面的json数据
            chart.categoryField = "country";//X轴上的值
            chart.startDuration = 1;

            //X轴
            var categoryAxis = chart.categoryAxis;
            //categoryAxis.labelRotation =45 ;//X轴下面值的角度

            //Y轴
            var graph = new AmCharts.AmGraph();
            graph.valueField = "visits";//柱形图显示的值
            graph.balloonText = "[[category]]: [[value]]";//鼠标放上所显示的
            graph.type = "column";//Y轴的类型 有line、column、step、smoothedLine、candlestick、ohlc
            graph.lineAlpha = 0;//border透明度
            graph.fillAlphas = 0.8;//柱子的透明度
            graph.lineColor = "#00FFFF";
            if(id==null) {
                chart.addGraph(graph);
                // console.log(id);
                chart.write("chartdiv");
            }
        });
    };
	return {
		init: function() {
            initData();
            initChardiv();
		}
	}
}();//Page
/*================================================================================*/
