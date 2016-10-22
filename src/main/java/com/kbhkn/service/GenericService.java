package com.kbhkn.service;

import java.util.List;

/**
 * Created by kbhkn on 22.10.2016 19:39.
 */
//CRUD Operators
//Service Layer
//Dependency Injection used.
public interface GenericService {
	public void save(Object object);

	public <T> Object findById(Class<T> className, Integer id);

	public void update(Object object);

	public <T> void delete(Class<T> className, Integer id);

	public <T> List<T> findAll(Class<T> className);
}
