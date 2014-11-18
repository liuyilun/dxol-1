package dxol.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ol_identity")
public class Identity extends IdEntityBase {
	private String identityName;
	private Integer reqHour;
	private Integer altHour;

	public String getIdentityName() {
		return identityName;
	}

	public void setIdentityName(String identityName) {
		this.identityName = identityName;
	}

	public Integer getReqHour() {
		return reqHour;
	}

	public void setReqHour(Integer reqHour) {
		this.reqHour = reqHour;
	}

	public Integer getAltHour() {
		return altHour;
	}

	public void setAltHour(Integer altHour) {
		this.altHour = altHour;
	}

	

}
