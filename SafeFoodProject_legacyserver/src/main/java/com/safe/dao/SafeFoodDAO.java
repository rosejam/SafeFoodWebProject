package com.safe.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Food;
import com.safe.vo.FoodPageBean;
import com.safe.vo.Pagination;

class MyComp implements Comparator<Food> {
	@Override
	public int compare(Food o1, Food o2) {
		if (o1.getCalory() > o2.getCalory()) return 1;
		else if(o1.getCalory() < o2.getCalory()) return -1;
		return 0;
	}
}

@Repository
public class SafeFoodDAO implements ISafeFood{
	@Autowired
	SqlSession session;
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. web에서 구현할 내용. web에서 페이징 처리시
	 * 필요
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 개수
	 */
	public int foodCount(FoodPageBean bean) {
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<Food> finds = new ArrayList<Food>();
		ArrayList<Food> finds_tot = new ArrayList<Food>();
		map.put( "key", bean.getKey());
		for(String tmp:bean.getWords()) {
			map.put( "word", tmp);
			finds= (ArrayList)session.selectList("Food.selectAll_keyword",map);
			for(Food f: finds) finds_tot.add(f);
		}
		return finds_tot.size();
	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를 검색해서 반환.
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public ArrayList<Food> searchAll(FoodPageBean bean) { //검색!!
		ArrayList<Food> finds = new ArrayList<Food>();
		if (bean != null) {
			String key = bean.getKey();
			//System.out.println(key);
			//String word = bean.getWord();
			String[] words = bean.getWords();
			if (!key.equals("all") && words != null ) {//&& word != null && !word.trim().equals("")) { ///name, maker, material
				//boolean flag = true;
				for(String word : words) {
					if(!word.trim().equals("")) {
						Map<String, String> map = new HashMap<String, String>();
						map.put( "key", key );
						map.put( "word", word );
						finds.addAll((ArrayList)session.selectList("Food.selectAll_keyword",map));
						//System.out.println(finds);
					}
				}
			}
			else {
				finds= (ArrayList)session.selectList("Food.selectAll");
			}
		}
		return finds;
	}
/*	public ArrayList<Food> searchID(String id) { //검색!!
		ArrayListFood finds = new ArrayList<Food>();
		if (bean != null) {
			String key = bean.getKey();
			System.out.println(key);
			//String word = bean.getWord();
			String[] words = bean.getWords();
			if (!key.equals("all") && words != null ) {//&& word != null && !word.trim().equals("")) { ///name, maker, material
				//boolean flag = true;
				for(String word : words) {
					if(!word.trim().equals("")) {
						Map<String, String> map = new HashMap<String, String>();
						map.put( "key", key );
						map.put( "word", word );
						finds= session.selectOne("Food.selectAll_keyword",map);
						System.out.println(finds);
					}
				}
			}
			else {
				finds= (ArrayList)session.selectList("Food.selectAll");
			}
		}
		return finds;
	}*/
	
	public ArrayList<Food> searchByCal(double cal){
		ArrayList<Food> finds = (ArrayList)session.selectList("Food.selectAll");
		for(int i=finds.size()-1;i>=0;i--) {
			if(finds.get(i).getCalory()>cal) {
				finds.remove(i);
			}
		}
		MyComp mc=new MyComp();
		Collections.sort(finds, mc);
		return finds;
	}
	
	//검색어소팅용 //검색수가 같다면 조회수 높은 순 정렬됨
	public ArrayList<Food> sortkw(FoodPageBean bean) {
		ArrayList<Food> finds = (ArrayList)session.selectList("Food.selectAll");
		//MyComp2 mc2=new MyComp2();
		//Collections.sort(finds, mc2);
		
		//셀렉션소트의 구현!!
		for(int i=0; i<finds.size()-1; i++) { //제일 마지막은 제외해도 되므로
			int max = i;
			for(int j=i+1; j<finds.size(); j++) { //나머지 전체에서 min값을 찾는것을 반복~
				if(finds.get(j).getSearch_count() > finds.get(max).getSearch_count() ) max = j;
			}
			//int T=a[i]; a[i]=a[min]; a[min]=T;
			Food T=finds.get(i); finds.set(i, finds.get(max)); finds.set(max, T);
			//System.out.println(Arrays.toString(a)); //스왑될때마다 찍음
		}
		return finds;
	}
	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환.
	 * 
	 * @param code 검색할 식품 코드
	 * @return 식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code) { //1가지 식품을 //코드로 검색//상세검색시 영양소 함량을 그래프로 표시 
		Food f = (Food)session.selectOne("Food.selectOne",code);
		//System.out.println("Food "+f);
		return f;
	}

	/**
	 * 가장 많이 검색한 Food 정보 리턴하기 web에서 구현할 내용.
	 * 
	 * @return
	 */
	public ArrayList<Food> searchBest() { //조회수 기능
		return null;
	}

	public ArrayList<Food> searchBestIndex() {
		return null;
	}
	
	public void countUp(int code) { //read한 경우 selectOne전에 조회수 올리기용!!!
		session.update("Food.countUp",code);
	}
	public void searchcnt(ArrayList<Food> list) {
		for(Food f: list) {
			session.update("Food.searchcnt",f.getCode());
		}
	}

	@Override
	public double getfoodcal(int code) {
		Food f = (Food)session.selectOne("Food.selectOne",code);
		return f.getCalory();
	}
	
	public static void main(String[] args) {
		SafeFoodDAO dao = new SafeFoodDAO();
		System.out.println(dao.search(1));
		System.out.println("===========================material로 검색=================================");
		print(dao.searchAll(new FoodPageBean("material", new String[] {"감자전분"}, null, 0)));
		System.out.println("===========================maker로 검색=================================");
		print(dao.searchAll(new FoodPageBean("maker", new String[] {"빙그레"}, null, 0)));
		System.out.println("===========================name으로 검색=================================");
		print(dao.searchAll(new FoodPageBean("name", new String[] {"라면"}, null, 0)));
		System.out.println("============================================================");
		//print(dao.searchAll(null));
		System.out.println("============================================================");
		ArrayList<Food> finds = dao.sortkw((new FoodPageBean("all", null, null, 0)));
		for(int i=0;i<finds.size();i++)
			System.out.print(finds.get(i).getSearch_count());
	}

	public static void print(ArrayList<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return  session.selectOne("Food.getListCnt");

	}

	@Override
	public List<Food> searchAll(Pagination pagination) {
		System.out.println("hihi : " + pagination.getStartList() + " " + pagination.getListSize());
		System.out.println("hello : " + session.selectList("Food.selectAll_page", pagination).get(0).toString());
		return session.selectList("Food.selectAll_page", pagination);

	}



}
