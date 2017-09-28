package com.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.UserDao;
import com.model.User;

@Controller
public class UserController {

@Autowired
	UserDao userDao;

	@RequestMapping("/")
	public String acc(){
		return "index";
	}
	@RequestMapping("/index")
	public String acco(){
		return "index";
	}
	

	@RequestMapping("/SignIn")
	public String login()
	{
		return "SignIn";
	}
	

	@RequestMapping(value="/RegisterPage",method=RequestMethod.GET)
	public ModelAndView ShowRegister()
	{
		ModelAndView mav= new ModelAndView();
		mav.addObject("user",new User());
		mav.setViewName("SignUp");
		return mav;
	}
	


	@RequestMapping(value="/saveregister",method=RequestMethod.POST)
	public ModelAndView SaveRegister(@ModelAttribute("user") User user)
	{
		ModelAndView mav = new ModelAndView();
		user.setRole("ROLE_USER");
		userDao.saveUser(user);
		mav.setViewName("redirect:/RegisterPage");
		return mav;

	}

}
