package dxol.entity;

import java.io.Serializable;


public class StudentCourseId implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long student_id;
	
	private Long course_id;
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((course_id == null) ? 0 : course_id.hashCode());
		result = (prime * result) + ((student_id == null) ? 0 : student_id.hashCode());
		return result;
	}


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
		StudentCourseId other = (StudentCourseId) obj;
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
