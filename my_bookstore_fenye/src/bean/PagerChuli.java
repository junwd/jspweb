package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PagerChuli {
	private Connection connection;
	private PreparedStatement pageQuery;
	private ResultSet results;
	public void setSql(int limitMIn,int pageSize, int pageNUm){
		try{
		connection = DBcon.getConnction();
		String sql = "update Pager set  limitMin=?, currentPage=? where pageSize=? ";
		pageQuery = connection.prepareStatement(sql);
		
		pageQuery.setInt(1, limitMIn);
		pageQuery.setInt(2, pageNUm);
		pageQuery.setInt(3, pageSize);
		
		int result = pageQuery.executeUpdate();
		}// �������ݿ��쳣
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(pageQuery);
			DBcon.closeConnection(connection);
		}	
		
		try{
			connection = DBcon.getConnction();
			String sql = "update Pager set flag= case when pageSize= 4 then 1 else 0 end";
			pageQuery = connection.prepareStatement(sql);
			
			int result = pageQuery.executeUpdate();
			}// �������ݿ��쳣
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// �ͷ���Դ
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		
	}
	public Pager getPager(){
		
		Pager pager = new Pager();
		int pagesize=1;

		try{
			connection = DBcon.getConnction();
			String sql = "select * from Pager where flag = 1";
			pageQuery = connection.prepareStatement(sql);
			results = pageQuery.executeQuery(sql);
			if(results.next()){
	/*			pager.setTotolPage(results.getInt("totolPage"));*/
				pager.setCurrentPage(results.getInt("currentPage"));
				pagesize = results.getInt("pageSize");
			}
		
		}// �������ݿ��쳣
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// �ͷ���Դ
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		pager.setTotolPage((int)countTotalPage()/pagesize);
		pager.setPageSize(pagesize);
		return pager;
	
}
	public int countTotalPage(){
		int totolPage =0 ;
		try{
			connection = DBcon.getConnction();
			String sql = "select count(isbn) from titles";
			pageQuery = connection.prepareStatement(sql);
			results = pageQuery.executeQuery(sql);
			if(results.next()){
				totolPage = results.getInt(1);
			}
		}// �������ݿ��쳣
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// �ͷ���Դ
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		return totolPage;
	}
	
	public void fuwei(){
		
		//��������λflag ��1��־���õ�pageSize=4��
		
		try{
			connection = DBcon.getConnction();
			String sql = "update Pager set flag= case when pageSize= 4 then 1 else 0 end";
			pageQuery = connection.prepareStatement(sql);
			int result = pageQuery.executeUpdate();
			}// �������ݿ��쳣
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// �ͷ���Դ
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		//��һ����λcurrentpage
		//�ڶ������¼���totalPage
		int totolPage =(int) countTotalPage()/4;
		try{
			connection = DBcon.getConnction();
			String sql = "update Pager set currentPage=1, limitMin=1, totolPage=? where pageSize= 4";
			pageQuery = connection.prepareStatement(sql);
			pageQuery.setInt(1, totolPage);
			
			int result = pageQuery.executeUpdate();
			}// �������ݿ��쳣
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// �ͷ���Դ
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
	}
		
}
