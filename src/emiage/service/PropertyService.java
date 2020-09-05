package emiage.service;

import java.util.List;


import emiage.entity.Property;

public interface PropertyService {

	public List<Property> getProperties();

	public void saveProperty(Property theProperty);

	public Property getProperty(int theId);
	
	public List<Property> getPropertyByOwnerId(int ownerId);

	public void deleteProperty(int theId);
	
}



