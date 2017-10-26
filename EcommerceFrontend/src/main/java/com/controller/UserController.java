
package com.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.dao.UserDao;
import com.model.Category;
import com.model.User;

@Controller
public class UserController {

	@Autowired
	ProductDao productdao;
	@Autowired
	CategoryDao categorydao;
	@Autowired
	SupplierDao supplierdao;
	@Autowired
	UserDao userDao;

	
	

	@RequestMapping("/")
	public String acc(){
		return "index";
	}
	/*
	@RequestMapping("/")
	public ModelAndView accnew()
	{
		ModelAndView mav= new ModelAndView();
		mav.addObject("catlist",categorydao.categoryList());		
		mav.setViewName("index");
		return mav;
	}*/
	/*@RequestMapping("/index")
	public String acco(){
		return "index";
	}
	*/

	@RequestMapping("/login")
	public String login()
	{
		return "login";
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
	
	@RequestMapping(value="/custproduct")
	public ModelAndView custProduct(@RequestParam("cid") int cid)
	{
		System.out.println(cid);
		ModelAndView mav=new ModelAndView();
		
		/*List<Product> l=productDao.custprolist(cid);
		for(Product l1:l)
		{
			System.out.println(l1.getProductName());
		}*/
		 mav.addObject("prolist",productdao.custprolist(cid));   
		mav.setViewName("CustProducts");
		return mav;  
	}
	
//	@RequestMapping(value="/custproduct")
//	public ModelAndView custProduct(@RequestParam("cid")int cid)
//	{
//		System.out.println(cid);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("prolist",productdao.custprolist(cid));
//		mav.setViewName("CustProducts");
//		return mav;
//	}
	
	@ModelAttribute
	public void categoryList(Model m) //The @ModelAttribute is an annotation that binds a method parameter or method return value to a named model attribute and then exposes it to a web view.
	{
		
		/*List <Category>l=categorydao.categoryList();
		for(Category l1:l)
		{
			System.out.println(l1.getCategoryname());
		}*/
		m.addAttribute("catlist",categorydao.categoryList());
		m.addAttribute("productlist",productdao.getProductList());
		
	}
	
	
	
	@RequestMapping(value="/productDescription/{proid}")
	public ModelAndView productDescLists(@PathVariable int proid)
	{
		
		ModelAndView mav=new ModelAndView();
		
		 mav.addObject("prodlist",productdao.getProById(proid));   
		mav.setViewName("ProductDetails");
		return mav;  
	}
	

}
