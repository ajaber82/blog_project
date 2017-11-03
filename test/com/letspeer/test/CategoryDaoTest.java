package com.letspeer.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.letspeer.blog.dao.CategoryDao;
import com.letspeer.blog.dao.UserDao;
import com.letspeer.blog.dao.impl.CategoryDaoImpl;
import com.letspeer.blog.dao.impl.UserDaoImpl;
import com.letspeer.blog.model.Category;
import com.letspeer.blog.model.User;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CategoryDaoTest {

	
	static int categoryId ; 
	@Test
	public void test1_AddCategory() {
		try {
		
		Category category = new Category();
		category.setCategoryName("news");
		category.setDeleted(false);
		
			
		CategoryDao dao = new CategoryDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false" , 
				"root" , "12345678");
		
		int res = dao.addCategory(category); 
		//System.out.println(res);
		categoryId = res ; 
		assertTrue(res>-1);
		
		}catch(Exception exp) {
			exp.printStackTrace();
		}
	}
	
	@Test
	public void test2_GetCategoryById() {
		try {
			//System.out.println(userId);
			Category c = null ; 
			CategoryDao dao = new CategoryDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false" , 
					"root" , "12345678");
			c = dao.getCategoryById(categoryId) ; 
			assertNotNull(c);
		}catch(Exception exp) {
			exp.printStackTrace();
		}
	}
	
	@Test
	public void test3_GetCategory() {
		
		try {
			
			CategoryDao dao = new CategoryDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false" , 
					"root" , "12345678");
			List<Category> ls = dao.getCategories(0, 100) ; 
			assertNotNull(ls);
			assertTrue(ls.size()>=0);
			
		}catch(Exception exp) {
			exp.printStackTrace();
		}
		
	}
	
	/*@Test
	public void test4_Update() {
		
		try {
			
			User u = new User();
			u.setId(userId);
			u.setAboutMe("something");
			u.setDeleted(false);
			u.setEmail("u@xyz.com");
			u.setFirstName("fName");
			u.setLastName("lName");
			u.setPassword("pwd");
			u.setProfilePicture("pic1.jpg");
			
			UserDao dao = new UserDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false" , 
					"root" , "12345678");
			
			Boolean result = dao.updateUser(u) ;
			assertFalse(result);
			u = dao.getUserById(userId) ; 
			assertNotNull(u);
			assertTrue(u.getEmail().equals("u@xyz.com"));
		}catch(Exception exp) {
			exp.printStackTrace();
		}	
	}
	
	@Test
	public void test5_deleteUser() {
		UserDao dao = new UserDaoImpl("jdbc:mysql://127.0.0.1:3306/blog_db?autoReconnect=true&useSSL=false" , 
				"root" , "12345678");
		dao.deleteUser(userId);
		
		User u = dao.getUserById(userId) ; 
		assertNull(u);
		
		
	}*/
	

}
