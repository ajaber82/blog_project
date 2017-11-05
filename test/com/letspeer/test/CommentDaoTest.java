package com.letspeer.test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.letspeer.blog.dao.CommentDao;

import com.letspeer.blog.dao.impl.CommentDaoImpl;

import com.letspeer.blog.model.Comment;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class CommentDaoTest {
	
	static int commentId;

	@Test
	public void test1_AddComment() {
		try {

			Comment comment = new Comment();
			
			comment.setCommentBody("This is my first project");
			comment.setCreatedTime(null);
			comment.setUserId(1);
			comment.setBlogId(1);
			comment.setDeleted(false);

			CommentDao dao = new CommentDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false", "root",
					"12345678");

			int res = dao.addComment(comment);
			commentId = res;
			assertTrue(res > -1);

		} catch (Exception exp) {
			exp.printStackTrace();
		}
	}
	
	
	


}
