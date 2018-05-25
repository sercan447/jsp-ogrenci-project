
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script>
        function formuKontrolEdenFonksiyon(form){
            
            if(form.No.value == ''){
                    alert("No Alanı BOŞ");
                    return false;
            }
            if(form.Adi.value == ''){
                    alert("Adı Alanı BOŞ");
                    return false;
            }
        }
        </script>
</head>
<body>
    
    <jsp:include  page="anasayfa.jsp"/>
    
    <h1>Kayıt Girişi</h1>
    <form id="kayit_giris_formu" name="kayit_giris_formu" method="POST" action="kayit_girisi_sonucu.jsp"
          onsubmit="return formuKontrolEdenFonksiyon(document.kayit_giris_formu);">
        
          <table width="350" border="0">
        <tr>
            <td>Öğrenci No </td>
            <td><input type="text" name="No" id="No" /></td>
        </tr>
        <tr>
            <td>Adı :</td>
            <td><input type="text" name="Adi" id="Adi" /></td>
        </tr>
        <tr>
            <td>Soyadı</td>
            <td><input type="text" name="Soyadi" id="Soyadi" /></td>
        </tr>
        <tr>
            <td>Fakülte </td>
            <td><input type="text" name="Fakulte" id="Fakulte" /></td>
        </tr>
        <tr>
            <td>Bölüm :</td>
            <td><input type="text" name="Bolum" id="Bolum" /></td>
        </tr>
        <tr>
            <td><input type="reset" value="Temizle" /></td>
    <td><input type="submit" value="Veriyi Saved" /></td>
        </tr>
    </table>
    
        
    </form>
  
    
    
</body>
</html>
