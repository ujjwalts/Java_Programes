package com.model;



import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Entity

public class Product {
	@Id
	@GeneratedValue
	private int proid;
	private String proname;
	private String description;
	private String stock;
	private String price;
	
	@Transient
	private MultipartFile pImage;
	

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sid")
	private Supplier supplier;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="categoryid")
	private Category category;
	
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}

	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public MultipartFile getpImage() {
		return pImage;
	}
	public void setpImage(MultipartFile pImage) {
		this.pImage = pImage;
	}
	
}
