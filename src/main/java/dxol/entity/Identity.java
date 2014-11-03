package dxol.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ol_identity")
public class Identity extends IdEntityBase {
	private String IdentityName;
	private int reqHour;
	private int altHour;

	public String getIdentityName() {
		return IdentityName;
	}

	public void setIdentityName(String identityName) {
		IdentityName = identityName;
	}

	public int getReqHour() {
		return reqHour;
	}

	public void setReqHour(int reqHour) {
		this.reqHour = reqHour;
	}

	public int getAltHour() {
		return altHour;
	}

	public void setAltHour(int altHour) {
		this.altHour = altHour;
	}

}
