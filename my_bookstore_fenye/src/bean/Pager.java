package bean;

public class Pager {
	
	private int totolPage;
	private int currentPage;
	private int pageSize;
	private int limitMin;
	private int flag;
	public int getTotolPage() {
		return totolPage;
	}
	public void setTotolPage(int totolPage) {
		this.totolPage = totolPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getLimitMin() {
		return limitMin;
	}
	public void setLimitMin(int limitMin) {
		this.limitMin = limitMin;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}

}
