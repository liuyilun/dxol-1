package dxol.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@IdClass(StudentCourseId.class)
@Table(name = "ol_student_course")
public class StudentCourse implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Long student_id;
	@Id
	private Long course_id;
	@Column(name="time")
	private int time;
	@Column(name="hour")
	private int hour;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "student_id", referencedColumnName="id")
	private Student student;

	@ManyToOne
	@PrimaryKeyJoinColumn(name = "course_id", referencedColumnName="id")
	private Course course;

	

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public Long getStudent_id() {
		return student_id;
	}

	public void setStudent_id(Long student_id) {
		this.student_id = student_id;
	}

	public Long getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Long course_id) {
		this.course_id = course_id;
	}


}
