package util;

import com.google.gson.Gson;
import database.dao.BikeDAO;
import database.dao_impl.BikeDAOImpl;
import objects.Bike;

import java.util.Set;

public class StoreBackend {
    public static void convertBikeToJson(){
        Gson gson = new Gson();
        BikeDAO bd = new BikeDAOImpl();
        Set<Bike> bikeSet = bd.getAllBikes();
        String bikeString = gson.toJson(bikeSet);
        System.out.println(bikeString);
    }


}
