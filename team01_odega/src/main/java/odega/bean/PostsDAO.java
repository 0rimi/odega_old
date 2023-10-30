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
	public PostsDTO getPost(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		PostsDTO post=null;
		
		try {
			conn = getConnection();
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

}
