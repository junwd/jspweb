package bean;


import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {
	
	private static final long SerialVersionUTD = 0;
	private int pageSize;//ÿҳ��ʾ��������¼
	private int currentPage;//��ǰ�ڼ�ҳ
	private int totalRecord;//�ܹ�����������
	private List<T> datalist;//Ҫ��ʾ������
	private int totalPage;//�ܹ��ж���ҳ
	
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
			
		//�ܼ�¼����
		this.totalRecord = sourceList.size();
		//ÿҳ��ʾ��������¼
		this.pageSize = pageSize;
		//�ܹ��ж���ҳ
		this.totalPage = this.totalRecord/this.pageSize;
		
		if(this.totalRecord % this.pageSize != 0){
			this.totalPage = this.totalPage+1;
		}	
		//��ǰ�ڼ�ҳ����
		if(this.totalPage<pageNum){
			this.currentPage = this.totalPage;
				
		}
		else{
			this.currentPage = pageNum;
		}
		//��ʼ����
		int fromIndex = this.pageSize*(this.currentPage-1);
		//��������
		int toIndex;
		if(this.pageSize *this.currentPage>this.totalRecord){
			toIndex = this.totalRecord;
		}else{
			toIndex = this.pageSize*this.currentPage;
		}
			this.datalist = sourceList.subList(fromIndex, toIndex);
		}
	}

