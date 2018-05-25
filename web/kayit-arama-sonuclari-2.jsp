<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <sql:setDataSource var="ilyas" 
                       driver="com.mysql.jdbc.Driver" 
                       url="jdbc:mysql://localhost/depotakipvt" 
                       user="root" password="199144"/>
  
    <% 
        if(request.getParameter("No") != null){
                String No = (request.getParameter("No").toString()); 
                %>
                <c:set  var="paramNo" value="<%= No %>"/>
                <%
        }
    %>
   
    
    <c:if test="${param.Adi != null}">
        <c:set var="paramAd"  value="${param.Adi }"/>
     
    </c:if>
    <c:if test="${param.Soyadi != null}">
         <c:set var="paramSoyad" value="${param.Soyadi}" />
    </c:if>
   
    <c:out  value=" ${paramAd} - ${paramNo} - ${paramSoyad} "/>
    
    <h2>Sorgu Claısıyor</h2>
    <sql:transaction dataSource="${ilyas}">
        <c:if test="${paramAd != null}">
            <sql:query var="sorgu1">
                SELECT * FROM Ogrenci WHERE Adi = ?;
                <sql:param  value="${paramAd}" />
            </sql:query>
        </c:if>
            
                <c:if test="${paramSoyad != null}">
                    <sql:query var="sorgu1">
                        SELECT * FROM Ogrenci WHERE Soyadi = ?;
                        <sql:param value="${paramSoyad}" />
                    </sql:query>
                </c:if>
      
                        <c:if test="${paramNo ne null}">
                            <sql:query var="sorgu1">
                                SELECT * FROM Ogrenci WHERE Numara = ?;
                                <sql:param value="${paramNo}" />
                            </sql:query>
                        </c:if>
                            

    </sql:transaction>
                
                <table>
                    <tr>
                        <c:forEach var="dongu1" items="${sorgu1.columnNames}">
                            <td>${dongu1}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach var="dongu2" items="${sorgu1.rows}">
                        <tr>
                            <td>${dongu2.Id}</td>
                            <td>${dongu2.Numara}</td>
                            <td>${dongu2.Adi}</td>
                            <td>${dongu2.Soyadi}</td>
                            <td>${dongu2.Fakulte}</td>
                            <td>${dongu2.Bolum}</td>
                        </tr>
                    </c:forEach>
                    
                </table>
                
                
    
    
</body>
</html>
