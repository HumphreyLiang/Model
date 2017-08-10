<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member.model.*"%>
<%@ page import="com.letter.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Member member = (Member)session.getAttribute("member");
	LetterService ltrSvc = new LetterService();
	List<Letter> list = ltrSvc.getTagLtrs(member.getMemNo());
	pageContext.setAttribute("listFromMem", list);
	
%>

<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>


<html lang="">
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
<body >
	
	
 	<%@ include file="navbar.file" %> 
    
        
    <div class="container-fluid" >
    	<div class="row">    
            <div class="col-xs-12 col-sm-2 postion-left-group">
                <div id="menu">
                    <div class="panel list-group list-color">
                        <a href="<%=request.getContextPath()%>/front_end/letter/index_letter.jsp" class="list-group-item">收信匣</a>
                        <a href="<%=request.getContextPath()%>/front_end/letter/index_tagLetter.jsp" class="list-group-item">選取標註</a>                        	                  
                        <a href="<%=request.getContextPath()%>/front_end/letter/index_notRead.jsp" class="list-group-item">未讀取信</a>
                    </div>
                </div>
            </div>
    
    
			<div class="col-xs-12 col-sm-8" style="margin-top:50px;" >
                <h5 class="page-header text-right">目前位置:站內信首頁</h5>
                 <div class="row" style="overflow-y:scroll;overflow-x:hidden;height:500px;" >                	
                    <div class="panel panel-default text-center " >                   
                        <div class="">                        
                         
                            <div class="panel-body">
                                <table border='0' bordercolor='#CCCCFF' width='850'>
										<tr >
											<th class="text-center">信件狀態</th>
											<th class="text-center">信件標註</th>
										
											<th class="text-center">信件內文</th>
											<th class="text-center">寄件時間</th>
										</tr>
									<c:forEach var="ltr" items="${listFromMem}">
										<tr >
											<td>${ltr.letterState}</td>	
											<td>${ltr.letterTag}</td>	
												
											<td>${ltr.letterText}</td>	
											<td><fmt:formatDate value="${ltr.letterTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>										
										</tr>
									</c:forEach>										
								</table>
                            </div>
                         
                                               
                         </div>                                
                    </div>                
                </div>

            </div>
       </div>
     </div>
                
                
                
</body>
</html>