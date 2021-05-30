package com.tour.util;

public class PagingUtil {

	private int startCount; // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount; // 한 페이지에서 보여줄 게시글의 끝 번호
	private StringBuffer pagingHtml;// 페이징 생성자

	/**
	 * currentPage : 현재페이지 totalCount : 전체 게시물 수 blockCount : 한 페이지의 게시물의
	 * 수(=numPerPage) blockPage : 한 화면에 보여줄 페이지 수(=numPerBlock) pageUrl : 호출 페이지
	 * url(링크를 걸어줄 문자열)
	 */
	public PagingUtil(int currentPage, int totalCount, int region, int c_tourid, int c_subid, int blockCount,
			int blockPage, String pageUrl) {

		// 전체 페이지 수 132/10=13.2 즉 총 14페이지
		int totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount + 1;
		endCount = currentPage * blockCount;
		if (endCount > totalCount) {
			endCount = totalCount;
		}
		// 시작 페이지와 마지막 페이지 값 구하기.
		int startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		
		  if (endPage  > blockPage) 
		  {
/*			  if(c_tourid==0 && c_subid==0) {
			   pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) +"&region=" + region +">"); 
			  }else {*/
			  pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) +"&region=" + region + "&c_tourid=" + c_tourid
						+ "&c_subid=" + c_subid +">"); 
				/* } */

		  pagingHtml.append("<<"); pagingHtml.append("</a> &nbsp;&nbsp;");
		  }
		  
		// 현재 페이지는 빨간색
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font>");
			} else {
	
				pagingHtml.append("<a href=" + pageUrl + "?pageNum=" + i + "&region=" + region + "&c_tourid=" + c_tourid
						+ "&c_subid=" + c_subid + ">");

				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;");
		}
		pagingHtml.append("&nbsp;&nbsp;");
		
		
		  // 다음 block 페이지 
		if (totalPage - startPage >= blockPage) {

		  pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (endPage + 1) +"&region=" + region + "&c_tourid=" + c_tourid
					+ "&c_subid=" + c_subid +"> >> </a>");}
		 
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}
}
