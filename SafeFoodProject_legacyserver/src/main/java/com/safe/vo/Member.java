package com.safe.vo;

import java.util.Arrays;

public class Member {
	private String id;
	private String pass;
	private String alergy;
	private String myfood;
	private double mycal;
	private int weight;
	
	public Member() {
	}

	public Member(String id, String pass, String alergy, String myfood, double mycal, int weight) {
		this.id = id;
		this.pass = pass;
		this.alergy = alergy;
		this.myfood = myfood;
		this.mycal = mycal;
		this.weight = weight;
	}
	/*
	 * public Member(String id, String pass, String alergy, String myfood) { this.id
	 * = id; this.pass = pass; this.alergy = alergy; this.myfood = myfood;
	 * this.weight = 60; }
	 */
	
	public Member(String id, String pass, String alergy, int weight) {
		this.id = id;
		this.pass = pass;
		this.alergy = alergy;
		this.myfood = null;
		this.mycal = 0;
		this.weight = weight;
	}
	/*
	 * public Member(String id, String pass, String alergy) { this.id = id;
	 * this.pass = pass; this.alergy = alergy; this.myfood = null; this.weight = 60;
	 * }
	 */
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getAlergy() {
		return alergy;
	}
	public void setAlergy(String alergy) {
		this.alergy = alergy;
	}

	public String getMyfood() {
		return myfood;
	}

	public void setMyfood(String myfood) {
		this.myfood = myfood;
	}
	
	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
		
	public double getMycal() {
		return mycal;
	}

	public void setMycal(double mycal) {
		this.mycal = mycal;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", alergy=" + alergy + ", myfood=" + myfood + ", mycal=" + mycal
				+ ", weight=" + weight + "]";
	}

}
