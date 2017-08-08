<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.lettertype.model.*"%>
<%@ page import="java.util.*"%>


<%
	Emp emp = (Emp) session.getAttribute("emp");
	pageContext.setAttribute("emp", emp);
	List<Integer> auth = (List<Integer>) session.getAttribute("auth");
	pageContext.setAttribute("auth", auth);	
%>

<jsp:useBean id="ltrTypeSvc" scope="page" class="com.lettertype.model.LetterTypeService"/>



<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link href="<%=request.getContextPath()%>/back_end/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/back_end/css/nav.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/back_end/css/colorplan.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/back_end/css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/back_end/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/back_end/css/backend.css" rel="stylesheet">
</head>

<body>
	<nav id="emerald-nav" class="navbar navbar-light navbar-fixed-top"
		role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" href="<%=request.getContextPath()%>/back_end/index_backend.jsp">寵物You&amp;Me</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				</ul>
				<div class="nav collapse navbar-collapse navbar-right" id="login">
					<ul class="nav navbar-nav">
						<c:if test="${emp!=null}">
							<li><a
								href="<%=request.getContextPath()%>/back_end/emp/EmpLogout.do">管理員登出</a></li>
						</c:if>
						<c:if test="${emp==null}">
							<li><a
								href="<%=request.getContextPath()%>/back_end/emp/empLogin.jsp">管理員入</a></li>
						</c:if>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
				<!-- /.container -->
	</nav>


			<div class="col-xs-12 col-sm-2 postion-left-group-b">
				<div id="menu">
					<div class="panel list-group list-color">

						<a href="<%=request.getContextPath()%>/back_end/index_backend.jsp" class="list-group-item">後端首頁</a>

						<c:if test="<%=(((List) pageContext.getAttribute(\"auth\")) != null)%>">

							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4001))%>">
								<%-- 						<% if (((List)pageContext.getAttribute("auth")).contains(1)) {%> --%>
								<a href="#" class="list-group-item" data-toggle="collapse"
									data-target="#sm1" data-parent="#menu">前端看板管理 <span
									class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
								<div id="sm1" class="sublinks collapse">
									<a href="#" class="list-group-item small"> 幻燈片管理</a> <a
										href="#" class="list-group-item small"> 最新消息管理</a>
								</div>
								<%-- 						<% } %> --%>
							</c:if>

							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4002))%>">
								<a href="#" class="list-group-item" data-toggle="collapse"
									data-target="#sm2" data-parent="#menu">會員帳號管理 <span
									class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
								<div id="sm2" class="sublinks collapse">
									<a href="<%=request.getContextPath()%>/back_end/member/memManage.jsp" class="list-group-item small"> 一般會員管理</a> <a
										href="#" class="list-group-item small"> 餐廳會員管理</a>
								</div>
							</c:if>


							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4003))%>">
								<a href="#" class="list-group-item" data-toggle="collapse"
									data-target="#sm3" data-parent="#menu">商城管理 <span
									class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
								<div id="sm3" class="sublinks collapse">
									<a href="#" class="list-group-item small"> 商品管理</a> <a href="#"
										class="list-group-item small"> 訂單管理</a>
								</div>
							</c:if>


							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4004))%>">
								<a href="#" class="list-group-item" data-toggle="collapse"
									data-target="#sm4" data-parent="#menu">檢舉申訴管理 <span
									class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
								<div id="sm4" class="sublinks collapse">
									<a href="#" class="list-group-item small"> 約會商品檢舉管理</a> <a
										href="#" class="list-group-item small"> 約會商品申訴管理</a>
								</div>
							</c:if>


							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4005))%>">
								<a href="#" class="list-group-item" data-toggle="collapse"
									data-target="#sm5" data-parent="#menu">權限管理 <span
									class="glyphicon glyphicon-triangle-bottom pull-right"></span></a>
								<div id="sm5" class="sublinks collapse">


									<a href="<%=request.getContextPath()%>/back_end/emp/authManage.jsp" class="list-group-item small"> 管理員權限管理</a> <a
										href="<%=request.getContextPath()%>/back_end/emp/empRegister.jsp"
										class="list-group-item small"> 註冊新管理員</a>
								</div>
							</c:if>


							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4006))%>">
								<a href="#" class="list-group-item">活動審核</a>
							</c:if>
							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4007))%>">
								<a href="#" class="list-group-item">餐廳審核</a>
							</c:if>
							<c:if
								test="<%=(((List) pageContext.getAttribute(\"auth\")).contains(4008))%>">
								<a href="#" class="list-group-item">管站內信管理</a>
							</c:if>


						</c:if>



					</div>
				</div>
			</div>





			<div class="col-xs-12 col-sm-8">


				<h5 class="page-header text-right">目前位置:站內信首頁</h5>


				<div class="panel panel-default  text-center">
					<div class="panel-heading">
						<h3 class="panel-title">管理站內信區</h3>						
					</div>
					<div class="panel-body text-left" style="padding-bottom:0px;">
						<a href='#modal-id' data-toggle="modal" class="btn btn-primary">新增種類</a>
							<div class="modal fade" id="modal-id">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<div class="modal-title"><textarea cols="70" id="insname" placeholder="種類名稱......">哈哈</textarea></div>
										</div>
										<div class="modal-body">
											<textarea cols="80" rows="5" id="instext" placeholder="新增內文......">你好</textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" data-dismiss="modal" id="checkval" >送出新增</button>
										</div>
									</div>
								</div>
							</div>					
					</div>
					<div class="panel-body">
					
						<table border='1' bordercolor='#CCCCFF' width='780' id="typetab">
							<tr >
								<th class="text-center">種類編號</th>
								<th class="text-center">種類名稱</th>
								<th class="text-center">種類內文</th>
								<th class="text-center">按鈕</th>
							</tr>
						<c:forEach var="ltrtype" items="${ltrTypeSvc.getAll()}">
							<tr >
								<td>${ltrtype.letterTypeNo}</td>	
								<td>${ltrtype.letterTypeName}</td>	
								<td>${ltrtype.letterTypeText}</td>	
								<td><input type="button" value="修改" class="btn btn-info" onclick="update(this);" ></td>
							</tr>
						</c:forEach>
							<tr id="insert"></tr>
						</table>
					</div>
				</div>
			</div>

			<script src="https://code.jquery.com/jquery.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
			<script type="text/javascript">
			$('#checkval').click(function(){
				if($("#insname").val()==""){
					alert("名稱不能空白");
				}else if($('#instext').val()==""){
					alert("內文不能空白");
				}else{
					insert();
				}
			});
			function insert(){
								
				$.ajax({
					url:"<%=request.getContextPath()%>/back_end/letter/letterType.do",
					data:{
						action : 'insert',
						lettertypename: $('#insname').val(),
						lettertypetext: $('#instext').val()						
					},
					type:'POST',
					dataType : 'text',
					error : function(xhr) {
						alert('Ajax request 發生錯誤');
					},
					success: function(data) {
						var obj = JSON.parse(data);//轉成json格式				
						$('<td>').appendTo($('#insert')).text(obj.curr);
						$('<td>').appendTo($('#insert')).text($("#insname").val());
						$('<td>').appendTo($('#insert')).text($("#instext").val());
						$('<td>').appendTo($('#insert')).attr("id","newbtn");
						$('<input>').attr({"type":"button","value":"修改","class":"btn btn-info","onclick":"update(this);"}).appendTo($('#newbtn'));						
						$('#insert').removeAttr('id');
						$('#newbtn').removeAttr('id');
						$('<tr>').appendTo($('#typetab')).attr("id","insert");						
					}
				});			
			}
			
			function update(e){
				var modupda = $(e).parent(); //td
				//一次只能修改一個
				modupda.parent().prevAll().children().find('input').attr({"class":"btn disabled","onclick":""});
				modupda.parent().nextAll().children().find('input').attr({"class":"btn disabled","onclick":""});
		
				var name = modupda.prev().prev().text();
				var txt = modupda.prev().text();
				if($(e).val()=='修改'){					
					//type Name 的修改
					modupda.prev().prev().text("");
					$('<textarea>').text(name).attr("id","modname").appendTo(modupda.prev().prev());
							
					//type Text 的修改
					modupda.prev().text("");
					$('<textarea>').text(txt).attr("id","modtext").appendTo(modupda.prev());
					
					$(e).val("確定");
					$(e).attr("class","btn btn-success");
					$('<input>').attr({"type":"button","value":"取消","onclick":"cancal(this);","class":"btn btn-warning"}).appendTo(modupda);
					
				}else if($(e).val()=='確定'){
					$.ajax({
						url:"<%=request.getContextPath()%>/back_end/letter/letterType.do",
						data:{
							action : 'update',
							lettertypeno : modupda.prev().prev().prev().text(),
							lettertypename: $('#modname').val(),
							lettertypetext: $('#modtext').val()						
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request 發生錯誤');
							},
						success : function(result) {
							modupda.prev().prev().text($('#modname').val());
							modupda.prev().text($('#modtext').val());
							$('#modname').remove();
							$('#modtext').remove();
							$(e).val('修改');
							$(e).attr("class","btn btn-info");
							$(e).next().remove();	
							modupda.parent().prevAll().children().find('input').attr({"class":"btn btn-info","onclick":"update(this);"});
							modupda.parent().nextAll().children().find('input').attr({"class":"btn btn-info","onclick":"update(this);"});
						}
					});			
				}	
			}
			function cancal(e){
				var modupda = $(e).parent(); //td
				modupda.prev().prev().text($('#modname').text());
				modupda.prev().text($('#modtext').text());
				$('#modname').remove();
				$('#modtext').remove();
				$(e).prev().val('修改');	
				$(e).prev().attr("class","btn btn-info");
				$(e).remove();	
				
				modupda.parent().prevAll().children().find('input').attr({"class":"btn btn-info","onclick":"update(this);"});
				modupda.parent().nextAll().children().find('input').attr({"class":"btn btn-info","onclick":"update(this);"});
			}
			
			</script>
</body>

</html>