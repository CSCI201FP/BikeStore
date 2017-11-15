package database.dao;

import objects.Bike;

import java.util.Set;

public interface BikeDAO {
    Bike getBike(int id);

    Set getAllBikes();

    boolean insertBike(Bike bike);

    boolean updateBike(Bike bike);

    boolean deleteBike(int id);
}
