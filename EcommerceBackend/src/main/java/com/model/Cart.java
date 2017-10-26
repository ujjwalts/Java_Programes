package com.model;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


import org.springframework.stereotype.Component;

@Component
@Entity

public class Cart {
	@Id
	@GeneratedValue
	private int cartid;
	private int totalItems;
	private double finalAmount;
	private String cartProductName;
	private String cartProductDescription;
	private int proid;
	private double price;

	
	@JoinColumn(name="userMailId")
	@OneToOne(fetch=FetchType.LAZY)
	private User user;


	

	


	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public double getFinalAmount() {
		return finalAmount;
	}

	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}



	public String getCartProductName() {
		return cartProductName;
	}

	public void setCartProductName(String cartProductName) {
		this.cartProductName = cartProductName;
	}

	public String getCartProductDescription() {
		return cartProductDescription;
	}

	public void setCartProductDescription(String cartProductDescription) {
		this.cartProductDescription = cartProductDescription;
	}


	public int getProid() {
		return proid;
	}

	public void setProid(int proid) {
		this.proid = proid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
	
	

}
