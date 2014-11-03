package dxol.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ol_summary")
public class Summary extends IdEntityBase {
	private String path;
	private String fileName;
	private Student student;

}
