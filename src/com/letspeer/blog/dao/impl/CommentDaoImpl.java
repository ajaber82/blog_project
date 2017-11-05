package com.letspeer.blog.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.letspeer.blog.dao.CommentDao;
import com.letspeer.blog.model.Comment;

public class CommentDaoImpl implements CommentDao{
	
	private String dbUrl;
	private String dbUser;
	private String dbUserPwd;
	private Connection connection;

	public CommentDaoImpl(String dbUrl, String dbUser, String dbUserPwd) {
		this.dbUrl = dbUrl;
		this.dbUser = dbUser;
		this.dbUserPwd = dbUserPwd;
	}

	@Override
	public void connectDb() {
		try {
			if (connection == null || connection.isClosed()) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(dbUrl, dbUser, dbUserPwd);
			}

		} catch (Exception exp) {
			exp.printStackTrace();
		}
		
	}

	@Override
	public void disconnectDb() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Integer addComment(Comment comment) {
		ResultSet rs = null;
		try {
			String stmt = "INSERT INTO comments "
					+ "(`comment_body`,`created_time`,`user_id`,`blog_id`,`deleted`) VALUES"
					+ "(?,?,?,?,?)";
			connectDb();
			PreparedStatement pStmt = connection.prepareStatement(stmt,Statement.RETURN_GENERATED_KEYS);
			pStmt.setString(1, comment.getCommentBody());
			pStmt.setLong(2, comment.getCreatedTime());
			pStmt.setInt(3, comment.getUserId());
			pStmt.setInt(4, comment.getBlogId());
	
			if (comment.getDeleted()) {
				pStmt.setString(5, "1");
			} else {
				pStmt.setString(5, "0");
			}
			pStmt.execute();
			int autoIncKeyFromApi = -1;

			rs = pStmt.getGeneratedKeys();

			if (rs.next()) {
				autoIncKeyFromApi = rs.getInt(1);
				return autoIncKeyFromApi;
			} else {
				return -1;
			}

		} catch (Exception exp) {
			exp.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			disconnectDb();
		}

		return -1;
	}

	@Override
	public Comment getCommentById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getComments(Integer start, Integer count) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getComments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteComment(Integer id) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
