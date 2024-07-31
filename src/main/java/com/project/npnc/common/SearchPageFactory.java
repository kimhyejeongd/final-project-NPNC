package com.project.npnc.common;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component
public class SearchPageFactory {
	
	public String getPage(int cPage,int numPerpage,int totalData,String searchKey,String searchType,String searchStartDate,String searchEndDate,String url) {
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		StringBuffer sb=new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if(pageNo==1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		}else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>");
//			url+numPerpage+searchKey+searchType+searchStartDate+searchEndDate+
			sb.append("</li>");
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>"+pageNo+"</a>");
				sb.append("</li>");
			}else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>");
				sb.append("</li>");
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		}else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("<ul>");
//		sb.append("<script>");
//		sb.append("function fn_paging(pageNo){");
//		sb.append("console.log('오긴왔냐?')");
//		sb.append("location.assign('${path }/"+url+"?cPage='+pageNo+'&numPerpage="+numPerpage+"&searchKey="+searchKey+"&searchType="+searchType+"&searchStartDate="+searchStartDate+"&searchEndDate="+searchEndDate+"');");
//		sb.append("location.assign('"+url+"?cPage='+pageNo+'&numPerpage="+numPerpage+"');");
//		sb.append("}");
//		sb.append("</script>");
		
		return sb.toString();
		
		
	}
}
