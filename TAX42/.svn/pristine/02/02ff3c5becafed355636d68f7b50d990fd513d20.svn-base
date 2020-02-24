package com.soft.dao;

import java.util.List;
import java.util.Map;

public interface ComplainDao {
	/**
	 * 增加投诉信息
	 * @param map
	 * @return
	 */
	public int insert(Map<String, Object> map);
	
	/**
	 * 修改投诉信息
	 * @param map
	 * @return
	 */
	public int update(Map<String, Object> map);
	
	/**
	 * 修改投诉信息的状态
	 * @param comp_id
	 * @param state
	 * @return
	 */
	public int updateState(Integer comp_id, String state);
	/**
	 * 删除投诉信息
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 查询全部投诉信息
	 * @return
	 */
	public List<Map<String, Object>> selectAll();
	
	/**
	 * 根据id查询单条投诉信息，以及投诉回复信息
	 * @param comp_id
	 * @return
	 */
	public List<Map<String, Object>> selectSingle(Integer comp_id);
	
	/**
	 * 根据条件查询部分投诉信息
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> selectByCondition(Map<String, Object> map);
	
	/**
	 * 根据部门加载该部门下的所有用户
	 * */
	public List<Map<String, Object>> loadPerson(String dept);
	
	/**
	 * 统计
	 * */
	public List<Map<String, Object>> calc();

}
