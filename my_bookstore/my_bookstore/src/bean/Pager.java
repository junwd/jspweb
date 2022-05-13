package bean;


import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {
	
	private static final long SerialVersionUTD = 0;
	private int pageSize;//每页显示多少条记录
	private int currentPage;//当前第几页
	private int totalRecord;//总共多少条数据
	private List<T> datalist;//要显示的数据
	private int totalPage;//总共有多少页
	
	public Pager(){
		super();
	}
	
	public Pager(int pageSize, int currentPage, int totalRecord ,
			int totalPage , List<T> datalist) {
		
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.datalist = datalist;
	}
	
	
	public Pager(int pageNum, int pageSize, List<T> sourceList){
		
		if(sourceList.size() == 0||sourceList ==null){
			return;	
			}
			
		//总记录条数
		this.totalRecord = sourceList.size();
		//每页显示多少条记录
		this.pageSize = pageSize;
		//总共有多少页
		this.totalPage = this.totalRecord/this.pageSize;
		
		if(this.totalRecord % this.pageSize != 0){
			this.totalPage = this.totalPage+1;
		}	
		//当前第几页数据
		if(this.totalPage<pageNum){
			this.currentPage = this.totalPage;
				
		}
		else{
			this.currentPage = pageNum;
		}
		//起始索引
		int fromIndex = this.pageSize*(this.currentPage-1);
		//结束索引
		int toIndex;
		if(this.pageSize *this.currentPage>this.totalRecord){
			toIndex = this.totalRecord;
		}else{
			toIndex = this.pageSize*this.currentPage;
		}
			this.datalist = sourceList.subList(fromIndex, toIndex);
		}
	}

