package database.dao_impl;

import database.dao.StoreDAO;
import database.util.ConnectionFactory;
import objects.Store;

import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class StoreDAOImpl implements StoreDAO {

    private Store extractStoreFromResultSet(ResultSet rs) throws SQLException{
        int storeID = rs.getInt("storeID");
        String  name = rs.getString("name");
        String hours = rs.getString("hours");
        String streetAddress = rs.getString("streetAddress");
        String description = rs.getString("description");
        return new Store(storeID, name, streetAddress, hours, description);
    }

    @Override
    public Store getStore(int id) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Stores WHERE storeID=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractStoreFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Set getAllStores() {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Stores");
            Set<Store> stores = new HashSet<>();
            while (rs.next()) {
                Store store = extractStoreFromResultSet(rs);
                stores.add(store);
            }
            return stores;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }

    @Override
    public boolean insertStore(Store store) {
        return false;
    }

    @Override
    public boolean updateStore(Store store) {
        return false;
    }

    @Override
    public boolean deleteStore(int id) {
        return false;
    }


}
