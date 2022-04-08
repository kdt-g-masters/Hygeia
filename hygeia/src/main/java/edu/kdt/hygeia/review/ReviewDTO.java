package edu.kdt.hygeia.review;

public class ReviewDTO {
	int id;
	String member_id;
	int disease_cntntsSn;
	String dateWrtn;
	int views;
	String title;
	String content;
	String attachments;
	String tag;
	int rcm;
	int nonrcm;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getDisease_cntntsSn() {
		return disease_cntntsSn;
	}
	public void setDisease_cntntsSn(int disease_cntntsSn) {
		this.disease_cntntsSn = disease_cntntsSn;
	}
	public String getDateWrtn() {
		return dateWrtn;
	}
	public void setDateWrtn(String dateWrtn) {
		this.dateWrtn = dateWrtn;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttachments() {
		return attachments;
	}
	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getRcm() {
		return rcm;
	}
	public void setRcm(int rcm) {
		this.rcm = rcm;
	}
	public int getNonrcm() {
		return nonrcm;
	}
	public void setNonrcm(int nonrcm) {
		this.nonrcm = nonrcm;
	}
	
}
