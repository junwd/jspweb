//ͼ�������࣬��ѯ����public List<Titles> getTitles()��
//����add()��update()��delete()������

//������



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
	// ����BookBeans�б���
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
		// �������ݿ��쳣
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}	
		// ��ȡ�鼮���ݼ�ResultSet results
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
			// ��ȡ������
			while (results.next()) {
				Title book = new Title(); // ��ÿ�е�ͼ�����ݴ���һ��ͼ���װ���ʵ��
				// ѭ����ͼ����е�ÿ����¼��װΪ����bean����ӵ���������
				book.setIsbn(results.getString("isbn"));
				book.setTitle(results.getString("title"));
				book.setEditionNumber(results.getInt("editionNumber"));
				book.setCopyright(results.getString("copyright"));
				book.setPublisherId(results.getInt("publisherID"));
				book.setImageFile(results.getString("imageFile"));
				book.setPrice(results.getFloat("price"));
				titlesList.add(book); // ���⽫����ӵ�������
			}
		}
		// �������ݿ��쳣
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return titlesList;
	}

	public int add(Title titlebean) { // ���÷�װ���ʵ�����titles�в����¼
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
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;
	}

	public int delete(String isbn) { // ����ͼ��ISBNɾ����¼
		int result = 0;
		try {
			connection = DBcon.getConnction();
			String sql = "delete from titles where isbn='" + isbn + "'";
			titlesQuery = connection.prepareStatement(sql);
			result = titlesQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;
	}

	public int update(Title titlebean) { // ���÷�װ���ʵ�����±�titles�м�¼
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
		// �ͷ���Դ
		finally {
			DBcon.closeResultSet(results);
			DBcon.closeStatement(titlesQuery);
			DBcon.closeConnection(connection);
		}
		return result;

	}

	public Title findByIsbn(String isbn) { // ����ISBN����ͼ��
		Title book = null;
		try {
			connection = DBcon.getConnction();
			String sql = "SELECT * FROM titles where isbn='" + isbn + "'";
			titlesQuery = connection.prepareStatement(sql);
			results = titlesQuery.executeQuery();
			if (results.next()) {
				book = new Title(); // ÿ�δ���һ����װ���ʵ��
				// �����ݱ��е�һ����¼������ӵ���װ����
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
