package com.kbhkn.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.kbhkn.dao.GenericDao;
import com.kbhkn.util.HibernateUtil;

/**
 * Created by kbhkn on 22.10.2016 19:44.
 */
public class GenericDaoImpl implements GenericDao {

	private Session currentSession;
	private Transaction currentTransaction;

	@Override
	public void save(Object object) {
		this.currentSession.save(object);
	}
	
	@Override
	public <T> Object findById(Class<T> className, Integer id) {
		return this.currentSession.get(className, id);
	}

	@Override
	public void update(Object object) {
		this.currentSession.update(object);
	}
	
	@Override
	public <T> void delete(Class<T> className, Integer id) {
		if(id != null && id > 0){
			Object o = findById(className, id);
			this.currentSession.delete(o);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll(Class<T> className) {
		return this.currentSession.createCriteria(className).list();
	}

	public Session openCurrentSessionwithTransaction() {
		currentSession = HibernateUtil.getSessionFactory().openSession();
		currentTransaction = currentSession.beginTransaction();
		return currentSession;
	}

	public void closeCurrentSessionwithTransaction() {
		currentTransaction.commit();
		currentSession.close();
	}
}
