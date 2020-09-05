package emiage.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import emiage.validation.StudentCode;
import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name="student")
public class Student {
	
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
	
	@Column(name="studentCode")
	@NotNull(message="le code étudiant doit commencer par MIAGE_")
	@StudentCode(value="MIAGE_", message="le code étudiant doit commencer par MIAGE_")
	private String studentCode;
	
	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="id_rented_property")
	private Property rented_property;
	
	
	public Student() {}


	public Student(String firstName, String lastName, String address, String studentCode) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.studentCode = studentCode;
	}
	
	
	public void formatizeStudent() {
		this.firstName = firstName.toLowerCase().substring(0, 1).toUpperCase() + firstName.toLowerCase().substring(1);
		this.lastName = lastName.toLowerCase().substring(0, 1).toUpperCase() + lastName.toLowerCase().substring(1);
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


	public String getStudentCode() {
		return studentCode;
	}


	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Property getRented_property() {
		return rented_property;
	}


	public void setRented_property(Property rented_property) {
		this.rented_property = rented_property;
	}

	
}
