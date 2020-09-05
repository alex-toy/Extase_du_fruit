package emiage.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name="owner")
public class Owner {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="firstName")
	@NotNull(message="le prénom est requis")
	@Size(min=1, message="le prénom est requis")
	private String firstName;
	
	@Column(name="lastName")
	@NotNull(message="le nom est requis")
	@Size(min=1, message="le nom est requis")
	private String lastName;
	
	@Column(name="address")
	@NotNull(message="l'adresse est requise")
	@Size(min=1, message="l'adresse est requise")
	private String address;
	
	@Column(name="email")
	@NotNull(message="Merci de donner votre email")
	@Pattern(regexp="^[A-Za-z0-9+_.-]+@(.+)$", message="la syntaxe n'est pas correcte")
	private String email;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="owner",cascade= {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	private List<Property> properties;
	
	
	public Owner() {}
	

	public Owner(
			@NotNull(message = "le prénom est requis") @Size(min = 1, message = "le prénom est requis") String firstName,
			@NotNull(message = "le nom est requis") @Size(min = 1, message = "le nom est requis") String lastName,
			@NotNull(message = "l'adresse est requise") @Size(min = 1, message = "l'adresse est requise") String address,
			@NotNull(message = "Merci de donner votre email") @Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "la syntaxe n'est pas correcte") String email) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Property> getProperties() {
		return properties;
	}

	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}
	
	public void add(Property property) {
		
		if (properties == null) {
			properties = new ArrayList<>();
		}
		
		properties.add(property);
		
		property.setOwner(this);
	}
	
	

}
