<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    
    <jsp:include page="anasayfa.jsp" />
    
    <h1>Kayıt Arama </h1>
    
    <form id="kayit-arama_formu" name="kayit_arama_formu" method="GET" action="kayit-arama-sonuclari-2.jsp">
        
        <table>
            <tr>
                <td>Öğrenci No :</td>
                <td><input  type="text" name="No" id="No" /></td>
            </tr>
            <tr>
                <td>Adı :</td>
                <td><input type="text" name="Adi" id="Adi" /></td>
            </tr>
            <tr>
                <td>Soyadı :</td>
                <td><input type="text" name="Soyadi" id="Soyadi" /></td>
            </tr>
            <tr>
                <td><input type="reset" name="vazgec" value="Vazgeç" /></td>
                 <td><input type="submit" name="onay" id="Onay" value="Ara" /></td>
            </tr>
        </table>
        
    </form>
</body>
</html>
