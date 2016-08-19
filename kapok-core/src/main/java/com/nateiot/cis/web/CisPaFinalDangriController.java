package com.nateiot.cis.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.cis.domain.CisPaFinalDangri;
import com.nateiot.cis.service.CisPaFinalDangriService;
import com.nateiot.core.common.web.SearchUtil;

@Controller
@RequestMapping("/finaldangri")
public class CisPaFinalDangriController {
	@Autowired
	private CisPaFinalDangriService cisPaFinalDangriService;
	
	/**
	 * 加载视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list() {
		return "cis/pa/finaldangri/finaldangri-list";
	}
	
	/**
	 * 查询
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/search")
	@ResponseBody
	public Map<String, Object> search(HttpServletRequest req) {
		 	Map<String ,Object> params = new HashMap<String, Object>();
		 	params.put("delSign_EQ", "N");
			return cisPaFinalDangriService.doSearch(
					SearchUtil.getSpecification(CisPaFinalDangri.class, req, params),
					SearchUtil.getPageableWithOrderBy(req, "createTime_desc"));
	}
	
	/**
	 * 保存
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Map<String, Object> save(CisPaFinalDangri cisPaFinalDangri) {
		return cisPaFinalDangriService.doSave(cisPaFinalDangri); 
	}
	
	/**
	 * 详细
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/get/{finalDangriId}")
	@ResponseBody
	public Map<String, Object> get(
			@PathVariable(value = "finalDangriId") Integer finalDangriId){
		return cisPaFinalDangriService.doSelect(finalDangriId);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{finalDangriId}")
	@ResponseBody
	public Map<String, Object> del(
			@PathVariable(value = "finalDangriId") Integer finalDangriId){
		return cisPaFinalDangriService.doDelete(finalDangriId);
	}
	
	/**
	 * 软删除记录列表
	 * 
	 * @param cultivateIds
	 * @return
	 */
	@RequestMapping(value = "/softDelList")
	@ResponseBody
	public Map<String, Object> softDelList(
			@RequestParam(value = "ids") String ids){
		List<Integer> list = null;
		if(StringUtils.isNotBlank(ids)){
			list = new ArrayList<Integer>();
			String[] arr = ids.split(",");
			for(String id : arr){
				if(id!=null){
					list.add(Integer.parseInt(id));
				}
			}
		}
		return cisPaFinalDangriService.softDelList(list);
	}
}
