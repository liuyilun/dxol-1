package dxol.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.common.collect.Lists;

@Entity
@Table(name = "ol_course")
public class Course extends IdEntityBase {
	private Identity identity;
	private String courseName;
	private int hour;
	private int reqAlt;
	private String content;


	

	private List<StudentCourse> students=Lists.newArrayList();;
	@OneToMany(mappedBy = "course")
	public List<StudentCourse> getStudents() {
		return students;
	}

	public void setStudents(List<StudentCourse> students) {
		this.students = students;
	}

	@ManyToOne
	@JoinColumn(name = "identity_id")
	public Identity getIdentity() {
		return identity;
	}

	public void setIdentity(Identity identity) {
		this.identity = identity;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReqAlt() {
		return reqAlt;
	}

	public void setReqAlt(int reqAlt) {
		this.reqAlt = reqAlt;
	}

}
