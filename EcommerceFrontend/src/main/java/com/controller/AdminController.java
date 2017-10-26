package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	Product p;
	@Autowired
	ProductDao productdao;
	@Autowired
	CategoryDao categorydao;
	@Autowired
	SupplierDao supplierdao;
	
	@RequestMapping(value="/addPro",method=RequestMethod.GET)
	public ModelAndView ShowRegister(HttpServletRequest request)
	
	{
		ModelAndView mav= new ModelAndView();
		mav.addObject("product",new Product());
		
		List<Category> cl=categorydao.categoryList();//(drop down list)
		mav.addObject("catlist",cl);//(drop down list)
		
		List<Supplier> sl=supplierdao.supplierList();
		mav.addObject("suplist",sl);
		
	
		mav.setViewName("AdminPage");//the page we need to open
		return mav;
	}
	

	@RequestMapping(value="/SaveProduct",method=RequestMethod.POST)
	public ModelAndView SaveRegiste(@ModelAttribute("product") Product p,@RequestParam("file") MultipartFile file,HttpServletRequest request)
	{
		
		
		p.setCategory(categorydao.getCategoryById(Integer.parseInt(request.getParameter("categoryId"))));//(drop down list)
		p.setSupplier(supplierdao.getSupplierById(Integer.parseInt(request.getParameter("supplierId"))));
		

		String filepath=request.getSession().getServletContext().getRealPath("/");
		String originalfile=file.getOriginalFilename();
		
	
	
		productdao.saveProduct(p);
		
		System.out.println(filepath+originalfile);//optional
		try
		{
			byte imagebyte[] = file.getBytes();
			BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/Images/"+p.getProid()+".jpg"));
			System.out.println("FilePath"+filepath);
			fos.write(imagebyte);
			fos.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("redirect:/admin/addPro");
		return mav;

	}
	
	@RequestMapping(value="/viewPro",method=RequestMethod.GET)
	public ModelAndView viewProduct(){
		List<Product> list  = productdao.getProductList();
		return new ModelAndView("ViewProduct","list",list);
	}
	
	

	
	
	@RequestMapping(value="/SaveCategory",method=RequestMethod.POST)
	public ModelAndView SaveRegister(@ModelAttribute("category") Category c)
	{
		ModelAndView mav = new ModelAndView();
		
		categorydao.SaveCategory(c);
		mav.setViewName("redirect:/admin/addPro");
		return mav;

	}
	
	@RequestMapping(value="/categorylist",method=RequestMethod.GET)
	public ModelAndView categoryList()
	{	
		List<Category> l=categorydao.categoryList();
		
		return new ModelAndView("CategoryList","catlist",l);
		
		
	}
	

	
	@RequestMapping(value="/SaveSupplier",method=RequestMethod.POST)
	public ModelAndView SaveRegisters(@ModelAttribute("supplier") Supplier s)
	{
		ModelAndView mav = new ModelAndView();
		
		supplierdao.SaveSupplier(s);
		mav.setViewName("AdminPage");
		return mav;

	}

	@RequestMapping(value="/supplierlist",method=RequestMethod.GET)
	public ModelAndView supplierList()
	{	
		List<Supplier> l=supplierdao.supplierList();		
		return new ModelAndView("SupplierList","suplist",l);		
	}
	
	
	
	
	
	
	@RequestMapping(value="/delete/{proid}",method=RequestMethod.GET)
	public ModelAndView deleteProd(@PathVariable int proid)
	{
		ModelAndView mav=new ModelAndView();
		productdao.deleteProduct(proid);
		mav.setViewName("redirect:/admin/viewPro");  
		return mav;
	}
	
	
	
	@RequestMapping(value="/editpro/{proid}")
	public ModelAndView update(@PathVariable int proid){
		Product p=productdao.getProductById(proid);
		ModelAndView mav=new ModelAndView("EditProduct","cmdd",p);
		List<Category> cl=categorydao.categoryList();//(drop down list)
		mav.addObject("catlist",cl);//(drop down list)
		
		List<Supplier> sl=supplierdao.supplierList();
		mav.addObject("suplist",sl);
		
		
		return mav;
	}
	
	

	@RequestMapping(value="/Save",method=RequestMethod.POST)
	public ModelAndView updateSave(@ModelAttribute ("cmdd")Product p,@RequestParam("file") MultipartFile file,HttpServletRequest request){
	

		p.setCategory(categorydao.getCategoryById(Integer.parseInt(request.getParameter("categoryId"))));//(drop down list)
		p.setSupplier(supplierdao.getSupplierById(Integer.parseInt(request.getParameter("supplierId"))));
		

		String filepath=request.getSession().getServletContext().getRealPath("/");
		String originalfile=file.getOriginalFilename();
		
		productdao.updateProduct(p);
		
		System.out.println(filepath+originalfile);//optional
		try
		{
			byte imagebyte[] = file.getBytes();
			BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/Images/"+p.getProid()+".jpg"));
			System.out.println("FilePath"+filepath);
			fos.write(imagebyte);
			fos.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/admin/viewPro");
	}
	
	
	@ModelAttribute
	public void categoryList(Model m) 
	{
	
		m.addAttribute("catlist",categorydao.categoryList());
		m.addAttribute("productlist",productdao.getProductList());
		
	}
	
	
	
	
	

}
