package com.skilldistillery.tripping.data;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import com.mysql.cj.xdevapi.SessionFactory;

public abstract class AbstractAdminDAO < T extends Serializable >{

	private Class< T > clazz;
	@Autowired
	   private SessionFactory sessionFactory;
	 
	   public void setClazz(Class< T > clazzToSet) {
	      clazz = clazzToSet;
	   }
}
