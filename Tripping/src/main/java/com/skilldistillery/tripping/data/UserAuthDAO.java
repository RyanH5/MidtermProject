package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.User;

public interface UserAuthDAO {

	public User findUserById(int id);
	public User findUserByUserNameAndPassword(String usn, String psw);
	public User createNewUser(User user);
	public boolean updateUser(int id, User user);
//	No delete user bc you'd never delete a user, just set inactive
	public List<User> findAllUsers();
}
