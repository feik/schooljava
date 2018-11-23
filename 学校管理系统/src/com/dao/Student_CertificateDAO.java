package	com.dao;
import java.sql.*;
import java.util.*;
import com.vo.Student_Certificate;
public class Student_CertificateDAO {
	/**
	* 根据id查询,返回Student_Certificate,参数int id   根据id查询
	* @param id
	* @return
	*/
	public Student_Certificate findById(int cer_id) {
		String sql = "select * from Student_Certificate where cer_id=?";
		Object[] in = {cer_id};
		ResultSet rs = DBUtil.executeQuery(sql, in);
		Student_Certificate model = null;
		try {
			if(rs.next()) {
				model = new Student_Certificate(
					rs.getInt("cer_id"),
					rs.getInt("cer_Studentid"),
					rs.getDate("cer_Time"),
					rs.getDate("cer_Read"),
					rs.getString("cer_Note"));
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return model;
	}
	/**
	* 查询全部,返回List<Student_Certificate>
	* @param id
	* @return
	*/
	public List<Student_Certificate> findAll() {
		String sql = "select * from Student_Certificate";
		ResultSet rs = DBUtil.executeQuery(sql);
		List<Student_Certificate> modelList = new ArrayList<Student_Certificate>();
		Student_Certificate model = null;
		try {
			while(rs.next()) {
				model = new Student_Certificate(
					rs.getInt("cer_id"),
					rs.getInt("cer_Studentid"),
					rs.getDate("cer_Time"),
					rs.getDate("cer_Read"),
					rs.getString("cer_Note"));
				modelList.add(model);
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return modelList;
	}
	/**
	* 分页查询,返回List<Student_Certificate>,int page,int limit 第一个参数是第几页,第二个参数是多少条数据
	* @param id
	* @return
	*/
	public List<Student_Certificate> Paging(int page,int limit) {
	//开始
	//第几页-1乘每页多少条数据+1
	int start=(page-1)*limit+1;//公式用于获取从哪里开始
	//结束
	//第几页乘每页多少条数据
	int end=page*limit;
	String sql = "select * from(SELECT *,ROW_NUMBER() over(order by cer_id desc) row FROM [Student_Certificate]) t where t.row>="+start+" and t.row<="+end;
		ResultSet rs = DBUtil.executeQuery(sql);
		List<Student_Certificate> modelList = new ArrayList<Student_Certificate>();
		Student_Certificate model = null;
		try {
			while(rs.next()) {
				model = new Student_Certificate(
					rs.getInt("cer_id"),
					rs.getInt("cer_Studentid"),
					rs.getDate("cer_Time"),
					rs.getDate("cer_Read"),
					rs.getString("cer_Note"));
				modelList.add(model);
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return modelList;
	}
	/**
	* 添加方法,返回是否删除成功
	* @param
	* @return
	*/
	public int insert(Student_Certificate model) {
		String sql = "insert into Student_Certificate values(?,?,?,?) ";
		Object[] in = {model.getCer_Studentid(),model.getCer_Time(),model.getCer_Read(),model.getCer_Note()};
		return DBUtil.executeUpdate(sql, in);
	}
	/**
	* 修改方法,返回是否删除成功,参数传入对象
	* @param model
	* @return
	*/
	public int update(Student_Certificate model) {
		String sql = "update Student_Certificate set cer_Studentid=?,cer_Time=?,cer_Read=?,cer_Note=? where cer_id=? ";
		Object[] in = {model.getCer_Studentid(),model.getCer_Time(),model.getCer_Read(),model.getCer_Note(),model.getCer_id()};
		return DBUtil.executeUpdate(sql, in);
	}
	/**
	* 删除方法,返回是否删除成功,参数传入id 根据id进行删除
	* @param id
	* @return
	*/
	public int delete(int cer_id) {
		String sql = "delete from Student_Certificate where cer_id=? ";
		Object[] in = {cer_id};
		return DBUtil.executeUpdate(sql, in);
	}
	/**
	* 获取行数方法,返回多少行
	* @param
	* @return
	*/
	public int getcount(){
	int count=0;
	String sql = "select count(*) from Student_Certificate";
	ResultSet rs = DBUtil.executeQuery(sql);
	try {
		while(rs.next()) {
			count=rs.getInt(1);
		}
		DBUtil.close(rs);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return count;
	}	
}
