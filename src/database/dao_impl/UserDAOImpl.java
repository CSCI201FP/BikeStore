package database.dao_impl;

import database.dao.UserDAO;
import database.util.ConnectionFactory;
import objects.User;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class UserDAOImpl implements UserDAO{

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        int userID = rs.getInt("userID");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String name = rs.getString("name");
        boolean isManager = rs.getBoolean("isManager");
        boolean isPending = rs.getBoolean("isPending");
        String phone = rs.getString("phone");
        int currentBikeID = rs.getInt("currentBikeID");

        return new User(userID, name, password, email, phone, isManager, isPending, currentBikeID);
    }


    @Override
    public boolean emailPasswordMatch(String email, String pw) {
        User user = getUser(email);
        return user!=null && user.getPassword().equals(pw);
    }

    @Override
    public User getUser(String email) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Users WHERE email= '" + email +"'");
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean existEmail(String  email) {
        return getUser(email)!=null;
    }

    @Override
    public User getUser(int id) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Users WHERE userID=" + id);
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }


    @Override
    public Set getAllUsers() {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Users");
            Set<User> users = new HashSet<>();
            while (rs.next()) {
                User user = extractUserFromResultSet(rs);
                users.add(user);
            }
            return users;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insertUser(User user) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection
                    .prepareStatement("INSERT INTO Users " +
                            "(email, password, name, isManager, isPending, phone, currentBikeID) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?)");

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setBoolean(4, user.isManager());
            ps.setBoolean(5, user.isPending());
            ps.setString(6, user.getPhone());

            if (user.getCurrentBikeID() == 0){
                ps.setNull(7, Types.INTEGER);
            }else {
                ps.setInt(7, user.getCurrentBikeID());
            }


            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection
                    .prepareStatement("UPDATE Users " +
                            "SET email=?, password=?, name=?, isManager=?, isPending=?, phone=?, currentBikeID=?" +
                            "WHERE userID=?");
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setBoolean(4, user.isManager());
            ps.setBoolean(5,user.isPending());
            ps.setString(6,user.getPhone());
            ps.setInt(7,user.getCurrentBikeID());

            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM Users WHERE userID=" + id);
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }



/*
    public static void main(String[] args) {
        User u = new User(0 , "dog", "dog123", "dog@dog", "123454321", false, false, 0);
        UserDAOImpl userDAO = new UserDAOImpl();
        userDAO.insertUser(u);
    }
*/

}


