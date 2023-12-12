package com.finad23.DTO;

public class AdstoreReviewDTO {
	private int itemReviewNumber;
	private String nomalUserId;
	private String itemReviewText;
	private String attachedFile;
	private String reviewTitle;
	
	public int getItemReviewNumber() {
		return itemReviewNumber;
	}
	public String getNomalUserId() {
		return nomalUserId;
	}
	public void setNomalUserId(String nomalUserId) {
		this.nomalUserId = nomalUserId;
	}
	public void setItemReviewNumber(int itemReviewNumber) {
		this.itemReviewNumber = itemReviewNumber;
	}

	public String getAttachedFile() {
		return attachedFile;
	}
	public void setAttachedFile(String attachedFile) {
		this.attachedFile = attachedFile;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getItemReviewText() {
		return itemReviewText;
	}
	public void setItemReviewText(String itemReviewText) {
		this.itemReviewText = itemReviewText;
	}

}
