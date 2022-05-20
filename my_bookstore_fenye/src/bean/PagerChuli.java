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
		}// 处理数据库异常
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// 释放资源
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
			}// 处理数据库异常
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// 释放资源
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
		
		}// 处理数据库异常
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// 释放资源
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
		}// 处理数据库异常
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// 释放资源
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		return totolPage;
	}
	
	public void fuwei(){
		
		//第三步复位flag 将1标志设置到pageSize=4上
		
		try{
			connection = DBcon.getConnction();
			String sql = "update Pager set flag= case when pageSize= 4 then 1 else 0 end";
			pageQuery = connection.prepareStatement(sql);
			int result = pageQuery.executeUpdate();
			}// 处理数据库异常
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// 释放资源
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
		//第一步复位currentpage
		//第二步重新计算totalPage
		int totolPage =(int) countTotalPage()/4;
		try{
			connection = DBcon.getConnction();
			String sql = "update Pager set currentPage=1, limitMin=1, totolPage=? where pageSize= 4";
			pageQuery = connection.prepareStatement(sql);
			pageQuery.setInt(1, totolPage);
			
			int result = pageQuery.executeUpdate();
			}// 处理数据库异常
			catch (SQLException exception) {
				exception.printStackTrace();
			}
			// 释放资源
			finally {
				DBcon.closeResultSet(results);
				DBcon.closeStatement(pageQuery);
				DBcon.closeConnection(connection);
			}	
	}
		
}
