package com.skilldistillery.tripping.data;

import javax.persistence.*;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.User;

@Transactional
@Service
public class UserAuthDAOImpl implements UserAuthDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User createNewUser(User user) {
		em.persist(user);
		return null;
	}

	@Override
	public boolean updateUser(int id, User user) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
