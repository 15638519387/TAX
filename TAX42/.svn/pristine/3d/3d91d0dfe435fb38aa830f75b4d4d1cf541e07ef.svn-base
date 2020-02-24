package com.soft.service;

import java.util.List;
import java.util.Map;

/**
 * 信息管理类
 * 
 * @author admin
 *
 */
public interface InformationService {
	/**
	 * 查询全部
	 * 
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map);

	/**
	 * 插入
	 * 
	 * @param map
	 * @return
	 */
	public boolean insert(Map<String, Object> map);

	/**
	 * 修改
	 * @param map
	 * @return
	 */
	public boolean update(Map<String, Object> map);

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
/**
 * 根据id查询单个信息
 * @param id
 * @return
 */
	public Map<String, Object> selectSingleById(Integer id);

	/**
	 * 修改信息状态（发布、停用）
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean updateState(Integer id, String state);

	/**
	 * 批量删除
	 * @param id
	 * @return
	 */
	public boolean deleteAll(String[] id);
}
