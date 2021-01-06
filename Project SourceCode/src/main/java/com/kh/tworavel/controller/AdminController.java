package com.kh.tworavel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.Out;
import com.kh.tworavel.model.service.BoardService;
import com.kh.tworavel.model.service.CompanionService;
import com.kh.tworavel.model.service.MemberService;
import com.kh.tworavel.model.service.OutService;



@Controller
public class AdminController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BoardService bService;
	public static final int LIMIT = 10;
	@Autowired
	private CompanionService cService;
	@Autowired
	private OutService oService;
	
	@RequestMapping(value = "adminpage.do")
	public ModelAndView admin(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,@RequestParam(name="type", defaultValue = "B",required = false) char b_type){
		
		int startPage =0;
		int endPage=0;
		int listCount=0;

		if(page%5==0) {
			
			startPage = (page/5 -1)*5+1;
			endPage= (page/5)*5;
		}else if(page%5!=0) {
			
			startPage = (page/5)*5 +1;
			endPage=(page/5 + 1)*5;
		}
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			String type = String.valueOf(b_type);
			System.out.println(type);
			if(type.equals("B")) {
				listCount = bService.selectBoardAllCount();
			}
			else if (type.equals("C")) {
				listCount = cService.listCountC();
			}
			else if(type.equals("M")) {
				listCount = mService.selectMemberAllCount();
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if(type.equals("B")) {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
				System.out.println(bService.selectBoardAll(currentPage,LIMIT).size());
			}
			else if (type.equals("C")) {
				mv.addObject("clist",cService.selectListCp(currentPage,LIMIT));
			}
			else if(type.equals("M")) {
				mv.addObject("mlist",mService.selectMemberAll(currentPage,LIMIT));
			}else {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
			}
			mv.addObject("startPage",startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("type",type);
			mv.setViewName("AdminPage");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	@RequestMapping(value = "Adminboarddelete.do", method = RequestMethod.GET)
	public ModelAndView BoardDeleteService(@RequestParam(name = "b_id") int b_id, ModelAndView mv,
			HttpServletRequest request) {
		bService.deleteBoard(b_id);
		mv.setViewName("redirect:adminpage.do?type=B");
		return mv;
	}
	@RequestMapping(value = "AdminDeleteMember.do", method = RequestMethod.POST)
	public ModelAndView adminDeleteMember(@RequestParam(name = "m_id") String m_id,@RequestParam(name="o_reason")String o_reason, ModelAndView mv,
			HttpServletRequest request) {
		Out vo = new Out();
		vo.setM_id(m_id);
		vo.setO_reason(o_reason);
		oService.adminOutMember(vo);
		mv.setViewName("redirect:adminpage.do?type=M");
		return mv;
	}
	 @RequestMapping(value = "admincompaniondelete.do", method = RequestMethod.GET)
	   public ModelAndView CompanionDeleteService(@RequestParam(name = "c_id") int c_id, ModelAndView mv,
	         HttpServletRequest request) {
	      cService.deleteC(c_id);
	      mv.setViewName("redirect:adminpage.do?type=C");
	      return mv;
	   }
}