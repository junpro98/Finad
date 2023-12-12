package com.finad23.DTO;

public class CBoardVolunteerDTO {
	private int companyBoardNum;
	private String title, companyName, companyInfo1, companyInfo2, companyInfo3; //제목, 마케팅 담당자 정보
	private String recruitmentDate1, recruitmentDate2, promotionDate1, promotionDate2; //모집 기간, 광고기간
	private String recruitmentNum; //모집인원
	private int avgViewers, subscribers; //모집인원, 평균 시청자
	private String sex; // 최소 구독자수
	private String underachiever; //미달자 지원
	private int promotionMoney; //총 광고 진행비
	private String promotionType, previousPromotion1, previousPromotion2, previousPromotion3; //광고 유형, 이전 광고 사례
	private String text, companyWriteDate; //광고 내용, 작성일
	private String id;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private int volunteerNumber;
	private String volunteer;
	private int companyBoardNumber;
	private int volunteerViewer;
	private int volunteerSubscribe;
	private int volunteerSex;
	
	public int getVolunteerSex() {
		return volunteerSex;
	}
	public void setVolunteerSex(int volunteerSex) {
		this.volunteerSex = volunteerSex;
	}
	public void setCompanyBoardNumber(int companyBoardNumber) {
		this.companyBoardNumber = companyBoardNumber;
	}
	private String time;
	private int vnum;
	
	
	
	public int getVnum() {
		return vnum;
	}
	public void setVnum(int vnum) {
		this.vnum = vnum;
	}
	public int getCompanyBoardNum() {
		return companyBoardNum;
	}
	public void setCompanyBoardNum(int companyBoardNum) {
		this.companyBoardNum = companyBoardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyInfo1() {
		return companyInfo1;
	}
	public void setCompanyInfo1(String companyInfo1) {
		this.companyInfo1 = companyInfo1;
	}
	public String getCompanyInfo2() {
		return companyInfo2;
	}
	public void setCompanyInfo2(String companyInfo2) {
		this.companyInfo2 = companyInfo2;
	}
	public String getCompanyInfo3() {
		return companyInfo3;
	}
	public void setCompanyInfo3(String companyInfo3) {
		this.companyInfo3 = companyInfo3;
	}
	public String getRecruitmentDate1() {
		return recruitmentDate1;
	}
	public void setRecruitmentDate1(String recruitmentDate1) {
		this.recruitmentDate1 = recruitmentDate1;
	}
	public String getRecruitmentDate2() {
		return recruitmentDate2;
	}
	public void setRecruitmentDate2(String recruitmentDate2) {
		this.recruitmentDate2 = recruitmentDate2;
	}
	public String getPromotionDate1() {
		return promotionDate1;
	}
	public void setPromotionDate1(String promotionDate1) {
		this.promotionDate1 = promotionDate1;
	}
	public String getPromotionDate2() {
		return promotionDate2;
	}
	public void setPromotionDate2(String promotionDate2) {
		this.promotionDate2 = promotionDate2;
	}
	public String getRecruitmentNum() {
		return recruitmentNum;
	}
	public void setRecruitmentNum(String recruitmentNum) {
		this.recruitmentNum = recruitmentNum;
	}
	public int getAvgViewers() {
		return avgViewers;
	}
	public void setAvgViewers(int avgViewers) {
		this.avgViewers = avgViewers;
	}
	public int getSubscribers() {
		return subscribers;
	}
	public void setSubscribers(int subscribers) {
		this.subscribers = subscribers;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUnderachiever() {
		return underachiever;
	}
	public void setUnderachiever(String underachiever) {
		this.underachiever = underachiever;
	}
	public int getPromotionMoney() {
		return promotionMoney;
	}
	public void setPromotionMoney(int promotionMoney) {
		this.promotionMoney = promotionMoney;
	}
	public String getPromotionType() {
		return promotionType;
	}
	public void setPromotionType(String promotionType) {
		this.promotionType = promotionType;
	}
	public String getPreviousPromotion1() {
		return previousPromotion1;
	}
	public void setPreviousPromotion1(String previousPromotion1) {
		this.previousPromotion1 = previousPromotion1;
	}
	public String getPreviousPromotion2() {
		return previousPromotion2;
	}
	public void setPreviousPromotion2(String previousPromotion2) {
		this.previousPromotion2 = previousPromotion2;
	}
	public String getPreviousPromotion3() {
		return previousPromotion3;
	}
	public void setPreviousPromotion3(String previousPromotion3) {
		this.previousPromotion3 = previousPromotion3;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getCompanyWriteDate() {
		return companyWriteDate;
	}
	public void setCompanyWriteDate(String companyWriteDate) {
		this.companyWriteDate = companyWriteDate;
	}
	public int getVolunteerNumber() {
		return volunteerNumber;
	}
	public void setVolunteerNumber(int volunteerNumber) {
		this.volunteerNumber = volunteerNumber;
	}
	public String getVolunteer() {
		return volunteer;
	}
	public void setVolunteer(String volunteer) {
		this.volunteer = volunteer;
	}
	public int getCompanyBoardNumber() {
		return companyBoardNumber;
	}
	public void setCompanyBoardNumer(int companyBoardNumber) {
		this.companyBoardNumber = companyBoardNumber;
	}
	public int getVolunteerViewer() {
		return volunteerViewer;
	}
	public void setVolunteerViewer(int volunteerViewer) {
		this.volunteerViewer = volunteerViewer;
	}
	public int getVolunteerSubscribe() {
		return volunteerSubscribe;
	}
	public void setVolunteerSubscribe(int volunteerSubscribe) {
		this.volunteerSubscribe = volunteerSubscribe;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
