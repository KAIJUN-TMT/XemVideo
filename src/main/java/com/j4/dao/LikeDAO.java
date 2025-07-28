package com.j4.dao;

import java.util.List;

import com.j4.entity.Like;

import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class LikeDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	
	//them like
	public static int insert(Like like) {
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(like);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	public static int delete(Integer userId, Integer videoId) {
	    EntityManager em = JpaUtil.getEntityManager();
	    em.getTransaction().begin();
	    try {
	        String jpql = "SELECT l FROM Like l WHERE l.user.id = :uid AND l.video.id = :vid";
	        TypedQuery<Like> query = em.createQuery(jpql, Like.class);
	        query.setParameter("uid", userId);
	        query.setParameter("vid", videoId);

	        List<Like> likes = query.getResultList();
	        if (!likes.isEmpty()) {
	            em.remove(likes.get(0)); // chỉ xóa 1 like
	        }

	        em.getTransaction().commit();
	        return 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        em.getTransaction().rollback();
	        return 0;
	    }
	}

}