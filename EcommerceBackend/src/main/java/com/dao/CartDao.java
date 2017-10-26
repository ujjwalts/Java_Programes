
package com.dao;

import java.util.List;

import com.model.Cart;

public interface CartDao {
	public void insertc(Cart c);
	public void updatec(Cart c);
	public void deletec(int cartid);
	public Cart GetCartById(String cartId);
	public List <Cart> GetCartList(String usermail);
	public Cart getCartItem(int pid,String userid);

}
