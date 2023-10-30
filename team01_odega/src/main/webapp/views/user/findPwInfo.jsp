<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwInfo</title>
</head>
<body>
	<script>
   function pw_search() { 
       var frm = document.pwfindscreen;

       if (frm.user_id.value.length < 1) {
        alert("아이디를 입력해주세요");
        return;
       }

       if (frm.phone.value.length != 13) {
           alert("핸드폰번호를 정확하게 입력해주세요");
           return;
       }

    frm.method = "post";
    frm.action = "findPwResult.jsp"; //넘어간화면
    frm.submit();  
    }
</script>

</body>
</html>