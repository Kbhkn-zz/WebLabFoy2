package com.kbhkn.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Created by kbhkn on 22.10.2016 18:37.
 */
@Entity
@Table(name = "tbl_product")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productId")
	private int productId;

	@Column(name = "productName", nullable = false, unique = true)
	private String productName;

	@Column(name = "productInfo", nullable = false)
	private String productInfo;

	@Column(name = "productPrice", nullable = false)
	private double productPrice;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy = "product", cascade = CascadeType.ALL)
	private List<Order> orders;

	public Product() {
	}
	
	public Product(int productId) {
		super();
		this.productId = productId;
	}

	public Product(String productName, String productInfo, double productPrice) {
		super();
		this.productName = productName;
		this.productInfo = productInfo;
		this.productPrice = productPrice;
	}
	
	public Product(int productId, String productName, String productInfo, double productPrice) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productInfo = productInfo;
		this.productPrice = productPrice;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return String.format("Product [productId=%s, productName=%s, productInfo=%s, productPrice=%s]", productId, productName, productInfo, productPrice);
	}

}
