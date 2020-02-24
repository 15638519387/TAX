package com.soft.dao;

import java.util.List;
import java.util.Map;

import com.soft.entity.Sub_Dept;

/**
 * 多个预约相关业务Dao层
 * 
 * @author admin
 *
 */
public interface Subscribe_AllDao {

	/**
	 * 处理预约查询
	 * 
	 * @return
	 */
	public Map<String, Object> query(Map<String, Object> map);

	/**
	 * 预约回复表插入数据
	 * 
	 * @param map
	 * @return
	 */
	public int add(Map<String, Object> map);

	/**
	 * 预约服务处理结果
	 * 
	 * @param map
	 * @return
	 */
	public int update(Map<String, Object> map);

	/**
	 * 新增事项部门人
	 * @return
	 */
	public List<Sub_Dept> queryDept();
	
	/**
	 * 添加预约事项
	 * @return
	 */
	public int addMatter(Map<String, Object> map);
	/**
	 * 修改预约事项
	 * @return
	 */
	public int updateMatter(Map<String, Object> map);
	/**
	 * 删除预约事项
	 * @param id
	 * @return
	 */
	public int delAll(String id);
	
	/**
	 * 停用/启用预约事项
	 * @param id
	 * @return
	 */
	public int tq(Map<String, Object> map);
	/**
	 * 预约事项模糊查询
	 * @return
	 */
	public List<Map<String, Object>> queryMatterByLike(Map<String, Object> map);
	
	/**
	 * 查询所有的预约编号
	 * @return
	 */
	public List<Map<String, Object>> queryMatterNo();
	/**
	 * 添加用户预约
	 * @param map
	 * @return
	 */
	public int addSub_Service(Map<String, Object> map);
	
	/**
	 * 查询在主页展示我的预约
	 * @return
	 */
	public List<Map<String, Object>> queryShowMySub(Map<String, Object> map);
/**
 * 查询预约详情
 * @param map
 * @return
 */
	public Map<String, Object> queryMySubInfo(Map<String, Object> map);
	/**
	 * 查询现有的启用的事项
	 * @return
	 */
	public List<Map<String, Object>> selectMatter_no();
}
