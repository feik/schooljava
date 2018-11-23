package	com.bo;
import java.util.*;
import com.dao.Student_ViolateDAO;
import com.vo.Student_Violate;
public class Student_ViolateBO {
	/**
	* 根据id查询,返回Student_Violate,参数int id   根据id查询
	* @param id
	* @return
	*/
	Student_ViolateDAO dao=new Student_ViolateDAO(); 
	public Student_Violate findById(int vio_id) {
		return dao.findById(vio_id);
	}
	/**
	* 查询全部,返回List<Student_Violate>
	* @param id
	* @return
	*/
	public List<Student_Violate> findAll() {
		return dao.findAll();
	}
	/**
	* 分页查询,返回List<Student_Violate>,int page,int limit 第一个参数是第几页,第二个参数是多少条数据
	* @param id
	* @return
	*/
	public List<Student_Violate> Paging(int page,int limit) {
		return dao.Paging(page,limit);
	}
	/**
	* 添加方法,返回是否删除成功
	* @param
	* @return
	*/
	public int insert(Student_Violate model) {
		return dao.insert(model);
	}
	/**
	* 修改方法,返回是否删除成功,参数传入对象
	* @param model
	* @return
	*/
	public int update(Student_Violate model) {
		return dao.update(model);
	}
	/**
	* 删除方法,返回是否删除成功,参数传入id 根据id进行删除
	* @param id
	* @return
	*/
	public int delete(int vio_id) {
		return dao.delete(vio_id);
	}
	/**
	* 获取行数方法,返回多少行
	* @param
	* @return
	*/
	public int getcount(){
		return dao.getcount();
	}
}
