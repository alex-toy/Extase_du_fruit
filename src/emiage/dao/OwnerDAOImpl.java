package emiage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import emiage.entity.Owner;

@Repository
public class OwnerDAOImpl implements OwnerDAO {

	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Owner> getOwners() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Owner> theQuery = currentSession.createQuery("from Owner order by lastName", Owner.class);
		List<Owner> owners = theQuery.getResultList();
		return owners;
	}
	
	
	@Override
	public List<Owner> getOtherOwners(int ownerId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Owner> theQuery = currentSession.createQuery("from Owner where not id=:ownerId", Owner.class);
		theQuery.setParameter("ownerId", ownerId);
		List<Owner> owners = theQuery.getResultList();
		return owners;
	}
	

	@Override
	public void saveOwner(Owner theOwner) {

		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theOwner);
	}

	@Override
	public Owner getOwner(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Owner theOwner = currentSession.get(Owner.class, theId);
		return theOwner;
	}

	@Override
	public void deleteOwner(int ownerId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Owner where id=:ownerId");
		theQuery.setParameter("ownerId", ownerId);
		theQuery.executeUpdate();		
	}

}











