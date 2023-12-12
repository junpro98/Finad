package com.finad23.DTO;

public class FreeboardLikeDTO {
	private String userID; //작성자 ID
	private int postID;  //게시글번호
	private String isLiked;  //좋아요 yes or no
	private String createdAt;   //누른 날짜
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}

	public String getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(String isLiked) {
		this.isLiked = isLiked;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	
}
