 <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   


<%

String mId = request.getParameter("movid");
String cId = request.getParameter("contid");

int movid = Integer.parseInt(mId);
int contid = Integer.parseInt(cId);

int i = AppDao.deleteMov(movid);


response.sendRedirect("viewmov.jsp?contid="+cId);


%>