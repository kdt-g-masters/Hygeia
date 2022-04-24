package edu.kdt.hygeia.survey;

public class SurveyDTO {
	
	String member_id; 
	String resultDisease;
	
	
	int no; 
	String question; 
	String answer1; 
	String answer2; 
	String answer3; 
	String answer4; 
	String answer5; 
	
	
	int disease_cntntsSn; 
	String diseaseName; 
	int value; 
	
	
	String name; 
	String foods;
	

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getResultDisease() {
		return resultDisease;
	}
	public void setResultDisease(String resultDisease) {
		this.resultDisease = resultDisease;
	} 
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getAnswer3() {
		return answer3;
	}
	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}
	public String getAnswer4() {
		return answer4;
	}
	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}
	public String getAnswer5() {
		return answer5;
	}
	public void setAnswer5(String answer5) {
		this.answer5 = answer5;
	}
	
	
	public int getDisease_cntntsSn() {
		return disease_cntntsSn;
	}
	public void setDisease_cntntsSn(int disease_cntntsSn) {
		this.disease_cntntsSn = disease_cntntsSn;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getFoods() {
		return foods;
	}
	public void setFoods(String foods) {
		this.foods = foods;
	}
	
}
