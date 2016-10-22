package com.kbhkn.dao;

import java.util.List;

/**
 * Created by kbhkn on 22.10.2016 19:27.
 */

//CRUD Operators
//DAO Layer
//Dependency Injection used.
public interface GenericDao{
	public void save(Object object);
	
	public <T> Object findById(Class<T> className, Integer id);
	
	public void update(Object object);
	
	public <T> void delete(Class<T> className, Integer id);
	
	public <T> List<T> findAll(Class<T> className);
}
