package dxol.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ol_exam_info")
public class ExamInfo extends IdEntityBase {
	private Identity identity;

	private Course course;
	
	private String questionInfo;

	private String choiceA;

	private String choiceB;

	private String choiceC;

	private String choiceD;
	
	private String rightAnswer;
	
	@ManyToOne
	@JoinColumn(name = "identity_id")
	public Identity getIdentity() {
		return identity;
	}

	public void setIdentity(Identity identity) {
		this.identity = identity;
	}
	
    @ManyToOne
    @JoinColumn(name="course_id")
    public Course getCourse() {
    	return course;
    }
    
    public void setCourse(Course course) {
    	this.course = course;
    }
    
	public String getQuestionInfo() {
		return questionInfo;
	}

	public void setQuestionInfo(String questionInfo) {
		this.questionInfo = questionInfo;
	}

	@Column(name = "choice_A")
	public String getChoiceA() {
		return choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}

	@Column(name = "choice_B")
	public String getChoiceB() {
		return choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}

	@Column(name = "choice_C")
	public String getChoiceC() {
		return choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}

	@Column(name = "choice_D")
	public String getChoiceD() {
		return choiceD;
	}

	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}

	public String getRightAnswer() {
		return rightAnswer;
	}

	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}

}
