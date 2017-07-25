<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    DiaryService diaSvc = new DiaryService();
    List<Diary> list = diaSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Title Page</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/nav.css" rel="stylesheet">
    <link href="css/colorplan.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="css/date.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="css/frontend.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav id="emerald-nav" class="navbar navbar-light navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logo" href="index.html">寵物You&amp;Me</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="date.html">約會商品</a>
                    </li>
                    <li>
                        <a href="product.html">商城</a>
                    </li>
                    <li>
                        <a href="activity.html">活動</a>
                    </li>
                    <li>
                        <a href="diary.html">寵物日誌</a>
                    </li>
                </ul>
                <div class="nav collapse navbar-collapse navbar-right" id="login">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="about.html">購物車</a>
                        </li>
                        <li>
                            <a href="about.html">站內信</a>
                        </li>
                        <li>
                            <a href="services.html">會員專區</a>
                        </li>
                        <li>
                            <a href="contact.html">登出</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container-fluid matchnav">
        <div class="row ">
            <div class="col-xs-12 col-sm-2 postion-left-group ">
                <div id="menu">
                    <div class="panel list-group list-color">
                        <a href="#" class="list-group-item">最新日誌首頁</a>
                        <a href="#" class="list-group-item">我的日誌</a>
                        <a href="#" class="list-group-item" data-toggle="collapse" data-target="#sm1" data-parent="#menu">追蹤中的 
                         <span class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
                        <div id="sm1" class="sublinks collapse">
                            <a href="# " class="list-group-item small "> 會員1</a>
                            <a href="# " class="list-group-item small "> 會員2</a>
                            <a href="# " class="list-group-item small "> 會員3</a>
                            <a href="# " class="list-group-item small "> 會員4</a>
                            <a href="# " class="list-group-item small "> 會員5</a>
                        </div>
                        <a href="#" class="list-group-item">管理我的追蹤</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 ">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div id="carousel-id" class="carousel slide" data-ride="carousel">
                            <!-- 幻燈片小圓點區 -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-id" data-slide-to="0" class=""></li>
                                <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                                <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
                            </ol>
                            <!-- 幻燈片主圖區 -->
                            <div class="carousel-inner">
                                <div class="item">
                                    <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h1>哈囉</h1>
                                            <p>內文</p>
                                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h1>標題</h1>
                                            <p>內文？</p>
                                            <p><a class="btn btn-lg btn-primary" href="#" role="button">更多</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item active">
                                    <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h1>標題</h1>
                                            <p>內文</p>
                                            <p><a class="btn btn-lg btn-primary" href="#" role="button">詳細內容</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 上下頁控制區 -->
                            <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                            <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div>
                <h5 class="page-header text-right">目前位置:日誌首頁</h5>
                <%@ include file="page1.file" %> 
                <c:forEach var="diary" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                <div class="row">
                    <div class="panel panel-default col-sm-8 col-sm-offset-2 top-margin-sm">
                        <div class="">
                            <div class="panel-heading">
                                <h3 class="panel-title">${diary.diaName}</h3>
                                <h3 class="panel-title text-right">最後發表:<fmt:formatDate value="${empty diary.diaCreTime? diary.diaModTime:diary.diaCreTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
                            </div>
                            <div class="panel-body">
                                <blockquote class="blockquote">
                                    <p class="text-justify">${diary.diaText}</p>
                                    <footer class="text-right">posted by
                                        <cite>${diary.memNo}</cite>
                                    </footer>
                                </blockquote>
                            </div>
                         </div>
                            <div class="text-center ">
                            	<div class="row">
                            		<img src="<%=request.getContextPath()%>/ShowImage?diano=${diary.diaNo}" style='height:auto;width:auto;display:${empty diary.diaImg ? "none":""};'></img>
                            	</div>
                            </div>                     
                    </div>
                </div>
                </c:forEach>
                
<!--                 顯示頁數 -->
                <div class="text-center">
                <%@ include file="page2.file" %> 
<!--                     <ul class="pagination"> -->
<!--                         <li><a href="#">&laquo;</a></li> -->
<!--                         <li><a href="#">1</a></li> -->
<!--                         <li><a href="#">2</a></li> -->
<!--                         <li class="active"><a href="#">3</a></li> -->
<!--                         <li><a href="#">4</a></li> -->
<!--                         <li><a href="#">5</a></li> -->
<!--                         <li><a href="#">&raquo;</a></li> -->
<!--                     </ul> -->
                    <br>
<!--                     <ul class="pager"> -->
<!--                         <li><a href="#">前一頁</a></li> -->
<!--                         <li><a href="#">下一頁</a></li> -->
<!--                     </ul> -->
                </div>
                <div class="postion-left-group-b">
                    <footer>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="col-sm-3">
                                    <p>Copyright 寵物You&amp;Me 2017</p>
                                </div>
                                <div class="col-sm-3">
                                    <p>關於我們</p>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
                <a href="#">
                    <div class="" id="fixedbutton-talk">
                        <button class="button btn-lg btn-primary active">
                            交易聊天室
                        </button>
                    </div>
                </a>
            </div>
       </div>
     </div>   
</body>
</html>