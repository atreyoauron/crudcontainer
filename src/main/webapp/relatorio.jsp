<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
          
    <%@page import="com.dao.*, com.bean.*, java.util.*" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
  <%
  
  List<Relatorio> listaRelatorio = AppDao.getRelatorio();
  
  List<Sumario> listaImport = AppDao.getSumario("Importação");
  List<Sumario> listaExport = AppDao.getSumario("Exportação");
  
  int totalImports = AppDao.getTotalCategoria("Importação");
  int totalExports = AppDao.getTotalCategoria("Exportação");
  
  
  
  request.setAttribute("listaRelatorio", listaRelatorio);
  
  request.setAttribute("listaImport", listaImport);
  request.setAttribute("listaExport", listaExport);
  
  request.setAttribute("totalImports", totalImports);
  request.setAttribute("totalExports", totalExports);
  
  
  %>
   
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Relatorio e Sumario</title>
</head>
<body>
<h1>Relatorio de Importação e Exportação</h1>
	<div class="container-fluid">
   <div class="row">
	
	<c:forEach items="${listaRelatorio}" var="rel"> 
 <div class="col-md-6">
 <table class="table table-hover table-bordered table-sm">
 <thead>
     <tr>
                  <th>
                     Cliente
                  </th>
                  <th>
                     Movimentaes
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>
                     ${rel.getRel_cliente()}
                  </td>
                  <td>
                     <table class="table table-hover table-bordered table-sm">
                        <th>
                           Tipo
                        </th>
                        <th>
                           Total
                        </th>
                        <tr>
                           <td>Embarque</td>
                           <td> ${rel.getRel_totalEmbarque()}</td>
                        </tr>
                        <tr>
                           <td>Descarga</td>
                           <td> ${rel.getRel_totalDescarga()}</td>
                        </tr>
                        <tr>
                           <td>Gate In</td>
                           <td> ${rel.getRel_totalGateIn()}</td>
                        </tr>
                        <tr>
                           <td>Gate Out</td>
                           <td> ${rel.getRel_totalGateOut()}</td>
                        </tr>
                        <tr>
                           <td>Reposicionamento</td>
                           <td> ${rel.getRel_totalReposicionamento()}</td>
                        <tr>
                           <td>Pesagem</td>
                           <td> ${rel.getRel_totalPesagem()}</td>
                        </tr>
                        <tr>
                           <td>Scanner</td>
                           <td> ${rel.getRel_totalScanner()}</td>
                        </tr>
                     </table>
               </tr>
            </tbody>
         </table>
      </div>


</c:forEach>


</div>
</div>

<div class="row">
     <h1>Total de Importação e Export</h1>
     
    <div class="sumario">
   <table class="table table-hover table-bordered table-sm">
      <thead>
         <tr>
            <th>
               Importações
            </th>
            <th>
               Exportações
            </th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>
               <table class="table table-hover table-bordered table-sm">
                  <th>Clientes</th>
                  <c:forEach items="${listaImport}" var="imports">
                  <tr>
                     <td>${imports.getSum_cliente()}</td>
                  </tr> 
                  </c:forEach>
                  <tr>
                     <td></td>
                  </tr>
                  <th>Total</th>
                     <tr>
                     <td>${totalImports}</td>
                  </tr>
               </table>
            </td>
            <td>
               <table class="table table-hover table-bordered table-sm">
                  <th>Clientes</th>
                  
                     <c:forEach items="${listaExport}" var="exports">
                  <tr>
                     <td>${exports.getSum_cliente()}</td>
                  </tr> 
                  </c:forEach>
               
                  <tr>
                     <td></td>
                  </tr>
                  <th>Total</th>
                   <tr>
                     <td>${totalExports}</td>
                  </tr>
               </table>
            </td>
            </td>
         </tr>
      </tbody>
   </table>
</div>
<! -- fim da tabela -->
      
   </div>
   <!--fim da row--> 
</div>



</body>
</html>