package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
	public User findUserByUserNameAndPassword(String usn, String psw) {
		String query = "SELECT usr FROM User usr WHERE usr.userName = :usn AND usr.password = :psw";
		User selectedUser = em.createQuery(query, User.class)
				.setParameter("usn", usn)
				.setParameter("psw", psw)
				.getSingleResult();
		return selectedUser;
	}
	

	@Override
	public User createNewUser(User user) {
		user.setRole("webUser");
		user.setActive(true);
		em.persist(user);
		
		return user;
	}

	@Override
	public boolean updateUser(int id, User user) {
		User userToUpdate = em.find(User.class, id);
		userToUpdate.setUserName(user.getUserName());
		userToUpdate.setPassword(user.getPassword());
		userToUpdate.setFirstName(user.getFirstName());
		userToUpdate.setLastName(user.getLastName());
		userToUpdate.setEmail(user.getEmail());
		userToUpdate.setCreateDate(user.getCreateDate());
		userToUpdate.setImageURL(user.getImageURL());
		userToUpdate.setRole(user.getRole());
		userToUpdate.setActive(user.isActive());
		return true;
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT user FROM User user";
		List<User> users = em.createQuery(jpql, User.class)
			.getResultList();
		return users;
	}



	
}
