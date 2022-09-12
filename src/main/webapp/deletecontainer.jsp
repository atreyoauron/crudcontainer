 <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   


<%

String cId = request.getParameter("contid");

int id = Integer.parseInt(cId);


int i = AppDao.deleteContainer(id);

response.sendRedirect("viewcontainer.jsp");


%>