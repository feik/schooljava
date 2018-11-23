<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>年级信息</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="js/layui/css/layui.css"  media="all">
  <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<style>
th .layui-table-cell,td {text-align:center;}
.rigtop { width: 1143px; height: 40px;border: 1px solid #b7d5df;line-height: 40px;margin:auto;margin-top:5px;}
.layui-btns {width: 100px;height: 32px;line-height: 32px;position:relative;float:right;border-radius: 20px;top:5px}
.divtable{width:1145px;margin:auto;margin-top:-5px;}
.rigtop a{font-size:14px;}
.input{width:275px;}
</style>
</head>
<body>  
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">选课方向管理</a></li>
    <li><a href="#">选课信息</a></li>
    </ul>
    </div>
   <div class="rigtop">
    	<div class="layui-form-item layui-form">
   		<div class="layui-inline">
			    <label class="layui-form-label">姓名:</label>
			      <div class="layui-input-inline">
			        <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
			      </div>
  		</div>
  		<button class="layui-btn layui-btn-normal layui-btns"  id="subs">查询</button>
    </div>
    </div>
    <div class="divtable">
<table id="demo" lay-filter="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
var table=null;
var form=null;
layui.use(['table','form'], function(){
	table= layui.table;
	form=layui.form;
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 471
    ,page:true
    ,cellMinWidth: 120
    ,url: 'Attendance?action=select' //数据接口
    ,cols: [[ //表头
    	{type:'numbers', title: '序号'}
      ,{field: 'aclasss', title: '班级',align:'center'}
      ,{field: 'astudentid', title: '学号',align:'center'}
      ,{field: 'adate', title: '日期',align:'center'}
      ,{field: 'acourseName', title: '课程名称',align:'center'}
      ,{field: 'aoperator', title: '操作员',align:'center'}
      ,{field: 'aattendanceType', title: '出勤类型',align:'center'}
      ,{field: 'anote', title: '备注',align:'center'}
      ,{field: 'right', title: '操    作',width:'178', align:'center',  toolbar: '#barDemo'}
    ]]
  });
//监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
});

</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
});
</script>
<script>
$("#insert").click(function(){
	layer.open({
		type:1
		,title:"添加年级"
		,content:$("#form")
		,area:['500px','300px']
	 ,btn: ['添加', '取消'] //只是为了演示
    ,yes: function(){
    	$.ajax({
    		type:"get"
    		,url:"Grade?action=add"
    		,data:{
    			GName:$("#Tname").val(),
    			GNote:$("#TMremarks").val()
    			}
    		,success:function(data){
    			if(data>0){
    				//关闭
    				 layer.closeAll();
    				layer.msg("添加成功");
    				//重载
    				table.reload('demo', {
    			        page: {
    			          curr: 1 //重新从第 1 页开始
    			        }
    				});
    				//清空
    				empty();
    				}
    			else{
    				layer.msg("添加失败");
    			}
    		}
    	});
    }
    ,btn2: function(){
      layer.closeAll();
      empty();
    }
	});
	});
function empty(){
	$("#Tname").val("");
	$("#TMremarks").val("");
}
</script>
<form class="layui-form" style="background-color: ghostwhite;" id="form" hidden="hidden">
	<table>
	<tr><td><div style="height:30px"></div></td></tr>
		<tr>
			<td><div class="layui-form-item">
			    <label class="layui-form-label" style="font-size:18px" >年级名称:</label>
			      <div class="layui-input-inline">
			        <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input input">
			      </div>
  			</div></td>
		</tr>
		<tr>
			<td><div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="font-size:18px">备注:</label>
			    <div class="layui-input-inline">
			      <textarea placeholder="请输入内容" class="layui-textarea input"></textarea>
			    </div>
			  </div></td>
		</tr>
	</table>
</form>
				
</body>
</html>