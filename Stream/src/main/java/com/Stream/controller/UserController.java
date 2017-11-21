package com.Stream.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Stream.constants.CommonConstants;
import com.Stream.dao.UserDao;
import com.Stream.entity.User;
import com.Stream.service.IcommonService;
import com.Stream.utils.CallBack;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Resource(name="userServiceImp")
	private IcommonService uService;

	
	public IcommonService getuService() {
		return uService;
	}
	public void setuService(IcommonService uService) {
		this.uService = uService;
	}
	@RequestMapping(value="/login")
	public ModelAndView login(final User user,@RequestParam(value = "remember", defaultValue = "false", required = false) final boolean remember){
		final String referer=getReferer();	
		System.out.println(referer);
		return exetuce(new CallBack() {
			
			@Override
			public void process(Map<String, Object> result) {
				User u=uService.selectByName(user);
				if(u!=null&&u.getPassword().equals(user.getPassword())&&u.getStat().equals(CommonConstants.STAT_OK)){
					result.put("user", u);
				}
			}
		}, "jsp/personal");
	}
	
	@RequestMapping(value="/login1")
	public ModelAndView login1(final User user,HttpSession session){
		User u=uService.selectByName(user);
		if(u!=null&&u.getPassword().equals(user.getPassword())&&u.getStat().equals(CommonConstants.STAT_OK)){
		  session.setAttribute("user", u);
		}
		return new ModelAndView("jsp/index1");
	}
	
	
	
	@RequestMapping(value="/personal")
	public ModelAndView personal(final User user){
		
		return exetuce(new CallBack() {
			@Override
			public void process(Map<String, Object> result) {
				User u=uService.selectById(user);
				result.put("user", u);
			}
		}, "jsp/personal");
	}
	
	
	@RequestMapping(value="/update1")
	public ModelAndView update1(final User user){
		
		return exetuce(new CallBack() {
			@Override
			public void process(Map<String, Object> result) {
				User u=uService.selectById(user);
				result.put("user", u);
			}
		}, "jsp/updateUserInfo");
	}
	
	@RequestMapping(value="/update2")
	public ModelAndView update2(final User user){
		
		return exetuce(new CallBack() {
			@Override
			public void process(Map<String, Object> result) {
				uService.update(user);
				User u=uService.selectById(user);
				result.put("user", u);
			}
		}, "jsp/personal");
	}
	
	

	@RequestMapping(value = "/log")
	public ModelAndView log(ModelAndView mv, User user) {
		// TODO 获取用户登录名 密码 组装一个user
		// TODO 调用us的登录方法判断用户情况，根据用户情况跳转不同页面
		if (uService.log(user)==0) {
			mv.setViewName("checkemail");
			mv.addObject("msg", "请在邮箱激活");
		}
		if (uService.log(user)==1) {
			mv.setViewName("log");
		}
		if (uService.log(user)==3) {
			mv.setViewName("error/ErrorCode400");
			mv.addObject("msg", "密码错误");
		}
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/reg")
	public ModelAndView reg(ModelAndView mv, User user) {
		if (uService.reg(user)) {
			mv.setViewName("log");
		} else {
			mv.addObject("msg", "注册失败");
			mv.setViewName("error/ErrorCode400");
		}
		return mv;
	}

	@RequestMapping(value = "regconf")
	public ModelAndView regconf(final User user) {
		return exetuce(new CallBack() {
			
			@Override
			public void process(Map<String, Object> result) {
				uService.regconf(user);
			}
		}, "jsp/login");
		/*String code = request.getParameter("code");
		uService.regconf(code);
		mv.setViewName("log");
		return mv;*/
	}
}
