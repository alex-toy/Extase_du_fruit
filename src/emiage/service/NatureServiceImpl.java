package emiage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import emiage.dao.NatureDAO;
import emiage.entity.Nature;




@Service
public class NatureServiceImpl implements NatureService {

	@Autowired
	private NatureDAO natureDAO;
	
	@Override
	@Transactional
	public List<Nature> getNatures() {
		return natureDAO.getNatures();
	}

	@Override
	@Transactional
	public void saveNature(Nature theNature) {

		natureDAO.saveNature(theNature);
	}

	@Override
	@Transactional
	public Nature getNature(int theId) {
		
		return natureDAO.getNature(theId);
	}
	
	
	@Override
	@Transactional
	public Nature getNatureByCode(String Code) {
		
		return natureDAO.getNatureByCode(Code);
	}
	
	
	@Override
	@Transactional
	public void deleteNature(int theId) {
		
		natureDAO.deleteNature(theId);
	}
}





