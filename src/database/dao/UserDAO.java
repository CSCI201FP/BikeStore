package database.dao;

import objects.User;

import java.util.Set;

public interface UserDAO {
    User getUser(int id);

    User getUser(String email);

    Set getAllUsers();

    boolean existEmail(String  name);

    boolean insertUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);
}
