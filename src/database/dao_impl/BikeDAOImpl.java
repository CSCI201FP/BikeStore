package database.dao_impl;

import database.dao.BikeDAO;
import objects.Bike;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public class BikeDAOImpl implements BikeDAO{

    private Bike extractUserFromResultSet(ResultSet rs) throws SQLException {
        int bikeID = rs.getInt("bikeID");
        int currentHolderID = rs.getInt("currentHolderID");
        boolean gender = rs.getBoolean("gender");
        private double seatHeight;
        private char availability; //a: available , p: pending, u: unavailable
        private String type;       //mountain, road, etc
        private String picture;     //url to the picture


    }

    @Override
    public Bike getBike(int id) {
        return null;
    }

    @Override
    public Set getAllBikes() {
        return null;
    }

    @Override
    public boolean insertBike(Bike bike) {
        return false;
    }

    @Override
    public boolean updateBike(Bike bike) {
        return false;
    }

    @Override
    public boolean deleteBike(int id) {
        return false;
    }
}
