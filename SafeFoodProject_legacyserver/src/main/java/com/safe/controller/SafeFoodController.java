package com.safe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.safe.service.MemberService;
import com.safe.service.SafeFoodService;
import com.safe.vo.Food;
import com.safe.vo.FoodPageBean;
import com.safe.vo.Member;
import com.safe.vo.MyFood;
import com.safe.vo.Pagination;

@Controller
public class SafeFoodController {
	private static final String String = null;

	/*
	 * @ExceptionHandler public ModelAndView handler(Exception e) { ModelAndView mav
	 * = new ModelAndView("ErrorHandler"); mav.addObject("msg", e.getMessage());
	 * return mav; }
	 */

	@Autowired
	SafeFoodService service;

	@Autowired
	MemberService service2;

	//@GetMapping("/list.food")
	@RequestMapping(value = { "/list.food", "/" }, method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest req, HttpSession session , @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = service.getBoardListCnt();
		System.out.println("controller list.food");
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("foodList", service.searchAll(pagination));
		
		session.setAttribute("cpage", req.getRequestURI());
		session.setAttribute("almsg" , "");
		ArrayList<Food> list = service.searchAll((new FoodPageBean("all", null, null, 0)));
		model.addAttribute("list", list);// jsp에서 접근해서 사용하도록 저장
		
		ArrayList<Food> list2 = service.sortkw((new FoodPageBean("all", null, null, 0)));
		ArrayList<Food> top4 = new ArrayList<>();
		
		  for(int i=0; i<4; i++) {
			  top4.add(list2.get(i));
		  }
		 
		model.addAttribute("sortlist", top4);// jsp에서 접근해서 사용하도록 저장

		return "index";
	}

//수정해야함
	@GetMapping("/myfood.food")
	public String myfood(HttpSession session, Model model) {
		String id = (java.lang.String) session.getAttribute("id");

		ArrayList<String> list = service2.searchMyFood(id);
//이거를 food의 리스트로만들어야함
		int carbosum = 0;
		int proteinsum = 0;
		int fatsum = 0;
		int sugarsum = 0;
		int natriumsum = 0;
		int cholesum = 0;
		int fattyacidsum = 0;
		int transfatsum =0 ;
		
		
		
		ArrayList<Food> foods = new ArrayList<>();
		for (String x : list) {
			Food f = service.search(Integer.parseInt(x));
			foods.add(f);
			carbosum += f.getCarbo();
			proteinsum += f.getProtein();
			fatsum += f.getFat();
			sugarsum += f.getSugar();
			natriumsum += f.getNatrium();
			cholesum += f.getChole();
			fattyacidsum += f.getFattyacid();
			transfatsum += f.getTransfat();
		}
		
		MyFood mf = new MyFood(carbosum , proteinsum, fatsum, sugarsum,natriumsum,cholesum, fattyacidsum,transfatsum);
		model.addAttribute("list", foods);// jsp에서 접근해서 사용하도록 저장
		model.addAttribute("nutrient" , mf);
		//model.addAttribute("mycal", service2.getmycal(id));
		Member m = service2.searchMyPage(id);
		model.addAttribute("mycal", m.getMycal());
		model.addAttribute("weight", m.getWeight());
		
		return "myfood";
	}

	@PostMapping("/search.food")
	public String search(HttpServletRequest req, HttpSession session, String condition, String word, Model model) {
		session.setAttribute("cpage", req.getRequestURI());

		/*
		 * //검색어 저장 for(String w : words) {
		 *
		 * }
		 */
		String[] words = word.split(" ");
		ArrayList<Food> list = null;
		
		if(condition.equals("calorie"))
		{
			list = service.searchByCal(Double.parseDouble(word));
		}else
		{	
			if(word == "") {
				return "redirect:/list.food";
				/* list = service.searchAll((new FoodPageBean("all", null, null, 0))); */
			}else {
				list = service.searchAll((new FoodPageBean(condition, words, null, 0)));
				service.searchcnt(list);
			}
		}
		
		ArrayList<Food> list2 = service.sortkw((new FoodPageBean("all", null, null, 0)));
		ArrayList<Food> top4 = new ArrayList<>();
		
		  for(int i=0; i<4; i++) {
			  top4.add(list2.get(i));
		  }
		 
		model.addAttribute("foodList", list);
		model.addAttribute("sortlist", top4);// jsp에서 접근해서 사용하도록 저장
		

		return "index";
	}

	@GetMapping("/sortkw.food")
	public String sortkw(HttpServletRequest req, HttpSession session, Model model) { //키워드 
		session.setAttribute("cpage", req.getRequestURI());

		ArrayList<Food> list = service.sortkw((new FoodPageBean("all", null, null, 0)));
		model.addAttribute("list", list);// jsp에서 접근해서 사용하도록 저장

		return "sortkw";
	}

//고객 정보 한개 처리
	@GetMapping("/detail.food")
	public String detail(HttpServletRequest req, HttpSession session, Model model, String code, boolean my) {
		session.setAttribute("cpage", req.getRequestURI());
		session.setAttribute("almsg" , "");
		int code1 = Integer.parseInt(code);
		service.countUp(code1); // 조회수 처리
		Food b = service.search(code1);
		model.addAttribute("b", b); // req에 넣어 저장

		/*
		 * //forward 방식으로 jsp로 전환 RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/view/detail.jsp"); //jsp의 위치경로 try {
		 * dispatcher.forward(req, res);//jsp로 forward 시킴 } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
		if(my) return "mydetail";
		else return "detail";
	}

	@PostMapping("/loginProcess.food")
	public String loginProcess(Model model, HttpSession session, String id, String pass) {// 로그인 처리 요청
//클라이언트가 입력한 id를 받아와서 세션에 저장시킴
		String cid = id; // db에서 체크하는 과정 생략
		int x = idcheck(id, pass);
		if (x == 2) {
			session.setAttribute("id", cid); // session에 저장
			if (id.equals("admin") || id.equals("ssafy")) {
				session.setAttribute("admins", "관리자");
			}
			return "redirect:/list.food";

		} else {
			if (x == -1)
				model.addAttribute("msg", "?");
			else if (x == 0)
				model.addAttribute("msg", "아이디가 없음");
			else
				model.addAttribute("msg", "비밀번호 불일치");
			return "notlogin";
		}
	}

	@GetMapping("/login.food")
	public String login() {// 로그인 화면 요청
		return "login";
	}
	
	@GetMapping("/qna.food")
	public String qna(Model model, HttpServletRequest req, HttpSession session) {
		session.setAttribute("cpage", req.getRequestURI());
		ArrayList<Food> list = service.searchAll((new FoodPageBean("all", null, null, 0)));
		model.addAttribute("list", list);// jsp에서 접근해서 사용하도록 저장

		ArrayList<Food> list2 = service.sortkw((new FoodPageBean("all", null, null, 0)));
		ArrayList<Food> top4 = new ArrayList<>();
		
		  for(int i=0; i<4; i++) {
			  top4.add(list2.get(i));
		  }
		 
		model.addAttribute("sortlist", top4);// jsp에서 접근해서 사용하도록 저장

		return "asd";
	}
	
	@GetMapping("/logout.food")
	public String logout(HttpSession session) {// 로그아웃 요청
		session.setAttribute("id", null); // session에서 지우기
		session.setAttribute("admins", null);
		return "redirect:/list.food";
	}

	@GetMapping("/mypage.food")
	public String mypage(HttpSession session, Model model) {//, int weight) {
		String id = (String) session.getAttribute("id");
		Member m = service2.searchMyPage(id);
		model.addAttribute("m", m);
		return "mypage";
	}

	public int idcheck(String id, String pass) {
		return service2.check(id, pass);
	}

}
