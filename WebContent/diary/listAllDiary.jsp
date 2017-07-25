<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.diary.model.*"%>
<%@ page import="java.io.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    DiaryService diaSvc = new DiaryService();
    List<Diary> list = diaSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ���x��� - listAllDiary.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>DIANO</th>
		<th>MEMNO</th>
		<th>DIANAME</th>
		<th>DIATEXT</th>
		<th>DIAIMG</th>
		<th>DIACRETIME</th>
		<th>DIAMODTIME</th>
		<th>DIASTATE</th>
	</tr>
	
	<c:forEach var="diary" items="${list}" >
		<tr align='center' valign='middle'>
			<td>${diary.diaNo}</td>
			<td>${diary.memNo}</td>
			<td>${diary.diaName}</td>
			<td>${diary.diaText}</td>
			<td><img src="<%=request.getContextPath()%>/ShowImage?diano=${diary.diaNo}" style='height:200px;width:300px;display:${empty diary.diaImg ? "none":""};'></img> </td>
			<td><fmt:formatDate value="${diary.diaCreTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${diary.diaModTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${diary.diaState}</td>
			
<%-- 			<td><img src="data:iamge/gif;base64,${diary.diaText}" style='height:200px;width:300px;display:${empty diary.diaImg ? "none":""};'></img></td> --%>
			
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do"> --%>
<!-- 			     <input type="submit" value="�ק�"> -->
<%-- 			     <input type="hidden" name="empno" value="${empVO.empno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do"> --%>
<!-- 			    <input type="submit" value="�R��"> -->
<%-- 			    <input type="hidden" name="empno" value="${empVO.empno}"> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>


</body>
</html>
