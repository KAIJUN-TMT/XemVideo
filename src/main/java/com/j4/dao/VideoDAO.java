package com.j4.dao;

import java.util.List;

import com.j4.entity.Video;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

public class VideoDAO {
    static EntityManager entityManager = JpaUtil.getEntityManager();

    // 1. Lấy danh sách tất cả video
    public static List<Video> findAll() {
        String jpql = "SELECT v FROM Video v ORDER BY v.id DESC";
        TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
        return query.getResultList();
    }

    // 2. Tìm theo ID
    public static Video findById(Integer id) {
        return entityManager.find(Video.class, id);
    }

    // 3. Thêm mới
    public static int insert(Video video) {
        entityManager.getTransaction().begin();
        try {
            entityManager.persist(video);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return 0;
        }
    }

    // 4. Cập nhật
    public static int update(Video video) {
        entityManager.getTransaction().begin();
        try {
            entityManager.merge(video);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return 0;
        }
    }

    // 5. Xóa
    public static int delete(Integer id) {
        entityManager.getTransaction().begin();
        try {
            Video video = entityManager.find(Video.class, id);
            entityManager.remove(video);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return 0;
        }
    }

    // 6. Tìm video yêu thích theo user ID
    public static List<Video> findVideoByUserId(Integer userId) {
        EntityManager em = JpaUtil.getEntityManager();
        String jpql = "SELECT l.video FROM Like l WHERE l.user.id = :userId";
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }


    // 7. Tìm kiếm video theo tiêu đề
    public List<Video> searchByTitle(String keyword) {
        String jpql = "SELECT v FROM Video v WHERE LOWER(v.title) LIKE :keyword ORDER BY v.id DESC";
        TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
        query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
        return query.getResultList();
    }
    public List<Object[]> getVideoReport() {
        String sql = """
            SELECT 
                v.title, v.views, COUNT(l.id) AS likes
            FROM 
                videos v
            LEFT JOIN 
                likes l ON v.id = l.video_id
            GROUP BY 
                v.title, v.views
            ORDER BY 
                v.views DESC
        """;
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList();
    }

}
