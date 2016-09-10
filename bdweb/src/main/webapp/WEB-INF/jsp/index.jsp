<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery/jquery-3.1.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<style>
     body{
		background-color:#CCFFFF;
	}
	h1{
		margin-top:100px;
		margin-bottom:30px;
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
        	<input type="text" class="form-control  input-lg" id="userId" name="userId" placeholder="请输入用户ID">
    	   </div>
            <button type="submit" class="btn btn-primary btn-lg">
            <span class="glyphicon glyphicon-search"></span>查询
            </button>
           </form>
        </div> 
    </div>
	</div>
    </body>
</html>