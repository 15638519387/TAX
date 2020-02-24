package com.soft.service;

import java.util.List;
import java.util.Map;

import com.soft.entity.Sub_service;

/**
 * 预约服务表Service层接口
 * @author admin
 *
 */
public interface Subscribe_serviceService {
	/**
	 * 按开始时间模糊查询
	 * @return
	 */
	public List<Sub_service> queryShi(Map<String, Object> map);

		/**
		 * 按编号模糊查询
		 * @return
		 */
		public List<Map<String, Object>> queryLike(Map<String, Object> map);
		/**
		 * 添加
		 * 
		 * @return
		 */
		public int add();

		/**
		 * 删除
		 * 
		 * @return
		 */
		public int delete();

		/**
		 * 更新
		 * 
		 * @return
		 */
		public int update();
}
