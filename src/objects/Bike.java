package objects;

public class Bike {
	private String state;//not reserved, pending, reserved
	private String name;
	private String type;
	private String picture;
	private int storeID;  //which store the bike belong to
	public Bike(String name, String type, String picture,int storeID, String state) {
		this.name = name;
		this.type = type;
		this.picture = picture;
		this.storeID = storeID;
		this.state = state;
	}
	
	public String getName(){   
		return name;
	}
	
	public String getType(){
		return type;
	}
	
	public String getPicture(){
		return picture;
	}
	
	public String getState(){
		return state;
	}
	public int getStoreID(){
		return storeID;
	}
	public void setState(String state){
		this.state = state;
	}
}
