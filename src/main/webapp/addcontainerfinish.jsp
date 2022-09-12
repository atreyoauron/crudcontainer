  <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<jsp:useBean id="c" class="com.bean.Container"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
int i = AppDao.addContainer(c);

if(i != 0){
	
	response.sendRedirect("viewcontainer.jsp");
	
	
} else {
	
	response.sendRedirect("addcontainer.jsp");
	
}

%>
