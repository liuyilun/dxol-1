package dxol.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
// @IdClass(StudentCourseId.class)
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

	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;

	@ManyToOne
	@JoinColumn(name = "course_id")
	private Course course;

	private int time;
	private int hour;

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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((course_id == null) ? 0 : course_id.hashCode());
		result = (prime * result) + ((student_id == null) ? 0 : student_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		StudentCourse other = (StudentCourse) obj;
		if (course_id == null) {
			if (other.course_id != null) {
				return false;
			}
		} else if (!course_id.equals(other.course_id)) {
			return false;
		}
		if (student_id == null) {
			if (other.student_id != null) {
				return false;
			}
		} else if (!student_id.equals(other.student_id)) {
			return false;
		}
		return true;
	}

}
