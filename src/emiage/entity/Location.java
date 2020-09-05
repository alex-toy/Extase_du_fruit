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
import javax.persistence.OneToOne;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="location")
public class Location {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="beginDate")
	@NotNull(message="la date de début est requise")
	private Date beginDate;
	
	@Column(name="endDate")
	private Date endDate;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_renter")
    private Student renter;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_property")
    private Property property;
	
	
	public Location() {}


	public Location(Date beginDate, Date endDate, Student renter, Property property) {
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.renter = renter;
		this.property = property;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getBeginDate() {
		return beginDate;
	}


	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public Student getRenter() {
		return renter;
	}


	public void setRenter(Student renter) {
		this.renter = renter;
	}


	public Property getProperty() {
		return property;
	}


	public void setProperty(Property property) {
		this.property = property;
	}
	
}
