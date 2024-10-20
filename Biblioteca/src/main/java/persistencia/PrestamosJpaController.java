/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Prestamos;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Dani
 */
public class PrestamosJpaController implements Serializable {

    public PrestamosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    public PrestamosJpaController(){
        emf = Persistence.createEntityManagerFactory("BibliotecaPU");
    }
    public void create(Prestamos prestamos) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(prestamos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Prestamos prestamos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            prestamos = em.merge(prestamos);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = prestamos.getId_prestamos();
                if (findPrestamos(id) == null) {
                    throw new NonexistentEntityException("The prestamos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Prestamos prestamos;
            try {
                prestamos = em.getReference(Prestamos.class, id);
                prestamos.getId_prestamos();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The prestamos with id " + id + " no longer exists.", enfe);
            }
            em.remove(prestamos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Prestamos> findPrestamosEntities() {
        return findPrestamosEntities(true, -1, -1);
    }

    public List<Prestamos> findPrestamosEntities(int maxResults, int firstResult) {
        return findPrestamosEntities(false, maxResults, firstResult);
    }

    private List<Prestamos> findPrestamosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Prestamos.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Prestamos findPrestamos(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Prestamos.class, id);
        } finally {
            em.close();
        }
    }

    public int getPrestamosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Prestamos> rt = cq.from(Prestamos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
