<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Kayıt Arama Sonuçları</h1>
    
    <table>
        <tr>
            <td><strong>Sıra </strong></td>
            <td><strong>Öğrenci No</strong></td>
            <td><strong>Adı</strong></td>
            <td><strong>Soyadı</strong></td>
            <td><strong>Fakulte</strong></td>
            <td><strong>Bölüm</strong></td>
        </tr>
        <%
            try{
            
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/depotakipvt","root","199144");
                
                if(!con.isClosed())
                    out.println("VT açıldı.");
                else
                    out.println("VT KAPALI");
                
                Statement stmt = null;
                ResultSet rs = null;
                
                
                String NO = request.getParameter("No");
                String ADI = request.getParameter("Adi");
                String SOYADI = request.getParameter("Soyadi");
                
                out.println("NO : "+NO);
                out.println("ADI : "+ADI);
                out.println("SOYADI : "+SOYADI);
                
                String SQL = "SELECT * FROM Ogrenci WHERE Numara LIKE '"+NO+"' "
                                                        + "OR Adi LIKE '"+ADI+"' "
                                                        + "OR Soyadi LIKE '"+SOYADI+"' ";
                        
                stmt = con.createStatement();
                rs = stmt.executeQuery(SQL);
                        
                %>
                
                <%! 
                    int i =0;
                    String renk = "#ffccff";
                    
                %>
                
                
                <%
                while(rs.next()){
                     i = i % 2;
                    if(i == 0){
                        renk = "#ffff99";
                    }else{
                        renk = "#ccffcc";
                    }

                    %>
                    <tr bgcolor="<%out.println(renk);%>">
                        <td><%= rs.getString("Id") %></td>
                        <td><% out.println(rs.getString("Numara"));%></td>
                        <td><%= rs.getString("Adi") %></td>
                        <td><%= rs.getString("Soyadi")  %></td>
                        <td><%= rs.getString("Fakulte") %></td>
                        <td><%= rs.getString("Bolum") %></td>
                    </tr>
                    <%
                }
                con.close();
            }catch(SQLException e){
                out.println("SQL Hata : "+e.getMessage());
            }catch(ClassNotFoundException ce){
                out.println("Sınıfı Bulma hatası :"+ce.toString());
            }
        
        %>
            
        
    </table>
    
</body>
</html>
