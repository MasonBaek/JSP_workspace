package com.itwillbs.bean;

public class Phone {
	private String model;
	private String digit;
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getDigit() {
		return digit;
	}
	public void setDigit(String digit) {
		this.digit = digit;
	}
	
	public Phone(String model, String digit) {
		super();
		this.model = model;
		this.digit = digit;
	}
	
}
