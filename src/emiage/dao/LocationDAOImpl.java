package emiage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import emiage.entity.Location;
import emiage.entity.Student;

@Repository
public class LocationDAOImpl implements LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Location> getLocations() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Location> theQuery = currentSession.createQuery("from Location", Location.class);
		List<Location> locations = theQuery.getResultList();
		return locations;
	}

	@Override
	public void saveLocation(Location theLocation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theLocation);
	}

	@Override
	public Location getLocation(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Location theLocation = currentSession.get(Location.class, theId);
		return theLocation;
	}
	
	
	
	@Override
	public Location getLocationByStudent(int studentId, int propertyId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query<Location> theQuery = currentSession.createQuery("from Location where id_renter=:studentId and id_property=:propertyId", Location.class);
		theQuery.setParameter("studentId", studentId);
		theQuery.setParameter("propertyId", propertyId);
		return theQuery.getResultList().get(0);
	}
	
	

	@Override
	public void deleteLocation(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Location where id=:locationId");
		theQuery.setParameter("locationId", theId);
		theQuery.executeUpdate();		
	}

}











