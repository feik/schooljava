<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.vo.*,com.dao.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="js/layui/css/layui.css"  media="all">
  <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.tree.js"></script>
<script type="text/javascript">
$(function(){
	$('#files').tree({
		expanded: 'li:first'
	});
});
</script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<style type="text/css">
body{
height:100%;
}
.rigmax{width:100%;height:474px;overflow: auto;}
.lefts{width:16%;height:440px;position: relative;float: left;border:1px solid #b7d5df;overflow:auto;}
.divrig{width:100%;height:435px;}

a,img{border:0;}
#files{width:100%;}
.tree,.tree ul,.tree li{list-style:none;margin:0;padding:0;zoom: 1;}
.tree ul{margin-left:8px;}
.tree li a{color:#555;padding:.1em 7px .1em 27px;display:block;text-decoration:none;background:url(images/icon-file.gif) 5px 50% no-repeat;}
.tree li a.tree-parent{background:url(images/icon-folder-open.gif) 5px 50% no-repeat;}
.tree li a.tree-parent-collapsed{background:url(images/icon-folder.gif) 5px 50% no-repeat;}
.tree li a:hover,.tree li a.tree-parent:hover,.tree li a:focus,.tree li a.tree-parent:focus,.tree li a.tree-item-active{color:#000;border:1px solid#eee;background-color:#fafafa;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;}
.tree li a:focus,.tree li a.tree-parent:focus,.tree li a.tree-item-active{border:1px solid #e2f3fb;background-color:#f2fafd;}
.tree ul.tree-group-collapsed{display:none;}
.rigtop{width:100%;height:30px;border-bottom: 1px solid #b7d5df;text-align: center;line-height:30px;}
.layui-btn{ height: 30px;line-height: 30px;}
.layui-table, .layui-table-view {margin: 0;height: 440px;}
</style>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>	
<script type="text/javascript" src="js/jquery.tree.js"></script>	
<script type="text/javascript">
$(function(){
	$('#files').tree({
		expanded: 'li:first'
	});
});
</script>	
<style>
th .layui-table-cell,td {text-align:center;}
.rigtop { width: 1156px; height: 40px;border: 1px solid #b7d5df;line-height: 40px;margin:auto;margin-top:5px;}
.layui-btns {width: 100px;height: 32px;line-height: 32px;position:relative;float:right;border-radius: 20px;top:5px}
.divtable{width:1145px;margin:auto;margin-top:-5px;}
.input{width:275px;}
</style>
</head>
<body>	
<div class="place" >
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">个人设置</a></li>
    <li><a href="#">班级设定</a></li>
    </ul>
</div>
<div class="rigmax">
<div class="rigtop">
<a >当前选中:韦邦杠</a>
<button class="layui-btn layui-btn-normal layui-btns" data-type="getCheckData">添加新记录</button>
</div>
<div class="lefts">


</div>
<div class="divrig">

<table id="demo" lay-filter="test"></table>
</div>
</div>
 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 430
    ,url: 'Stulnfo' //数据接口
    ,cellMinWidth: 80
    ,page: true //开启分页
    ,cols: [[ //表头
    	{type:'numbers', fixed: 'left',title: '序号',width:80, align:'center'}
        ,{field: 'classname', title: '班级名称', width:150, sort: true, align:'center'}
        ,{field: 'classtime', title: '开班日期', width:160, align:'center'}
        ,{field: 'time', title: '上课时间', width:160, align:'center'}
        ,{field: 'state', title: '状态',width:150, align:'center'}
        ,{field: 'right', title: '操作', align:'center',width:265, toolbar: '#barDemo'}
    ]]
  });
  
});
</script>
</body>
</html>