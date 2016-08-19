package com.nateiot.cis.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.base.domain.GxwlSysDoc;
import com.nateiot.base.repository.GxwlSysDocDao;
import com.nateiot.base.service.GxwlSysDocService;
import com.nateiot.cis.domain.CisPaPartyRegime;
import com.nateiot.cis.service.CisPaPartyRegimeService;
import com.nateiot.core.common.web.SearchUtil;

/**
 * 党务建设 -- 党务公开制度
 * 
 * @author Guohw
 *
 */
@Controller
@RequestMapping(value = "/partyRegime")
public class CisPaPartyRegimeController {
	
	@Autowired
	private CisPaPartyRegimeService cisPaPartyRegimeService;
	
	@Autowired
	private GxwlSysDocDao gxwlSysDocDao;
	
	@Autowired
	private GxwlSysDocService gxwlSysDocService;
	
	/**
	 * 加载视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list/{pageType}")
	public String list(@PathVariable(value = "pageType") String pageType , Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		if(pageType.equals("puSystem")){
			params.put("pageType", pageType);
		}else if(pageType.equals("Wobranch")){
			params.put("pageType", pageType);
		}else if(pageType.equals("joinParty")){
			params.put("pageType", pageType);
		}else if(pageType.equals("course")){
			params.put("pageType", pageType);
		}
		
		return "cis/pa/partyRegime/partyRegime";
	}
	
	/**
	 * 查询
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/search/{pageType}")
	@ResponseBody
	public Map<String, Object> search(
			@PathVariable(value="pageType")String pageType, HttpServletRequest req) {
		 	Map<String ,Object> params = new HashMap<String, Object>();
		 		params.put("delSign_EQ", "N");
		 		params.put("regimeType_EQ", pageType);
			return cisPaPartyRegimeService.doSearch(
					SearchUtil.getSpecification(CisPaPartyRegime.class, req, params),
					SearchUtil.getPageableWithOrderBy(req, "regimeId_desc"));
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
			return cisPaPartyRegimeService.doSearch(
					SearchUtil.getSpecification(CisPaPartyRegime.class, req, params),
					SearchUtil.getPageableWithOrderBy(req, "regimeId_desc"));
	}
	
	/**
	 * 保存
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(CisPaPartyRegime cisPaPartyRegime) {
		if(cisPaPartyRegime!=null){
			cisPaPartyRegime.setDelSign("N");
			if(cisPaPartyRegime.getDocId() != null){
				GxwlSysDoc bean = gxwlSysDocDao.findOne(cisPaPartyRegime.getDocId());
				bean.setIsTemp("N");
			}
		}
		return cisPaPartyRegimeService.doSave(cisPaPartyRegime);
	}
	
	/**
	 * 详细
	 * 
	 * @param knowledgeId
	 * @return
	 */
	@RequestMapping(value = "/get/{regimeId}")
	@ResponseBody
	public Map<String, Object> getRegimeId(
			@PathVariable(value = "regimeId") Integer regimeId){
		return cisPaPartyRegimeService.doSelect(regimeId);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param knowledgeId
	 * @return
	 */
	@RequestMapping(value = "/del/{regimeId}")
	@ResponseBody
	public Map<String, Object> del(
			@PathVariable(value = "regimeId") Integer regimeId){
		return cisPaPartyRegimeService.doDelete(regimeId);
	}
	
	/**
	 * 软删除记录列表
	 * 
	 * @param knowledgeIds
	 * @return
	 */
	@RequestMapping(value = "/softDelList")
	@ResponseBody
	public Map<String, Object> softDelList(
			@RequestParam(value = "regimeIds") String regimeIds){
		List<Integer> list = null;
		if(StringUtils.isNotBlank(regimeIds)){
			list = new ArrayList<Integer>();
			String[] arr = regimeIds.split(",");
			for(String id : arr){
				if(id!=null){
					list.add(Integer.parseInt(id));
				}
			}
		}
		return cisPaPartyRegimeService.softDelList(list);
	}
	
	@RequestMapping(value = "/send")
	@ResponseBody
	public Map<String, Object> send(String emailAddress, Integer regimeId) {
		return cisPaPartyRegimeService.sendmail(emailAddress, regimeId);
	}

	/**
	 * 手机端接口：发送邮件
	 * 
	 * @param knowledgeId
	 * @param enterpriseIds
	 * @return
	 */
	@RequestMapping(value = "/sendmail")
	@ResponseBody
	public Map<String, Object> sendmail(
			@RequestParam(value = "regimeId", required = true) Integer regimeId,
			@RequestParam(value = "emailAddress", required = true) String emailAddress) {
		return cisPaPartyRegimeService.sendmail2(emailAddress, regimeId);
	}
	
	/**
	 *  党务建设 -- 工作台
	 *  
	 *  @param
	 *  @return
	 */
	@RequestMapping(value = "/getData")
	@ResponseBody
	public Map<String, Object> getData(){
		return cisPaPartyRegimeService.getData();
	}
	
	
}
