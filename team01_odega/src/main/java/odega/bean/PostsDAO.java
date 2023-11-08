package odega.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import odega.OracleDB;

public class PostsDAO extends OracleDB{
	
private static PostsDAO instance = new PostsDAO();
	
	public static PostsDAO getInstance() {
		return instance;
	}
	public PostsDAO() {}
	
	//Post num주고 하나 가져오기
	//조회수 증가 기능 추가
	public PostsDTO getPost(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		PostsDTO post=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update posts set content_cnt =content_cnt+1 where num = ? ");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			pstmt = conn.prepareStatement(
			" select p.*, u.nickname "
			+ "			from posts p "
			+ "			INNER JOIN users u "
			+ "			ON p.user_num = u.num "
			+ "			where p.num = ? ");
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				post = new PostsDTO();
				post.setNum(rs.getInt("num"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setPost_like_cnt(rs.getInt("post_like_cnt"));
				post.setReg(rs.getDate("reg"));
				post.setUser_num(rs.getInt("user_num"));
				post.setNickname(rs.getString("nickname"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		System.out.println("postsDAO.getPost : "+post);
		
		return post;
	}
	
	//포스트좋아요
	public int likeUp(int posts_num) {
        int likeup=0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
           conn=getConnection();
           pstmt = conn.prepareStatement("update posts set post_like_cnt = post_like_cnt + 1 where num = ?");
            pstmt.setInt(1, posts_num);
            likeup = pstmt.executeUpdate();
            
            PostsDTO dto = new PostsDTO();
            dto.setPost_like_cnt(likeup);
            
        }catch(Exception e) {
           e.printStackTrace();
        }finally {
           close(rs, pstmt, conn);
        }return likeup;
     }

}
