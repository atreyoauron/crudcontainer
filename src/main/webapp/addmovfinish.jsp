 <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<jsp:useBean id="m" class="com.bean.Movimentacao"></jsp:useBean>
<jsp:setProperty property="*" name="m"/>

<%
int i = AppDao.addMov(m);

if(i != 0){
	
	response.sendRedirect("viewmov.jsp?contid="+m.getCont_id());
	
	
} else {
	
	response.sendRedirect("addmovform.jsp?contid="+m.getCont_id());
	
}

%>