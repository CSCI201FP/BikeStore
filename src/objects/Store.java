package objects;
//id, location, name
public class Store {
	private int id;
	private String name;
	private String location;
	private String time;
	public Store(int id, String name, String location, String time) {
		this.id = id;
		this.name = name;
		this.location = location;
		this.time = time;
	}
	
	public int getID(){
		return id;
	}
	
	public String getName(){
		return name;
	}
	
	public String getLocation(){
		return location;
	}
	
	public String getTime(){
		return time;
	}
	
	public void setTime(String time){
		this.time = time;
	}
	
	public void setLocation(String location){
		this.location = location;
	}
}
