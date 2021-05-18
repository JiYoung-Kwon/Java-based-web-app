/*페이징 처리를 위한 연산
 * totList = 5000; (검색된 전체 건수)
 * listSize = 10; (한 페이지에 표시될 행수)
 * blockSize = 5; (한 화면에 표시될 페이지 번호 수)
 * totPage = 0; (totList/listSize)
 * startNo, endNo (한 페이지에 표시될 행의 번호)
 * startPage, endPage (한 화면에 표시되는 페이지 번호)
 * nowPage (현재 보고 있는 페이지의 위치)
 * --------------------------------------------
 * totPage = (int)Math.ceil(totList/(double)listSize);
 * endNo = nowPage*listSize;
 * startNo = endNo-listSize+1;
 * if(endNo>totList) endNo = totList;
 * 
 * endPage = (int)Math.ceil(nowPage/(double)blockSize) * blockSize;
 * startPage = endPage - blockSize + 1;
 * if(endPage>totPage) endPage = totPage;
 * */

package product;

public class Page {
	int totList;
	int listSize = 10;
	int blockSize = 5;
	int totPage;
	int startNo;
	int endNo;
	int startPage;
	int endPage;
	int nowPage;
	String findStr = "";
	String gubun = "";
	
	public Page() {}
	
	public Page(String gubun, String findStr, int totList, int nowPage) {
		this.findStr = findStr;
		this.totList = totList;
		this.nowPage = nowPage;
		this.gubun = gubun;
		
		//페이징 연산
		compute();
	}
	
	public void compute() {
		totPage = (int)Math.ceil(totList/(double)listSize);
		endNo = nowPage*listSize;
		startNo = endNo-listSize+1;
		if(endNo>totList) endNo = totList;
		
		endPage = (int)Math.ceil(nowPage/(double)blockSize) * blockSize;
		startPage = endPage-blockSize+1;
		if(endPage>totPage) endPage = totPage;
	}
	
	public int getTotList() {
		return totList;
	}
	public void setTotList(int totList) {
		this.totList = totList;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
}
