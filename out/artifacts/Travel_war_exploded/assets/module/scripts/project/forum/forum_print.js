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
var module="project";
var sub="forum";
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
        var id = json[0];
        //var image = "../../assets/module/img/public/wkbj.jpg";
        var title = json[1];
        var content = json[2];
        //var createTime = json[3];
        //var status = json[4];
        var type=json[3];
        var createTime = json[4];
        var status = json[6];
        var me = json[10];

        html = html + "						<tr>";
        html = html + "																<td>"+title+"</td>";
        html = html + "																<td>" +content+"</td>";
        html = html + "																<td>" + createTime+ "</td>";
        html = html + "																<td>" +type+ "</td>";
        html = html + "																<td>" +status+ "</td>";
        //if (me == "1")
        //{
        //	html = html + "													<td><div><button  type=\"button\" class=\"btn red\" onclick=\"Page.deleteRecord(" + id + ");\">删除</button>";
        //	html = html + "													<button  type=\"button\" class=\"btn blue\" onclick=\"Page.modifyRecord(" + id + ");\">修改</button>";
        //}
        //html = html + "														<button  type=\"button\" class=\"btn green\" onclick=\"Page.viewRecord(" + id + ");\">详细信息</button>";
        //html = html+"                                                        </td>";
        //html = html + "														</td>";
        //html = html + "						</tr>";

        html=html+"														</tr>";
        //html上面几句删除了应有的分号
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
