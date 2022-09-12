<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
      <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
   
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/formstyle.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Adicionar Container</title>
</head>
<body>

<h1>Adicionar Novo Container</h1>
<form action="addcontainerfinish.jsp" method="post">

<table class="center">
<tr>
<td>Nome do Cliente:</td><td><input type="text" name="cont_cliente" required></td>
</tr>
<td>Serial do Container:</td><td><input type="text" maxlength="11" name="cont_num" id="cont_num" required></td><td><button type="button" value="Gerar Serial" onClick="GerarSerial(4,7)">Gerar Serial</button></td>
</tr>
<td>Tipo do Container:</td>
<td>20 <input type="radio" value=20 name="cont_tipo" required>
40 <input type="radio" value=40 name="cont_tipo" required></td>
</tr>
<td>Status do Container:</td></td>
<td>Cheio <input type="radio" value="Cheio" name="cont_status" required>
Vazio <input type="radio" value="Vazio" name="cont_status" required></td>
</tr>
<td>Categoria do Container:</td>
<td>Importação <input type="radio" value="Importação" name="cont_categoria" required>
Exportação <input type="radio" value="Exportação" name="cont_categoria" required></td>

</tr>
<td></td><td><input type="submit"></td><td></td>
</table>




</body>


<script>	
    	 function GerarSerial(charLen, numLen){
      	   var resultado = '';
      	    var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      	    var nums = '0123456789';
      	    var charsLength = chars.length;
      	    var numsLength = nums.length;
      	    
      	    for ( var i = 0; i < charLen; i++ ) {
      	      resultado += chars.charAt(Math.floor(Math.random() * 
      	 charsLength));
      	   }
      	  for ( var i = 0; i < numLen; i++ ) {
      	      resultado += nums.charAt(Math.floor(Math.random() * 
      	 numsLength));
      	   }
       		document.getElementById('cont_num').value = resultado;   
      }
    	    
    
 </script>
</html>