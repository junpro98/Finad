package com.finad23.DTO;

public class UserLikeDTO {

	private String id, nickName, like; // 관심 누른 사람, 눌러진 크리에이터 닉네임, 관심 눌러졌는지 파악

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	
}
