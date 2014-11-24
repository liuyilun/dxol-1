package dxol.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.assertj.core.util.Lists;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "ol_student")
public class Student extends User {
	private String depart;
	private Integer sex;
	private Integer grade;
	private Integer isFinish;
	private Integer altHour;
	private Integer reqHour;
	private Integer examTime;
	private Date summaryUpTime;
	private School school;
	private Summary summary;
	private Identity identity;

	
	private List<StudentCourse> courses=Lists.newArrayList();



	
	@OneToMany(mappedBy = "student")
	public List<StudentCourse> getCourses() {
		return courses;
	}

	public void setCourses(List<StudentCourse> courses) {
		this.courses = courses;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(Integer isFinish) {
		this.isFinish = isFinish;
	}

	public Integer getAltHour() {
		return altHour;
	}

	public void setAltHour(Integer altHour) {
		this.altHour = altHour;
	}

	public Integer getReqHour() {
		return reqHour;
	}

	public void setReqHour(Integer reqHour) {
		this.reqHour = reqHour;
	}

	public Integer getExamTime() {
		return examTime;
	}

	public void setExamTime(Integer examTime) {
		this.examTime = examTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getSummaryUpTime() {
		return summaryUpTime;
	}

	public void setSummaryUpTime(Date summaryUpTime) {
		this.summaryUpTime = summaryUpTime;
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
