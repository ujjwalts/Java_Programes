package com.controller;

import java.security.Principal;
import java.util.List;
import java.lang.*;
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

import com.dao.CartDao;
import com.dao.CategoryDao;
import com.dao.OrdersDao;
import com.dao.ProductDao;
import com.dao.UserDao;
import com.model.Cart;
import com.model.Orders;
import com.model.Product;
import com.model.Supplier;
import com.model.User;

@Controller
public class CartController {
	
	@Autowired
	CartDao cartdao;
	@Autowired
	UserDao userdao;
	@Autowired
	ProductDao productdao;
	@Autowired
	Cart cart;
	@Autowired
	Orders orders;
	@Autowired
	OrdersDao ordersdao;
	@Autowired 
	CategoryDao categorydao;
	
	

	
	@RequestMapping(value="/AddCart/{proid}",method=RequestMethod.POST)
	public ModelAndView SaveRegisters(@PathVariable("proid") int proid,@RequestParam("stock") String quant,Principal principal)
	{
		ModelAndView mav = null;
		if(principal!=null){
		 mav = new ModelAndView("Cart");
		//User u = userdao.getUserByName(principal.getName());
		String name= (principal.getName());
		User u = userdao.getUserByName(name);
		Product p = productdao.getProductById(proid);

		// calculating total for cart items
        double price = p.getPrice();
        String productname=p.getProname();
        String description=p.getDescription();
        int id = p.getProid();
        System.out.println(id);
        int quantity=Integer.parseInt(quant);
        double totalprice=price*quantity;
       
        cart.setFinalAmount(totalprice);
        cart.setUser(u);
        cart.setProid(id);
        cart.setPrice(price);
        cart.setCartProductName(productname);
        cart.setCartProductDescription(description);
        

		Cart cartexists=cartdao.getCartItem(proid, name);
	
		if(cartexists==null &&quantity!=0)
		{
			cart.setTotalItems(quantity);     	
			cartdao.insertc(cart);
			mav = new ModelAndView("Cart");
			//System.out.println("no");
			
			
		}
		
		else if(cartexists != null && quantity!=0){
		
			cart.setCartid(cartexists.getCartid());
			cart.setTotalItems(cartexists.getTotalItems()+quantity);
			//System.out.println("yes");
			cartdao.updatec(cart);
			mav = new ModelAndView("Cart");
		}
		else if(quantity==0)
		{
			mav = new ModelAndView("index");
		}
        
		
		//updating product instance
		 long stock=p.getStock();
		 long fin=stock-quantity;
		 p.setStock(fin);

		 productdao.updateProduct(p);
	 mav.addObject("cartinfo",cartdao.GetCartList(name));
	
	 }
	 else
	 {
		 mav=new ModelAndView("redirect:/login");
		 
	 }
	return mav;
		
		
	}
	
	
	@RequestMapping(value="/deleteCart/{cartid}",method=RequestMethod.GET)
	public ModelAndView removeCart(@PathVariable int cartid,Principal principal)
	{ 	 ModelAndView mav=new ModelAndView("Cart");
		
		String name=principal.getName();

		cartdao.deletec(cartid);
		mav.addObject("cartinfo",cartdao.GetCartList(name));

		 return mav; 
	}
		
		

	@RequestMapping(value="/CheckOut",method=RequestMethod.GET)
	public ModelAndView checkout(Principal principal)
	{
		ModelAndView mav=new ModelAndView("CheckOut");
		String name = principal.getName();
		User u = userdao.getUserByName(name);
		List <Cart> cl = cartdao.GetCartList(name);
		mav.addObject("us",u);
		mav.addObject("cartdetails",cl);
		return mav;
		
	}
	
	@RequestMapping(value="/invoice",method=RequestMethod.POST)
	public ModelAndView invoice(Principal principal,@RequestParam("paymentType")String paymentType,@RequestParam("total")String total)
	{
		ModelAndView mav=new ModelAndView("Invoice");
		String name = principal.getName();
		List <Cart> cl = cartdao.GetCartList(name);
		User u = userdao.getUserByName(name);
		orders.setUser(u);;
		double totalamount = Double.parseDouble(total);
		orders.setTotalamt(totalamount);;
		orders.setPaymenttype(paymentType);
		mav.addObject("us",u);
		mav.addObject("cart",cl);
	
		mav.addObject("tbl",orders);
		ordersdao.insertOrder(orders);		
		for (Cart ci : cl){
			cartdao.deletec(ci.getCartid());
		}
		
		return mav;
	}
	
	@RequestMapping(value="/Thankyou")
	public ModelAndView End()
	{
		ModelAndView mav=new ModelAndView("ThankYou");
         return mav;
		
	}
	
      
     @RequestMapping(value="/cart")
     public ModelAndView opencart(Principal principal){
    	 ModelAndView mav;
    	 
    	 if (principal !=null){
    		 String name = principal.getName();
    		 mav = new ModelAndView("Cart");
 			List<Cart> cart = cartdao.GetCartList(name);
 			mav.addObject("cartinfo", cart);
 		} else {
 			mav = new ModelAndView("login");
 		}

 		return mav;
 	}
     
     

     
     
     
     
 	@ModelAttribute
 	public void categoryList(Model m) 
 	{
 	
 		m.addAttribute("catlist",categorydao.categoryList());
 		m.addAttribute("productlist",productdao.getProductList());
 		
 	}
     
}


	
	

