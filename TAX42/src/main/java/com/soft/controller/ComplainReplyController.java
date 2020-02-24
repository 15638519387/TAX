package com.soft.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soft.service.ComplainReplyService;
import com.soft.service.ComplainService;

/**
 * 投诉回复控制类
 * @author admin
 *
 */
@Controller
@RequestMapping("/complainReply")
public class ComplainReplyController {
	@Autowired
	ComplainService complainService;
	@Autowired
	ComplainReplyService complainReplyService;
	
	/**
	 * 插入投诉回复信息
	 * @param map
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map) {
		//获取当前时间
		Date date=new Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String newDate = sdf.format(date);
		map.put("reply_time", newDate);
		//回复是否成功
		boolean b = complainReplyService.insert(map);
		if (b) {
			//如果回复成功，那么再把该条投诉信息的状态改为已受理
			boolean updateState = complainService.updateState(Integer.valueOf(map.get("comp_id").toString()), "1");
			if (updateState) {				
				return "redirect:/complain/selectAll";
			}else {
				return null;
			}
		}else {
			return null;
		}
	}
}
