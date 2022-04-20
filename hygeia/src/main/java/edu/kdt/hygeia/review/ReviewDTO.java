package edu.kdt.hygeia.review;

public class ReviewDTO {
	int id;
	String member_id;
	int disease_cntntsSn;
	String dateWrtn;
	int views;
	String title;
	String content;
	String filename;
	String filepath;
	String tag;
	String name;
	
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "ReviewDTO [id=" + id + ", member_id=" + member_id + ", disease_cntntsSn=" + disease_cntntsSn
				+ ", dateWrtn=" + dateWrtn + ", views=" + views + ", title=" + title + ", content=" + content
				+ ", filename=" + filename + ", filepath=" + filepath + ", tag=" + tag + ", name=" + name + "]";
	}
	
}
