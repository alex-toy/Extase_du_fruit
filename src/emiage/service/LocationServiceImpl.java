package emiage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import emiage.dao.LocationDAO;
import emiage.entity.Location;




@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationDAO locationDAO;
	
	@Override
	@Transactional
	public List<Location> getLocations() {
		return locationDAO.getLocations();
	}

	@Override
	@Transactional
	public void saveLocation(Location theLocation) {

		locationDAO.saveLocation(theLocation);
	}

	@Override
	@Transactional
	public Location getLocation(int theId) {
		
		return locationDAO.getLocation(theId);
	}
	

	@Override
	@Transactional
	public void deleteLocation(int theId) {
		
		locationDAO.deleteLocation(theId);
	}

	@Override
	@Transactional
	public Location getLocationByStudent(int studentId, int propertyId) {
		return locationDAO.getLocationByStudent(studentId, propertyId);
	}
}





