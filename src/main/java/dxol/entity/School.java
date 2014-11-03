package dxol.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ol_school")
public class School extends IdEntityBase {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
