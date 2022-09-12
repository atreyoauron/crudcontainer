<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
    <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<% 
String cId = request.getParameter("contid");
int id = Integer.parseInt(cId);

List<Movimentacao> listaMov = new ArrayList<Movimentacao>();


if(id <= 0){
	
	 listaMov = AppDao.getMovRecords();
    
} else {
	
	
	 listaMov = AppDao.getMovRecords(id);
    
}


    
    request.setAttribute("listaMov", listaMov);
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Visualização de Movimentação</title>
</head>
<body>
<h1>Visualização de Movimentação</h1>
<div class="container-fluid">
<table class="table">

<th>ID Mov</th><th>ID Cont.</th><th>Serial</th><th>Tipo</th><th>Data e Hora Inicial</th><th>Data e Hora Final</th><th>Ações</th>
<c:forEach items="${listaMov}" var="mov">
<tr>
<td>${mov.getMov_id()}</td>
<td>${mov.getCont_id()}</td>
<td>${mov.getCont_num()}</td>
<td>${mov.getMov_tipo()}</td>
<td>${mov.getMov_dtInicial(true)}</td>
<td>${mov.getMov_dtFinal(true)}</td>
<td><a href="deletemov.jsp?movid=${mov.getMov_id()}&contid=${mov.getCont_id()}" class="btn btn-danger">Deletar</a></td>

</tr>
</c:forEach>

</table>

</div>
</body>
</html>