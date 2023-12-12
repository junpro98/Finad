package com.finad23.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.CategoryFilterDTO;
import com.finad23.mybatis.CategoryFilterConn;

public class CategoryFilterExtr implements ConInter { // DB처리하는 파일
	static CategoryFilterExtr extr = new CategoryFilterExtr();

	public static CategoryFilterExtr instance() {
		return extr;
	}

	@Override
	public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		CategoryFilterConn conn = CategoryFilterConn.instance();

		String shorts = rq.getParameter("shorts");
		String sub = rq.getParameter("sub");
		String price = rq.getParameter("price");
		String avg = rq.getParameter("avg");
		String offer = rq.getParameter("offer");

		if (shorts.equalsIgnoreCase("true")) {
			shorts = "true";
		} else if (shorts.equalsIgnoreCase("false")) {
			shorts = "false";
		} else {
			shorts = "nothing";
		}

		if (sub.equalsIgnoreCase("under10")) {
			sub = "under10";
		} else if (sub.equalsIgnoreCase("over10")) {
			sub = "over10";
		} else if (sub.equalsIgnoreCase("over20")) {
			sub = "over20";
		} else if (sub.equalsIgnoreCase("over50")) {
			sub = "over50";
		} else if (sub.equalsIgnoreCase("over100")) {
			sub = "over100";
		} else {
			sub = "nothing";
		}

		if (price.equalsIgnoreCase("under30")) {
			price = "under30";
		} else if (price.equalsIgnoreCase("over30")) {
			price = "over30";
		} else if(price.equalsIgnoreCase("over100")) {
			price = "over100";
		} else if(price.equalsIgnoreCase("over300")) {
			price = "over300";
		} else {
			price = "nothong";
		}

		if (avg.equalsIgnoreCase("under1000")) {
			avg = "under1000";
		} else if (avg.equalsIgnoreCase("over1000")) {
			avg = "over1000";
		} else if (avg.equalsIgnoreCase("over5000")) {
			avg = "over5000";
		} else if (avg.equalsIgnoreCase("over10000")) {
			avg = "over10000";
		} else {
			avg = "nothing";
		}

		if (offer.equalsIgnoreCase("over1")) {
			offer = "over1";
		} else if (offer.equalsIgnoreCase("over10")) {
			offer = "over10";
		} else if (offer.equalsIgnoreCase("over50")) {
			offer = "over50";
		} else if (offer.equalsIgnoreCase("over99")) {
			offer = "over99";
		} else {
			offer = "nothing";
		}

		CategoryFilterDTO filter = new CategoryFilterDTO();
		String cate = rq.getParameter("url");
		filter.setCategory(cate);
		filter.setShorts(shorts);
		filter.setSub(sub);
		filter.setPrice(price);
		filter.setAvg(avg);
		filter.setOffer(offer);
		
		List<CategoryFilterDTO> list = conn.filter(filter);
		
		rq.setAttribute("List", list);
		
//		System.out.println("Extr페이지 쇼츠"+ filter.getShorts());
//		System.out.println("Extr페이지 구독자"+ filter.getSub());
//		System.out.println("Extr페이지 가격"+ filter.getPrice());
//		System.out.println("Extr페이지 조회수"+ filter.getAvg());
//		System.out.println("Extr페이지 제안수"+ filter.getOffer());
//		
		
		return null;
	}

}
