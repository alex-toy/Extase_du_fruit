package emiage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="nature")
public class Nature {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@NotNull(message="la nature est requise")
	@Column(name="codeNature", unique=true)
	private String codeNature;
	
	@NotNull(message="le prix ne peut pas être nul")
	@Min(value=1, message="le pourcentage ne peut pas être nul")
	@Max(value=100, message="le pourcentage doit être inférieur à 100")
	@Column(name="pourcentage")
	private Integer pourcentage;
	
	
	public Nature() {}

	public Nature(@NotNull(message = "la nature est requise") String codeNature,
			@NotNull(message = "le prix ne peut pas être nul") @Min(value = 1, message = "le pourcentage ne peut pas être nul") @Max(value = 100, message = "le pourcentage doit être inférieur à 100") Integer pourcentage) {
		super();
		this.codeNature = codeNature;
		this.pourcentage = pourcentage;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodeNature() {
		return codeNature;
	}

	public void setCodeNature(String codeNature) {
		this.codeNature = codeNature;
	}

	public Integer getPourcentage() {
		return pourcentage;
	}

	public void setPourcentage(Integer pourcentage) {
		this.pourcentage = pourcentage;
	}
	
	

}
