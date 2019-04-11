package database.dao_impl;

import database.dao.BikeDAO;
import database.util.ConnectionFactory;
import objects.Bike;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class BikeDAOImpl implements BikeDAO{

    private Bike extractBikeFromResultSet(ResultSet rs) throws SQLException {
        int bikeID = rs.getInt("bikeID");
        int currentHolderID = rs.getInt("currentHolderID");
        Bike.Gender gender = Bike.Gender.valueOf(rs.getString("gender"));
        double seatHeight = rs.getDouble("seatHeight");
        Bike.Availability availability = Bike.Availability.valueOf(rs.getString("availability")); //a: available , p: pending, u: unavailable
        Bike.Type type = Bike.Type.valueOf(rs.getString("type"));       //mountain, road, etc
        String picture = rs.getString("picture");     //url to the picture
        String model = rs.getString("model");

        return new Bike(bikeID, currentHolderID, gender, seatHeight, availability, type, picture, model);
    }

    @Override
    public Set getAllAvailableBikes() {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Bikes WHERE availability = 'available'");
            Set<Bike> bikes = new HashSet<>();

            while (rs.next()) {
                Bike bike = extractBikeFromResultSet(rs);
                bikes.add(bike);
            }

            return bikes;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Set getAllBikes() {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Bikes");
            Set<Bike> bikes = new HashSet<>();

            while (rs.next()) {
                Bike bike = extractBikeFromResultSet(rs);
                bikes.add(bike);
            }

            return bikes;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }


    @Override
    public Bike getBike(int id) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Bikes WHERE bikeID=" + id);
            if (rs.next()) {
                return extractBikeFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }



    @Override
    public boolean insertBike(Bike bike) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection
                    .prepareStatement("INSERT INTO Bikes (gender, seatHeight, type, picture, availability, currentHolderID, model) VALUES (?, ?, ?, ?, ?, ?, ?)");

            ps.setString(1, bike.getGender().toString());
            ps.setDouble(2, bike.getSeatHeight());
            ps.setString(3, bike.getType().toString());
            ps.setString(4, bike.getPicture());
            ps.setString(5, bike.getAvailability().toString());

            if (bike.getCurrentHolderID() == 0){
                ps.setNull(6, Types.INTEGER);
            }else {
                ps.setInt(6, bike.getCurrentHolderID());
            }
            ps.setString(7, bike.getModel());


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
    public boolean updateBike(Bike bike) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection
                    .prepareStatement("UPDATE Bikes SET gender=?, seatHeight=?, type=?, picture=?, availability=?, currentHolderID=?, model=? WHERE bikeID=?");
            ps.setString(1, bike.getGender().toString());
            ps.setDouble(2, bike.getSeatHeight());
            ps.setString(3, bike.getType().toString());
            ps.setString(4, bike.getPicture());
            ps.setString(5, bike.getAvailability().toString());

            //todo
            System.out.println(bike.getAvailability().toString());

            if (bike.getCurrentHolderID()==0){
                ps.setNull(6, Types.INTEGER);
            }else {
                ps.setInt(6, bike.getCurrentHolderID());
            }
            ps.setString(7,bike.getModel());
            ps.setInt(8, bike.getBikeID());

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
    public boolean deleteBike(int id) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM Bikes WHERE bikeID=" + id);
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}