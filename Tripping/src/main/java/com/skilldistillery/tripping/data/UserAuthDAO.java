package com.skilldistillery.tripping.data;

import com.skilldistillery.tripping.entities.*;

public interface UserAuthDAO {

	public User findUserById(int id);
	public User createNewUser(User user);
	public boolean updateUser(int id, User user);
//	No delete user bc you'd never delete a user, just set inactive
}
