package cs5530;

import java.util.ArrayList;
import java.io.Serializable;
import cs5530.*;

public class User extends Object implements Serializable{
	public String login;
	public String password;
	public boolean isAdmin;
	
	ArrayList<Reservation> reservations;
	ArrayList<Visit> visits;
	public User(String login, String password, boolean isAdmin)
	{		
		//UserType is whether the user is admin or not
		this.login = login;
		this.password = password;
		this.isAdmin = isAdmin;
		reservations=new ArrayList<Reservation>();
		visits= new ArrayList<Visit>();		
	}
	
	public void addReservation(TH th,Period period)
	{
		reservations.add(new Reservation(th,period.start,period.stop));
	}
	@Override
	public String toString()
	{
		return login;
	}
}
