package com.model;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
@Entity
public class User {

	@Id
	@Email(message="Wrong email!") @NotEmpty
	private String email;
	
	@NotNull @Size(min=5, max=10, message="Your name should be between 5 - 10 characters.")
	private String first_name;
	
	@NotNull @Size(min=5,max=10, message="Please insert at least 5 characters")
	private String last_name;
	
	@NotNull @Length(min=5, max=10, message="Password should be between 5 - 10 charactes")
	private String password;
	
	
	private String role;//  during spring security //it will be assigned in controller
	
	@NotNull @Length(min=10, max=10, message="Mob no should be at of 10 digits") 
	private String phone;
	
	@NotNull
	private String address;
	
	private boolean enabled;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="user")
	private Set<Orders> order = new HashSet<Orders>(0);

	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Orders> getOrder() {
		return order;
	}

	public void setOrder(Set<Orders> order) {
		this.order = order;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}




	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}




}



