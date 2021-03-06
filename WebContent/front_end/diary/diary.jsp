<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.submem.model.*"%>
<%@ page import="com.letter.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	
	DiaryService diaSvc = new DiaryService();
    List<Diary> list = diaSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>
<jsp:useBean id="diaMsgSvc" scope="page" class="com.diamsg.model.DiaMsgService"/>
<jsp:useBean id="submem" scope="page" class="com.submem.model.SubMemService"/>

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
	<link href="<%=request.getContextPath()%>/front_end/css/modern-business.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/front_end/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/front_end/css/fileinput-rtl.css"  rel="stylesheet" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/front_end/js/fileinput.js"  type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/front_end/themes/explorer/theme.js" type="text/javascript"></script>
<!-- 	<script src="https://code.jquery.com/jquery.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <!--[if lt IE 9]>
    	<script src="/js/html5shiv.js"></script>
  		<![endif]-->
</head>
<style>
.img-bg{
    opacity:1;
    background-color:#ccc;
    max-width: 100%;
    display: block;
    margin: 0 auto;
}
.memImg{
	height:34px;
	width:50px;
	max-height: 100%;
	max-width:100%;
	padding-right:0;
}
.padmarg{
	margin:0;
	padding:0;
}
.msg{
	background-color:#F5F5F5;
	margin-bottom:0;
}
.dia-msg{
	padding-right:0;
	padding-left:0;
	margin-bottom:0;
}

.msgmemimg{
	height:34px;
	width:35px;
	max-height: 100%;
	max-width:100%;
}

</style>

<body>
	<%@ include file="/front_end/frontEndNavBar.file"%>
    <%@ include file="leftbar.file" %>
    
    
    
    <div class="col-xs-12 col-sm-8 ">
       <div class="row">
          <h5 class="page-header"></h5>
          <%@ include file="page1.file" %> 
          
          <c:if test="${!empty member.memNo }">
          <%-- 錯誤表列 --%>
                <div class="row">
                	<div class=" col-sm-8 col-sm-offset-2">
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li>${message}</li>
								</c:forEach>
							</ul>
							</font>
						</c:if>
                	</div>
                </div>
                <div class="row"  >
                	<div class="col-sm-8 col-sm-offset-2 top-margin-sm">
                	  <div class="row">
<!--                 	此為新增日誌區 -->
						<form class="form-group" action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data">
							
							<input type="hidden" name="action" value="insert">
							<div class="input-group">
								<label class="input-group-addon">日誌</label>
								<input type="text" name="dianame" class="form-control" placeholder="Wirte down your title."><br>
							</div>
							<textarea name="diatext" style="resize:none;height:80px;" class="form-control" placeholder="What's on your mind, ${memSvc.getOneMember(member.getMemNo()).getMemSname()}?"></textarea>
							<input type="file" class="file" name="diaimg" >
							<p>
							<div  class="">	
								<input type="submit" class="btn btn-primary btn-block" value="確定">
							</div>
							</p>
						</form>
					  </div>
                	</div>
                </div>
          		</c:if>
          
          
          <c:forEach var="diary" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
             <div class="row">
                <div class="panel panel-default col-sm-8 col-sm-offset-2 top-margin-sm dia-msg">
                   <div class="panel">
                      <div class="panel-heading" >
                          <div class="row">
                        	  <div class="col-sm-10" >                        		
			                      <div class="panel-heading" style="border-bottom:1px #a9a9a9 solid;padding-left:0;">
			                         <img src="<%=request.getContextPath()%>/front_end/images/footprint-shape.png" >
			                         <span class="panel-title" >${diary.diaName}</span>
			                      </div>
	                      	  </div>
	                      	  <div class="col-sm-2" style="padding-left:0;">
	                      	   <div class="row">
	                      	   <c:if test="${ member.memNo == diary.memNo }">
		                      	    <div class="col-sm-7" style="width:55px;">       	    
									<!-- 修改日誌的部分 -->
		                        		<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data" >
				                        	<input type="hidden" name="action" value="getOne_For_Update">
				                        	<input type="hidden" name="diano" value="${diary.diaNo}">
											<input class="btn btn-info btn-xs" type="submit" value="修改">
										</form>
									</div>
									<div class="col-sm-5 " style="padding-left:0;">
									<!-- 刪除日誌的部分 -->
										<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data" >
				                        	<input type="hidden" name="action" value="delete">
				                        	<input type="hidden" name="diano" value="${diary.diaNo}">
											<input class="btn btn-danger btn-xs" type="submit" value="刪除"><br>
										</form>
									</div>
								</c:if>	
							   </div>	
                              </div>
                          </div>
                      </div>
                      <div class="panel-body">                       
		                   <div class="col-sm-2 memImg" >
		                      <img class="memImg" src="<%=request.getContextPath()%>/front_end/member/MemImgReader2.do?memNo=${diary.getMemNo()}">
		                   </div>
		                   <div class="col-sm-10 padmarg">
		                      <a href="<%=request.getContextPath()%>/front_end/diary/personalDiary.jsp?memNo=${diary.getMemNo()}" style="color:#191970;font-weight:bold;">${memSvc.getOneMember(diary.getMemNo()).getMemSname()}</a>
		                      <div style="font-size:10px;color:#BC8F8F;"><fmt:formatDate value="${empty diary.diaCreTime? diary.diaModTime:diary.diaCreTime}" pattern="HH:mm:ss yyyy/MM/dd"/></div>
		                   </div>		                	 
	                  </div> 
                      <div class="panel-body" style="margin-top:10px;">
                         <blockquote class="blockquote">
                           <p class="text-left">${diary.diaText}</p>                     
                          </blockquote>
                       </div>		
	                  <div class="panel-body"> 
	                      <div class="text-center">
	                         <c:if test="${diary.diaImgExtName =='image' }" var="imgformat">
	                         <img src="<%=request.getContextPath()%>/front_end/diary/ShowImage?diano=${diary.diaNo}" style='height:auto;width:540px;display:${empty diary.diaImg ? "none":""};'></img>
	                         </c:if>
	                         <c:if test="${!imgformat }">
	                         <div style="max-height: auto;max-width:540px;" >
								<video controls style="max-height: 80%;max-width: 80%;">
									<source src="<%=request.getContextPath() %>/front_end/diary/DiaryVideo?diano=${diary.diaNo}" type="video/mp4" alt="您的瀏覽器不支援此撥放程式!!">
								</video>
							 </div>	                         
	                      	 </c:if>
	                      </div>
	                  </div>  
                   </div>
                   <%@ include file="diamsg.file" %>
                </div>                
             </div>
          </c:forEach>
               
<!--                 顯示頁數 -->
                <div class="text-center">               	   
                <%@ include file="page2.file" %> 
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li class="active"><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                    <br>
                    <ul class="pager">
                        <li><a href="#">前一頁</a></li>
                        <li><a href="#">下一頁</a></li>
                    </ul>
                </div>
                <%@ include file="/front_end/frontEndButtom.file"%>
        </div>
    </div>     
		
	         
        
   
</body>
</html>