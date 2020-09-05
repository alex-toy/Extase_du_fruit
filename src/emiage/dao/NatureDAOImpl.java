package emiage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import emiage.entity.Nature;

@Repository
public class NatureDAOImpl implements NatureDAO {

	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Nature> getNatures() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Nature> theQuery = currentSession.createQuery("from Nature order by codeNature", Nature.class);
		List<Nature> natures = theQuery.getResultList();
		return natures;
	}

	@Override
	public void saveNature(Nature theNature) {

		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theNature);
	}

	@Override
	public Nature getNature(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Nature theNature = currentSession.get(Nature.class, theId);
		return theNature;
	}
	
	
	@Override
	public Nature getNatureByCode(String Code) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query<Nature> theQuery = currentSession.createQuery("from Nature where codeNature=:Code", Nature.class);
		theQuery.setParameter("Code", Code);
		return theQuery.getResultList().get(0);
	}
	

	@Override
	public void deleteNature(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Nature where id=:natureId");
		theQuery.setParameter("natureId", theId);
		theQuery.executeUpdate();		
	}

}











