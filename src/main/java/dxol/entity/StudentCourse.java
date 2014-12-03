package dxol.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(StudentCourseId.class)
@Table(name = "ol_student_course")
public class StudentCourse implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2873540752029162226L;
	@Id
	@Column(name="student_id")
	private Long studentId;
	@Id
	@Column(name="course_id")
	private Long courseId;
	@Column(name="time")
	private int time = 0;
	@Column(name="hour")
	private int hour = 0;
	@ManyToOne
	@JoinColumn(name = "student_id", referencedColumnName="id", updatable = false, insertable = false)
	private Student student;

	@ManyToOne
	@JoinColumn(name = "course_id", referencedColumnName="id", updatable = false, insertable = false)
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

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	

}
