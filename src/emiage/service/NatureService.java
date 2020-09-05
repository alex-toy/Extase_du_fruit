package emiage.service;

import java.util.List;

import emiage.entity.Nature;

public interface NatureService {

	public List<Nature> getNatures();

	public void saveNature(Nature theNature);

	public Nature getNature(int theId);

	public void deleteNature(int theId);

	public Nature getNatureByCode(String Code);
	
}
