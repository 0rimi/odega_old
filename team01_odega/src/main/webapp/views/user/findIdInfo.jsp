<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdInfo</title>
</head>
<body>
	<script>
   function id_search() { 
       var frm = document.idfindscreen;

       if (frm.user_name.value.length < 1) {
        alert("이름을 입력해주세요");
        return;
       }

       if (frm.phone.value.length != 13) {
           alert("핸드폰번호를 정확하게 입력해주세요");
           return;
       }

    frm.method = "post";
    frm.action = "findIdResult.jsp"; //넘어간화면
    frm.submit();  
    }
</script>

</body>
</html>