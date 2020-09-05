package emiage.dao;

import java.util.List;

import emiage.entity.Location;

public interface LocationDAO {

	public List<Location> getLocations();

	public void saveLocation(Location theLocation);

	public Location getLocation(int theId);

	public void deleteLocation(int theId);

	public Location getLocationByStudent(int studentId, int propertyId);
	
}
