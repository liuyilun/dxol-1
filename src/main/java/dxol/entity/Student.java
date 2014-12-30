package dxol.entity;

import java.util.Date;
import java.util.List;

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
	private Integer grade = 0;
	private Integer isFinish = 1;
	private Integer altHour = 0;
	private Integer reqHour = 0;
	private Integer examTime = 2;
	private Date summaryUpTime;
	private School school;
	private Summary summary;
	private Identity identity;

	private List<StudentCourse> courses;
	
	public Student() {
		super();
		setRole("student");
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

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
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

	@OneToMany(mappedBy = "student")
	public List<StudentCourse> getCourses() {
		return courses;
	}

	public void setCourses(List<StudentCourse> courses) {
		this.courses = courses;
	}

	public void addCourse(Course course) {
		StudentCourse newStudentCourse = new StudentCourse();

		if (this.courses == null) {
			courses = Lists.newArrayList();
		}

		newStudentCourse.setStudent(this);
		newStudentCourse.setCourse(course);

		newStudentCourse.setStudentId(this.getId());
		newStudentCourse.setCourseId(course.getId());

		this.courses.add(newStudentCourse);
		course.getStudents().add(newStudentCourse);
	}

	public Course getCourseById(Long id) {
		for (StudentCourse studentCourse : courses) {
			if(studentCourse.getCourseId() == id){
				return studentCourse.getCourse();
			}
		}
		return null;
	}

	public StudentCourse getStudentCourseByCouseId(Long id) {
		for (StudentCourse studentCourse : courses) {
			if(studentCourse.getCourseId() == id){
				return studentCourse;
			}
		}
		return null;
	}

	public void countReqHour() {
		reqHour = 0;
		for (StudentCourse studentCourse : courses) {
			  if(studentCourse.getCourse().getReqAlt()  == 1){
				  reqHour += studentCourse.getHour();
			  }
		}
		
	}

	public void countAltHour() {
		altHour = 0;
		for (StudentCourse studentCourse : courses) {
			  if(studentCourse.getCourse().getReqAlt() == 2){
				  altHour += studentCourse.getHour();
			  }
		}
	}

}
