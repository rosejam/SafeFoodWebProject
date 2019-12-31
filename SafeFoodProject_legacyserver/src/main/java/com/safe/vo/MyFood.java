package com.safe.vo;

public class MyFood {
	/**일회 제공되는 탄수화물*/
	protected double carbo;
	/**일회 제공되는 단백질*/
	protected double protein;
	/**일회 제공되는 지방*/
	protected double fat;
	/**일회 제공되는 당류*/
	protected double sugar;
	/**일회 제공되는 나트륨*/
	protected double natrium;
	/**일회 제공되는 콜레스테롤*/
	protected double chole;
	/**일회 제공되는 포화지방산*/
	protected double fattyacid;
	/**일회 제공되는 트렌스지방*/
	protected double transfat;
	
	
	
	public MyFood() {
	}

	public MyFood(double carbo, double protein, double fat, double sugar, double natrium,
			double chole, double fattyacid, double transfat) {
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getSugar() {
		return sugar;
	}

	public void setSugar(double sugar) {
		this.sugar = sugar;
	}

	public double getNatrium() {
		return natrium;
	}

	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}

	public double getChole() {
		return chole;
	}

	public void setChole(double chole) {
		this.chole = chole;
	}

	public double getFattyacid() {
		return fattyacid;
	}

	public void setFattyacid(double fattyacid) {
		this.fattyacid = fattyacid;
	}

	public double getTransfat() {
		return transfat;
	}

	public void setTransfat(double transfat) {
		this.transfat = transfat;
	}

	@Override
	public String toString() {
		return "MyFood [carbo=" + carbo + ", protein=" + protein + ", fat=" + fat
				+ ", sugar=" + sugar + ", natrium=" + natrium + ", chole=" + chole + ", fattyacid=" + fattyacid
				+ ", transfat=" + transfat + "]";
	}
	
}
