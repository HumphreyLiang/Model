<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.submem.model.*"%>
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
    <%@ include file="leftbar.file" %>
    <%@ include file="ad.file" %>
    
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
                                        <cite>                                     			
                                       		<a href="<%=request.getContextPath()%>/front_end/diary/personalDiary.jsp?memNo=${diary.getMemNo()}">${memSvc.getOneMember(diary.getMemNo()).getMemSname()}</a>				 
                                        </cite>
                                    </footer>
                                </blockquote>
                            </div>
                         </div>
                            <div class="text-center ">
                            	<div class="row">
                            		<img src="<%=request.getContextPath()%>/front_end/diary/ShowImage?diano=${diary.diaNo}" style='height:auto;width:auto;display:${empty diary.diaImg ? "none":""};'></img>
                            	</div>
                            </div>   
							<!-- 新增留言區 -->
                            <div  class="panel-body" >	
                             	<div style="padding-top:10px ; ">
                            		<form action="<%=request.getContextPath()%>/front_end/diary/diaMsg.do" method=post style="display:inline;">
										<input type="hidden" name="diano" value="${ diary.diaNo }"> 
										<input type="hidden" name="action" value="insert">
										<input type="hidden" name="whichPage" value="<%= whichPage %>">
										<input type="hidden" name="backpath" value="<%= request.getServletPath() %>" >
										<textarea rows="2" cols="60" name="diamsgtext" placeholder="留言......" ></textarea>
										<input type="submit" value="送出" ><br>
									</form>
                            	</div>
							<!--  秀出留言區    -->                            		
                            		<c:forEach var="diamsg" items="${diaMsgSvc.getAllMsgFromDia(diary.diaNo)}">
                            			<div class="" id="msgall${diamsg.diaMsgNo}" style="border-top:1px black solid;">
                            				<div id="msg${diamsg.diaMsgNo}">
                            					<p style="margin:0px;">${diamsg.diaMsgText }</p>
                            				</div>	
	                            				<div class="text-right" >
	                            				    <fmt:formatDate value="${diamsg.diaMsgTime }" pattern="yyyy-MM-dd HH:mm:ss"/>	                            				
	                            					${memSvc.getOneMember(diamsg.memNo).getMemSname()}
<!-- 	                            					修改自己的留言區 -->
	                            					<c:if test="${ diamsg.memNo==member.memNo}">
															
															<input type="hidden"  id="dia${diamsg.diaMsgNo }" value="${ diamsg.diaMsgNo }"> 
															<input type="button" value="修改" id="btmod${diamsg.diaMsgNo }" >
															<input type="button" value="刪除" id="btdel${diamsg.diaMsgNo }">
														
														<script type="text/javascript">
															
															var diamsg${diamsg.diaMsgNo} = document.getElementById("dia${diamsg.diaMsgNo}");
										                	var btm${diamsg.diaMsgNo} = $('#btmod${diamsg.diaMsgNo}');
										                	var btd${diamsg.diaMsgNo} = $('#btdel${diamsg.diaMsgNo}');
										                	btm${diamsg.diaMsgNo}.click(function(){
											                		if(this.value=="修改"){
																		$('<textarea>').attr("cols","62").text($("#msg${diamsg.diaMsgNo}>p").text()).appendTo($('#msg${diamsg.diaMsgNo}'));
												                	
												                		$('#msg${diamsg.diaMsgNo}>p').remove();
												                		this.value = '確定';
												                		btd${diamsg.diaMsgNo}.val('取消');
											                		}else if(this.value=="確定"){
											                			
											                			$.ajax({ 
											            					url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
											            					data : {
											            						action : 'update',
											            						diamsgtext : $("#msg${diamsg.diaMsgNo}").find('textarea').val(),
											            						diamsgno : diamsg${diamsg.diaMsgNo}.value
											            						
											            					},
											            					type : 'POST',
											            					error : function(xhr) {
											            						alert('Ajax request 發生錯誤');
											            					},
											            					success : function(result) {
											            						
											            						var textarea = $("#msg${diamsg.diaMsgNo}").find('textarea');
											            						$('<p>').css("margin","0px").text(textarea.val()).appendTo($('#msg${diamsg.diaMsgNo}')); 										            						
											            						textarea.remove();
											            					}
											            				});
											            				this.value = "修改";
											            				btd${diamsg.diaMsgNo}.val('刪除');
											                		}	
												            	});
										                	btd${diamsg.diaMsgNo}.click(function(){
										                		if(this.value=="刪除"){
										                			$.ajax({ 
										            					url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
										            					data : {
										            						action : 'delete',
										            						diamsgno : diamsg${diamsg.diaMsgNo}.value	
										            					},
										            					type : 'POST',
										            					error : function(xhr) {
										            						alert('Ajax request 發生錯誤');
										            					},
										            					success : function(result) {
										            						 $("#msgall${diamsg.diaMsgNo}").remove();
										            						
										            					}
										            				});
										                		}else if(this.value=="取消"){
										                			var textarea = $("#msg${diamsg.diaMsgNo}").find('textarea');
								            						$('<p>').css("margin","0px").text(textarea.text()).appendTo($('#msg${diamsg.diaMsgNo}')); 										            						
								            						textarea.remove();
								            						
								            						this.value="刪除";
								            						btm${diamsg.diaMsgNo}.val("修改");
										                		}
										                		
										                		
										                	});
										                	
 	                									</script> 
	                            					</c:if>
	                            				</div>	                            				
                            			</div>
                            		</c:forEach>
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
                <%@ include file="bottom.file" %>
                
                
                
                
</body>
</html>