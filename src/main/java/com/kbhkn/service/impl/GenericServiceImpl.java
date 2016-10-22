package com.kbhkn.service.impl;

import java.util.List;

import com.kbhkn.dao.impl.GenericDaoImpl;
import com.kbhkn.service.GenericService;

/**
 * Created by kbhkn on 22.10.2016 19:40.
 */
public class GenericServiceImpl implements GenericService {

	private static GenericDaoImpl dao;

	public GenericServiceImpl() {
		dao = new GenericDaoImpl();
	}

	@Override
	public void save(Object object) {
		dao.openCurrentSessionwithTransaction();
		dao.save(object);
		dao.closeCurrentSessionwithTransaction();
	}

	@Override
	public <T> Object findById(Class<T> className, Integer id) {
		dao.openCurrentSessionwithTransaction();
		Object object = dao.findById(className, id);
		dao.closeCurrentSessionwithTransaction();

		return object;
	}

	@Override
	public void update(Object object) {
		dao.openCurrentSessionwithTransaction();
		dao.update(object);
		dao.closeCurrentSessionwithTransaction();
	}
	
	@Override
	public <T> void delete(Class<T> className, Integer id) {
		dao.openCurrentSessionwithTransaction();
		dao.delete(className, id);
		dao.closeCurrentSessionwithTransaction();		
	}

	@Override
	public <T> List<T> findAll(Class<T> className) {
		dao.openCurrentSessionwithTransaction();
		List<T> getAll = dao.findAll(className);
		dao.closeCurrentSessionwithTransaction();
		
		return getAll;

	}
}
