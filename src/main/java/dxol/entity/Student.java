package dxol.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ol_student")
public class Student extends User {
	private String depart;
	private int sex;
	private int grade;
	private int isFinish;
	private int altHour;
	private int reqHour;
	private int examTime;
	private School school;
	private Summary summary;
	private Identity identity;

	@OneToMany(mappedBy = "student")
	private List<Course> courses;

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(int isFinish) {
		this.isFinish = isFinish;
	}

	public int getAltHour() {
		return altHour;
	}

	public void setAltHour(int altHour) {
		this.altHour = altHour;
	}

	public int getReqHour() {
		return reqHour;
	}

	public void setReqHour(int reqHour) {
		this.reqHour = reqHour;
	}

	public int getExamTime() {
		return examTime;
	}

	public void setExamTime(int examTime) {
		this.examTime = examTime;
	}

	@ManyToOne
	@JoinColumn(name = "school_id")
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	@OneToOne
	@JoinColumn(name = "summary_id")
	public Summary getSummary() {
		return summary;
	}

	public void setSummary(Summary summary) {
		this.summary = summary;
	}

	@ManyToOne
	@JoinColumn(name = "identity_id")
	public Identity getIdentity() {
		return identity;
	}

	public void setIdentity(Identity identity) {
		this.identity = identity;
	}

}
