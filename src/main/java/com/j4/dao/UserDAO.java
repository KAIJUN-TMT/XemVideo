package com.j4.dao;

import java.util.List;

import com.j4.entity.User;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UserDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	
	//kiem tra user co it nhat 1 luot like
	public static List<User> findUserHasLike() {
		String jpqlString = "select u from User u where u.likes is not empty";
		TypedQuery<User> query = entityManager.createQuery(jpqlString, User.class);
		return query.getResultList();
	}
	
	//find all
	public static List<User> findAll() {
		
		TypedQuery<User> query = entityManager.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
				
	}
	
	//find by id
	public static User findById(Integer id) {
		return entityManager.find(User.class, id);
	}
	
	//find by email
	public static User findByEmail(String email) {
		
		TypedQuery<User> query = entityManager.createNamedQuery("User.findByEmail", User.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
	
	//find by id or email
//	public static User findByIdOrEmail(String idOrEmail) {
//		String jpql = "select u from User u where u.email = :email or u.id = :id";
//		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
//		query.setParameter("email", idOrEmail);
//		try {
//			Integer id = Integer.parseInt(idOrEmail);
//			System.out.println(id);
//			query.setParameter("id", id);
//		} catch (Exception e) {
//			// TODO: handle exception
//			query.setParameter("id", 0);
//			
//		}
//		return query.getSingleResult();
//	}
	public static User findByIdOrEmail(String idOrEmail) {
	    String jpql = "select u from User u where u.email = :email";
	    TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
	    query.setParameter("email", idOrEmail);

	    try {
	        Integer id = Integer.parseInt(idOrEmail); // Nếu là ID, chuyển đổi
	        jpql = "select u from User u where u.email = :email or u.id = :id"; // Thêm điều kiện tìm theo ID
	        query = entityManager.createQuery(jpql, User.class);
	        query.setParameter("email", idOrEmail);
	        query.setParameter("id", id);
	    } catch (NumberFormatException e) {
	        // Nếu không phải số, không cần set parameter cho :id
	    }

	    List<User> users = query.getResultList();
	    return users.isEmpty() ? null : users.get(0); // Trả về null nếu không tìm thấy người dùng
	}

	//find by keyword
	// Xoá user
	public static void delete(User user) {
		EntityManager em = JpaUtil.getEntityManager();
		em.getTransaction().begin();
		user = em.merge(user);
		em.remove(user);
		em.getTransaction().commit();
	}

	// Cập nhật user
	 public static void update(User user) {
	        EntityManager entityManager = JpaUtil.getEntityManager();
	        entityManager.getTransaction().begin();
	        try {
	            entityManager.merge(user); // Cập nhật người dùng trong cơ sở dữ liệu
	            entityManager.getTransaction().commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	            entityManager.getTransaction().rollback();
	        } finally {
	            entityManager.close();
	        }
	    }

	
}
