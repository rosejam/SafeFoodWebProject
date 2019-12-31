package com.safe.service;

import java.util.ArrayList;
import java.util.List;

import com.safe.vo.Food;
import com.safe.vo.FoodPageBean;
import com.safe.vo.Pagination;

public interface SafeFoodService {
	
	public int foodCount(FoodPageBean bean);
	public ArrayList<Food> searchAll(FoodPageBean  bean);
	public Food search(int code);
	public ArrayList<Food> searchBest();
	public ArrayList<Food> searchBestIndex();
	public void countUp(int code);
	public ArrayList<Food> sortkw(FoodPageBean bean);
	public ArrayList<Food> searchByCal(double cal);
	public void searchcnt(ArrayList<Food> list);
	public double getfoodcal(int code);
	public int getBoardListCnt() throws Exception;
	public List<Food> searchAll(Pagination pagination) throws Exception;

}
