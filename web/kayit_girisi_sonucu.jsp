<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
  
    <%
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection baglanti = DriverManager.getConnection("jdbc:mysql://localhost/depotakipvt", "root", "199144");
        
         PreparedStatement prestmt = null;
         ResultSet rs = null;
         
         String SQLSORGU = "INSERT INTO Ogrenci (Numara,Adi,Soyadi,Fakulte,Bolum)"
                                     + " VALUES (? , ? , ? , ? ,?)";
        
           prestmt = baglanti.prepareStatement(SQLSORGU);
           
           prestmt.setString(1, request.getParameter("No").toString());
           prestmt.setString(2, request.getParameter("Adi").toString());
           prestmt.setString(3,request.getParameter("Soyadi"));
           prestmt.setString(4, request.getParameter("Fakulte"));
           prestmt.setString(5, request.getParameter("Bolum"));
           
           prestmt.execute();

    %>
    
    <sql:setDataSource  var="islemBileseni" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/depotakipvt"
                        user="root" password="199144"/>
    
    
    <sql:transaction dataSource="${islemBileseni}">
        <sql:query var="sorgu">
            SELECT * FROM Ogrenci;
        </sql:query>
    </sql:transaction>
            <table>
                <c:forEach var="veriTime" items="${sorgu.rows}">
                            
                    <tr>
                    <td>${veriTime.Adi}</td>
                    <td>${veriTime.Soyadi}</td>
                    <td>${veriTime.Fakulte}</td>
                </tr>
                </c:forEach>
                
            </table>    

    
</body>
</html>
