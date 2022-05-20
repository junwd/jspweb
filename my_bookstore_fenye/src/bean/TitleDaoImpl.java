//图书表操作类，查询方法public List<Titles> getTitles()。
//增加add()、update()和delete()方法。

//操作类



package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

public class TitleDaoImpl implements TitleDao {
	private Connection connection;
	private PreparedStatement titlesQuery;
	private PreparedStatement pageQuery;
	private ResultSet results;
	private int limitMin=0;
	private int pageSize=4;
	// 返回BookBeans列表集合
	public List<Title> getTitles() {
		List<Title> titlesList = new ArrayList<Title>();
		
		try {
			connection = DBcon.getConnction();
			pageQuery = connection.prepareStatement("SELECT limitMin, pageSize FROM Pager where flag = 1 ");
			ResultSet results = pageQuery.executeQuery();
			if(results.next()){
				limitMin = results.getInt("limitMin");
				pageSize = results.getInt("pageSize");
			}
		
		}
		// 处理数据库异常
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// 释放资源
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}	
		// 获取书籍数据集ResultSet results
		try {
			connection = DBcon.getConnction();
			titlesQuery = connection.prepareStatement("SELECT isbn, title, editionNumber,copyright,"
					+ " publisherID, imageFile, price  FROM titles limit ?, ? ");
			titlesQuery.setInt(1, limitMin);
			titlesQuery.setInt(2, pageSize);
			
			/*set @_limit = limitMin;
			set @_limit1 = pageSize;
			EXCUTE S1 USING @_limit,@_limit;
			*/
			ResultSet results = titlesQuery.executeQuery();
			// 读取行数据
			while (results.next()) {
				Title book = new Title(); // 对每行的图书数据创建一个图书封装类的实例
				// 循环将图书表中的每条记录封装为数据bean并添加到集合类中
				book.setIsbn(results.getString("isbn"));
				book.setTitle(results.getString("title"));
				book.setEditionNumber(results.getInt("editionNumber"));
				book.setCopyright(results.getString("copyright"));
				book.setPublisherId(results.getInt("publisherID"));
				book.setImageFile(results.getString("imageFile"));
				book.setPrice(results.getFloat("price"));
				titlesList.add(book); // 将封将类添加到数组中
			}
		}
		// 处理数据库异常
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// 释放资源
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return titlesList;
	}

	public int add(Title titlebean) { // 利用封装类的实例向表titles中插入记录
		int result = 0;
		try {
			connection = DBcon.getConnction();
			String sql = "insert into titles(isbn, title, editionNumber, ";
			sql += "copyright, publisherID, imageFile, price) values(?,?,?,?,?,?,?)";
			titlesQuery = connection.prepareStatement(sql);
			titlesQuery.setString(1, titlebean.getIsbn());
			titlesQuery.setString(2, titlebean.getTitle());
			titlesQuery.setInt(3, titlebean.getEditionNumber());
			titlesQuery.setString(4, titlebean.getCopyright());
			titlesQuery.setInt(5, titlebean.getPublisherId());
			titlesQuery.setString(6, titlebean.getImageFile());
			titlesQuery.setFloat(7, titlebean.getPrice());
			result = titlesQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 释放资源
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;
	}

	public int delete(String isbn) { // 根据图书ISBN删除记录
		int result = 0;
		try {
			connection = DBcon.getConnction();
			String sql = "delete from titles where isbn='" + isbn + "'";
			titlesQuery = connection.prepareStatement(sql);
			result = titlesQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 释放资源
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;
	}

	public int update(Title titlebean) { // 利用封装类的实例更新表titles中记录
		int result = 0;
		try {
			connection = DBcon.getConnction();
			String sql = "update titles set title=?, editionNumber=?, ";
			sql += "copyright=?, publisherID=?, imageFile=?, price=?  where isbn=?";
			titlesQuery = connection.prepareStatement(sql);
			titlesQuery.setString(1, titlebean.getTitle());
			titlesQuery.setInt(2, titlebean.getEditionNumber());
			titlesQuery.setString(3, titlebean.getCopyright());
			titlesQuery.setInt(4, titlebean.getPublisherId());
			titlesQuery.setString(5, titlebean.getImageFile());
			titlesQuery.setFloat(6, titlebean.getPrice());
			titlesQuery.setString(7, titlebean.getIsbn());
			result = titlesQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 释放资源
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;

	}

	public Title findByIsbn(String isbn) { // 根据ISBN查找图书
		Title book = null;
		try {
			connection = DBcon.getConnction();
			String sql = "SELECT * FROM titles where isbn='" + isbn + "'";
			titlesQuery = connection.prepareStatement(sql);
			results = titlesQuery.executeQuery();
			if (results.next()) {
				book = new Title(); // 每次创建一个封装类的实例
				// 将数据表中的一条记录数据添加到封装类中
				book.setIsbn(results.getString("isbn"));
				book.setTitle(results.getString("title"));
				book.setEditionNumber(results.getInt("editionNumber"));
				book.setCopyright(results.getString("copyright"));
				book.setPublisherId(results.getInt("publisherID"));
				book.setImageFile(results.getString("imageFile"));
				book.setPrice(results.getFloat("price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}

		return book;
	}

}
