package emiage.service;

import java.util.List;

import emiage.entity.Owner;

public interface OwnerService {

	public List<Owner> getOwners();

	public void saveOwner(Owner theOwner);

	public Owner getOwner(int theId);

	public void deleteOwner(int theId);

	public List<Owner> getOtherOwners(int ownerId);
	
}
