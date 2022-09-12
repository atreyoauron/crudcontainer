<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@page import="com.dao.*, com.bean.*, java.util.*, java.text.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
   <%
   
   String cId = request.getParameter("contid");
   int id = Integer.parseInt(cId);
   
   
   SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
   Date dtNow = new Date();
   String dataNow = dt.format(dtNow);
   
   request.setAttribute("id", id);
   request.setAttribute("dataNow", dataNow);
 %>
   
   
   
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/formstyle.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Adicionar Movimentação</title>
</head>
<body>
<h1>Adicionar Movimentação</h1>
<form action="addmovfinish.jsp" method="post">

<table class="center">
<input type="hidden" name="cont_id" value="${id}"readonly><!-- Id que será enviado -->
<tr>
<td>ID</td><td><input readonly value="${id}" disabled></td> <!-- Id de demonstração -->
</tr>
<tr>
<td>Tipo:</td><td>
<select name="mov_tipo">
<option value = 1> Embarque</option>
<option value = 2> Descarga</option>
<option value = 3> Gate In</option>
<option value = 4> Gate Out</option>
<option value = 5> Reposicionamento</option>
<option value = 6> Pesagem</option>
<option value = 7> Scanner</option>
</select>
</tr>
<td>Data e Hora Inicial:</td><td><input value="${dataNow}" type="datetime-local" id="mov_dtInicial" name="mov_dtInicial" required></td>
</tr>
<td>Data e Hora Final:</td><td><input type="datetime-local" id="mov_dtFinal" name="mov_dtFinal" required></td>
</tr>


</tr>
<td></td><td><input type="submit"></td><td></td>
</table>

</body>
</html>