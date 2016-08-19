package com.nateiot.cis.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.cis.domain.CisEmYjsjcl;
import com.nateiot.cis.service.CisEmYjsjclService;
import com.nateiot.core.common.web.SearchUtil;

@Controller
@RequestMapping(value = "/yjsjcl")
public class CisBmYjsjclDaoController {
	@Autowired
	private CisEmYjsjclService cisEmYjsjclService;
	
	/**
	 * 加载视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list() {
		return "cis/bm/hospital/hospital";
	}
	
	/**
	 * 加载视图2
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list2")
	public String list2() {
		return "cis/bm/hospital/hospital-data";
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
		 		params.put("", "");
			return cisEmYjsjclService.doSearch(
					SearchUtil.getSpecification(CisEmYjsjcl.class, req),
					SearchUtil.getPageableWithOrderBy(req, ""));
	}
	
	/**
	 * 保存
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(CisEmYjsjcl cisBmYjsjcl) {
		cisBmYjsjcl = testAdd();
		return cisEmYjsjclService.doSave(cisBmYjsjcl);
	}
	
	/**
	 * 详细
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/get/{yjsjclId}")
	@ResponseBody
	public Map<String, Object> get(
			@PathVariable(value = "yjsjclId") Integer yjsjclId){
		return cisEmYjsjclService.doSelect(yjsjclId);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{yjsjclId}")
	@ResponseBody
	public Map<String, Object> del(
			@PathVariable(value = "yjsjclId") Integer yjsjclId){
		return cisEmYjsjclService.doDelete(yjsjclId);
	}

	private CisEmYjsjcl testAdd(){
		CisEmYjsjcl model = new CisEmYjsjcl();
		model.setCreaterId(1);
		model.setCreateTime(new Date());
		model.setLastUpdaterId(1);
		model.setLastUpdateTime(new Date());
		
		model.setYingjiPlanId(1);
		model.setYingjiRenyuanId(1);
		model.setYingjiShijianId(1);
		model.setPaiqianYijian("借此机会捞取足够多的油水，勿负朕望！");
		model.setPaiqianRenId(1);
		model.setPaiqianTime(new Date());
		return model;
	}
}
