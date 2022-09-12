
<%@page import="com.dao.*, com.bean.*, java.util.*" %>
  <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
 <%

String cId = request.getParameter("contid");

int id = Integer.parseInt(cId);

Container cont = AppDao.getContainerById(id);


request.setAttribute("cont", cont);
 %>
   
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/formstyle.css" rel="stylesheet" type="text/css">
<title>Editar Container</title>
</head>
<body>
<h1>Editar Container</h1>
<form action="editcontainerfinish.jsp" method="post">

<table class="center">
<input type="hidden" value="<%=cont.getCont_id()%>" name="cont_id"readonly><!-- Id que será enviado -->
<tr>
<td>ID</td><td><input readonly value="<%=cont.getCont_id()%>" disabled></td> <!-- Id de demonstração -->
</tr>
<tr>
<td>Nome do Cliente:</td><td><input type="text" value="<%=cont.getCont_cliente()%>" name="cont_cliente" required></td>
</tr>
<td>Serial do Container:</td><td><input type="text" value="<%=cont.getCont_num()%>" maxlength="11" name="cont_num" id="cont_num" required></td><td><button type="button" value="Gerar Serial" onClick="GerarSerial(4,7)">Gerar Serial</button></td>
</tr>
<td>Tipo do Container:</td>
<td>20 <input type="radio" value=20 name="cont_tipo"<%=(cont.getCont_tipo()== 20)? "checked": "" %> required>
40 <input type="radio" value=40 name="cont_tipo" <%=(cont.getCont_tipo()== 40)? "checked": "" %> required></td>
</tr>
<td>Status do Container:</td></td>
<td>Cheio <input type="radio" value="Cheio" name="cont_status" <%=(cont.getCont_status().equals("Cheio"))? "checked": "" %> required>
Vazio <input type="radio" value="Vazio" name="cont_status" <%=(cont.getCont_status().equals("Vazio"))? "checked": "" %> required></td>
</tr>
<td>Categoria do Container:</td>
<td>Importação <input type="radio" value="Importação" name="cont_categoria" <%=(cont.getCont_categoria().equals("Importação"))? "checked": "" %> required>
Exportação <input type="radio" value="Exportação" name="cont_categoria" <%=(cont.getCont_categoria().equals("Exportação"))? "checked": "" %> required></td>

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