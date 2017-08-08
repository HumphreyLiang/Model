<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	
	
    
%>

<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Title Page</title>
    <link href="<%=request.getContextPath()%>/front_end/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/nav.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/colorplan.css" rel="stylesheet"> 
    <link href="<%=request.getContextPath()%>/front_end/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/frontend.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
</head>
<body>
	<%@ include file="navbar.file" %>
    
    <div class="container-fluid matchnav">
        <div class="row ">
            <div class="col-xs-12 col-sm-2 postion-left-group ">
                <div id="menu">
                    <div class="panel list-group list-color">
                        <a href="" class="list-group-item">收信匣</a>
                        <a href="" class="list-group-item">選取標註</a>                        	                  
                        <a href="" class="list-group-item">未讀取信</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
                <div class="row">
                    <div class="panel panel-default col-sm-8 col-sm-offset-2 top-margin-sm">
                        <h5 class="page-header text-right">目前位置:站內信</h5>
                        <div class="">
                            <div class="panel-heading">
                                <h3 class="panel-title"></h3>
                                <h3 class="panel-title text-right">最後</h3>
                            </div>
                            <div class="panel-body">
                                <blockquote class="blockquote">
                                    <p class="text-justify"></p>
                                    <footer class="text-right">posted by
                                        <cite>                                     			
                                       					 
                                        </cite>
                                    </footer>
                                </blockquote>
                            </div>
                         </div>
                      </div>
                  </div>                 

                
                <%@ include file="bottom.file" %>
                
                
                
                
</body>
</html>