<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE html>
<html>
    <head>
    <base href="<%=basePath%>" /> 
         <title>中国银行用户画像系统</title>
         <!-- Bootstrap -->
    <link href="js/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
     <link href="js/jqcloud/jqcloud.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery/jquery-3.1.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="js/echarts/echarts.js"></script>
	<script src="js/jqcloud/jqcloud-1.0.4.js"></script>
	<script type="text/javascript">
      /*!
       * Create an array of word objects, each representing a word in the cloud
       */
      var word_array = [
          {text: "标题党", weight: 15},
          {text: "手机控", weight: 9, link: "http://jquery.com/"},
          {text: "IT屌丝", weight: 6, html: {title: "I can haz any html attribute"}},
          {text: "文艺青年", weight: 7},
          {text: "Amet", weight: 5}
          // ...as many words as you want
      ];
		$(function(){
			$.get("bd/getWordCloud?userId=${userId}",function(data,status){
			    $("#wordCloud").jQCloud(data);
			  });
			
		});
    </script>
	<style>
     body{
		background-color:#168;
	}
	h1{
		color:#fff;
	}
	#wordCloud{
		background-color:#168;
	}
    </style>
    </head>
    <body>
    	
    <div class="container"> 
    <div class="row" > 
        <div class="col-lg-6 col-lg-offset-4"> 
            <h1>中国银行用户画像系统</h1>
            
        </div> 
    </div> 
    <div class="row" > 
        <div class="col-lg-6 col-lg-offset-4"> 
           <form action="bd/showPersona"  class="form-inline" role="form">
           <div class="form-group">
        	<label class="sr-only" for="userId">用户ID:</label>
        	<input type="text" class="form-control  input-lg" id="userId" name="userId" value="${userId}" placeholder="请输入用户ID">
    	   </div>
            <button type="submit" class="btn btn-primary btn-lg">
            <span class="glyphicon glyphicon-search"></span>查询
            </button>
           </form>
        </div> 
    </div>
    <div class="row" > 
        <div class="col-lg-4"> 
            <div id="radar" style="height:400px;"></div>
        </div> 
        <div class="col-lg-4"> 
            <div id="wordCloud" style="height:400px;"></div>
        </div> 
        <div class="col-lg-4"> 
            <div id="gauge" style="height:400px;"></div>
        </div> 
    </div> 
	</div>
        <script type="text/javascript">
        var scores=new Array();
		<c:forEach var = "score" items = "${result.scores }">
    		scores.push(${score});
		</c:forEach>

     // 基于准备好的dom，初始化echarts实例
        var myRadar = echarts.init(document.getElementById('radar'));
        var myGauge = echarts.init(document.getElementById('gauge'));
        // 指定图表的配置项和数据
        var myRadarOption = {
        		backgroundColor: '#168',
        		title: {
        	        text: '信用雷达图'
        	    },
        	    tooltip: {},//提示
        	    legend: {//图例
        	    	show:false,
        	    	bottom: 5,
        	        data: ['用户名'],
        	        textStyle: {
        	            color: '#fff',
        	            fontSize: 14
        	        }
        	    },
        	    radar: {
        	        //shape: 'circle',形状
        	        splitNumber: 1,
        	        indicator: [
        	           { name: '个人属性', max: 6500},
        	           { name: '资产信息', max: 16000},
        	           { name: '负债信息', max: 30000},
        	           { name: '社会关系', max: 38000},
        	           { name: '行为偏好', max: 52000}
        	        ],
        	        name: {//项目名
        	            textStyle: {
        	                color: 'rgb(238, 197, 192)'
        	            }
        	        },
        	        center: ['50%','50%'],//雷达图相对位置
                    radius: 100,//雷达图半径
        	        splitLine: {//分割线
        	            lineStyle: {
        	                color: [
        	                    'rgba(238, 197, 192, 0.1)', 'rgba(238, 197, 192, 0.2)',
        	                    'rgba(238, 197, 192, 0.4)'
        	                ].reverse()
        	            }
        	        },
        	        splitArea: {//分割块
        	            show: false
        	        },
        	        axisLine: {//连接线
        	            lineStyle: {
        	                color: 'rgba(238, 197, 192, 0.5)'
        	            }
        	        }
        	    },
        	    series: [{//数据
        	        name: '用户名',
        	        type: 'radar',
        	        // areaStyle: {normal: {}},
        	        data : [
        	            {
        	                value : scores,
        	                name : '用户名'
        	            }
        	        ],
        	        itemStyle: {
                        normal: {
                            color: '#fee'
                        }
                    },
                    areaStyle: {
                        normal: {
                            opacity: 0.5
                        }
                    }
        	    }]
        };
        var myGaugeOption = {
        		backgroundColor: '#168',
        		title: {
        	        text: '信用分'
        	    },
        		tooltip : {
        	        formatter: "{a} <br/>{b} : {c}"
        	    },
        	    toolbox: {
        	        feature: {
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    },
        	    series: [
        	        {
        	            name: '个人信用',
        	            type: 'gauge',
        	            z: 3,
        	            min: 350,
        	            max: 950,
        	            splitNumber: 12,
        	            startAngle: 200,//起始度
        	            endAngle: -20,//结束度
        	            center: ['50%', '50%'],    // 默认全局居中
        	            radius: '80%',//仪表盘半径
        	            axisLine: {            // 坐标轴线
        	                lineStyle: {       // 属性lineStyle控制线条样式
        	                	color: [[0.167, '#FF6600'],[0.33, '#CC9933'],[0.667, '#CC00CC'],[0.83, '#9900FF'],[1, '#99FF66']],//颜色占比
        	                    width: 10
        	                }
        	            },
        	            axisTick: {            // 坐标轴小标记
        	                length: 15,        // 属性length控制线长
        	                lineStyle: {       // 属性lineStyle控制线条样式
        	                    color: 'auto'
        	                }
        	            },
        	            axisLabel: {
        	                formatter:function(v){
        	                    switch (v + '') {
        	                        case '400' : return '较差';
        	                        case '500' : return '中等'
        	                        case '650' : return '良好';
        	                        case '800' : return '优秀';
        	                        case '900' : return '极好';
        	                        default:return v;
        	                    }
        	                }
        	            },
        	            splitLine: {           // 分隔线
        	                length: 20,         // 属性length控制线长
        	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
        	                    color: 'auto'
        	                }
        	            },
        	            pointer: {//指针大小
        	                width:5
        	            },
        	            title : {
        	                offsetCenter: [0, '-50%'],       //相对圆心 x, y，单位px
        	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        	                    fontWeight: 'bolder',
        	                    fontSize: 15,
        	                    fontStyle: 'italic',
        	                    color:'#FFFFCC'
        	                }
        	            },
        	            detail : {
        	            	offsetCenter: [0, '25%'], 
        	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        	                    fontWeight: 'bolder',
        	                    fontSize:20,
        	                    color:'#FFFFCC'
        	                },
        	                formatter:function(v){
        	                	if(v<450)return v+'\n信用较差';
        	                	if(v>=450&&v<550)return v+'\n信用中等';
        	                	if(v>=550&&v<750)return v+'\n信用良好';
        	                	if(v>=750&&v<850)return v+'\n信用优秀';
        	                    if(v>=850)return v+'\n信用极好';
        	                    else return v;
    
    	                    }
    	                	
        	            },
        	            data:[{value: ${result.score}, name: '信用分'}]
        	        }
        	    ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myRadar.setOption(myRadarOption);
        myGauge.setOption(myGaugeOption);
                    
    </script>   
    </body>
</html>