package database.dao;

import objects.Store;

import java.util.Set;

public interface StoreDAO {
    Store getStore(int id);

    Set getAllStores();

    boolean insertStore(Store store);

    boolean updateStore(Store store);

    boolean deleteStore(int id);
}
