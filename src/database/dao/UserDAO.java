package database.dao;

import objects.User;

import java.util.Set;

public interface UserDAO {
    User getUser(int id);

    Set getAllUsers();

    boolean insertUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);
}
