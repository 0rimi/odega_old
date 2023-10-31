<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="odega.bean.PostsDAO"%>
<%@ page import="odega.bean.UserLikeDAO"%>
<html lang="ko">

<%
   
   int post_num = Integer.parseInt(request.getParameter("posts_num"));
   String user_id = (String)session.getAttribute("user_id");
   
   if(user_id==null){%>
<script> 
        alert("로그인 후 좋아요 할 수 있습니다.");
         history.go(-1);
      </script>
<%
   }else{
      UserLikeDAO like_dao = new UserLikeDAO();
      int check = like_dao.likeCheck(user_id, post_num);
      if(check == 1){
         PostsDAO dao = new PostsDAO();
         
         dao.likeUp(post_num);
         like_dao.saveLikeList(user_id, post_num);
         
         response.sendRedirect("main.jsp");
      }else if(check == -1){%>
<script> 
           alert("이미 좋아요 한 글입니다.");
           history.go(-1);
         </script>
<%
      }
   }
   
%>