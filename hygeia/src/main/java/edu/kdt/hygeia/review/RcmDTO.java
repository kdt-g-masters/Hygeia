package edu.kdt.hygeia.review;

public class RcmDTO {
	int id;
	int review_id;
	String member_id;
	
	public RcmDTO() {
		super();
	}
	
	public RcmDTO(int review_id, String member_id) {
		super();
		this.review_id = review_id;
		this.member_id = member_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReview_id() {
		return review_id;
	}
	
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "RcmDTO [id=" + id + ", review_id=" + review_id + ", member_id=" + member_id + "]";
	}
	
}
