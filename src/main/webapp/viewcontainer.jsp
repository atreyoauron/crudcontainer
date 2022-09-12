<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    
 <%List<Container> listaContainers = AppDao.getContainerRecords();
 
 
 request.setAttribute("containers", listaContainers);
 %>   
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">

<meta charset="ISO-8859-1">
<title>Visualizar Containers</title>
</head>
<body>
<h1>Visualização de Containers</h1>
<div class="container-fluid">
<table class="table">

<th>ID</th><th>Nome Cliente</th><th>Serial</th><th>Tipo</th><th>Status</th><th>Categoria</th><th>Ações</th><th>Movimentações</th>
<c:forEach items="${containers}" var="cont">
<tr>
<td>${cont.getCont_id()}</td>
<td>${cont.getCont_cliente()}</td>
<td>${cont.getCont_num()}</td>
<td>${cont.getCont_tipo()}</td>
<td>${cont.getCont_status()}</td>
<td>${cont.getCont_categoria()}</td>
<td><a href="deletecontainer.jsp?contid=${cont.getCont_id()}" class="btn btn-danger">Deletar</a><a href="editcontainerform.jsp?contid=${cont.getCont_id()}" class="btn btn-warning">Editar</a></td>
<td><a href= "addmovform.jsp?contid=${cont.getCont_id()}" class="btn btn-success">Adicionar Movimentação</a><a href="viewmov.jsp?contid=${cont.getCont_id()}" class="btn btn-warning">Movimentações</a>
</tr>
</c:forEach>

</table>

<div="row>
<a href="addcontainerform.jsp" class="btn btn-success">Adicionar Container</a><a href="viewmov.jsp?contid= 0" class="btn btn-warning">Movimentações</a>
<a href="relatorio.jsp" class="btn btn-primary">Relatorio</a>

</div>

</div>


</body>
</html>