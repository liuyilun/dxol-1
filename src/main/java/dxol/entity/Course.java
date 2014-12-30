package dxol.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.assertj.core.util.Lists;

@Entity
@Table(name = "ol_course")
public class Course extends IdEntityBase {
	
	
	private Identity identity;
	private String courseName;
	private int hour = 0;
	private int reqAlt;
	private String content;

	private List<StudentCourse> students;
	private List<ExamInfo> examinfos=Lists.newArrayList();

	@OneToMany(fetch =FetchType.EAGER,   
            targetEntity = ExamInfo.class,mappedBy="course")
	public List<ExamInfo> getExaminfos() {
		return examinfos;
	}

	public void setExaminfos(List<ExamInfo> examinfos) {
		this.examinfos = examinfos;
	}

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

	
	public void addStudent(Student student){
			StudentCourse studentcourse = new StudentCourse();
			
			if(this.students == null){
				students = Lists.newArrayList();
			}
			studentcourse.setStudent(student);
			studentcourse.setCourse(this);
			
			studentcourse.setCourseId(this.getId());
			studentcourse.setStudentId(student.getId());
			
			this.students.add(studentcourse);
		}
		
}

