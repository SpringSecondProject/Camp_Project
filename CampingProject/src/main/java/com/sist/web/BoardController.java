package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.BoardService;
import com.sist.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
    private BoardService service;

	// 공지사항 목록 (관리자)
	@GetMapping("admin/list.do")
	public String board_list(Model model)
	{
	    model.addAttribute("main_jsp", "../admin/list.jsp");

	    return "main/main";
	}

	// 공지사항 상세 (관리자)
	@GetMapping("admin/detail.do")
	public String board_detail(int bno, Model model) {
		service.hitIncrement(bno);
		BoardVO vo = service.getNoticeDetail(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../admin/detail.jsp");
		return "main/main";
	}
	
	// 공지사항 목록 (일반 게시판)
	@GetMapping("board/list.do")
	public String board_list2(Model model)
	{
	    model.addAttribute("main_jsp", "../board/list.jsp");

	    return "main/main";
	}

	// 공지사항 상세 (일반 게시판)
	@GetMapping("board/detail.do")
	public String board_detail2(int bno, Model model)
	{
		service.hitIncrement(bno);
		BoardVO vo = service.getNoticeDetail(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../board/detail.jsp");
		return "main/main";
	}
	
	// 글쓰기 폼
	@GetMapping("admin/insert.do")
	public String board_insert(Model model) {
		model.addAttribute("main_jsp", "../admin/insert.jsp");
		return "main/main";
	}

	// 글쓰기 처리
	@PostMapping("admin/insert_ok.do")
	public String board_insert_ok(BoardVO vo) {
		service.insertNotice(vo);
		return "redirect:/admin/list.do";
	}

	// 수정 폼
	@GetMapping("admin/update.do")
	public String board_update(int bno, Model model) {
		model.addAttribute("vo", service.getNoticeDetail(bno));
		model.addAttribute("main_jsp", "../admin/update.jsp");
		return "main/main";
	}

	// 수정 처리
	@PostMapping("admin/update_ok.do")
	public String board_update_ok(BoardVO vo) {
		service.updateNotice(vo);
		return "redirect:/admin/detail.do?bno=" + vo.getBno();
	}

	// 삭제
	@GetMapping("admin/delete.do")
	public String board_delete(int bno) {
		service.deleteNotice(bno);
		return "redirect:/admin/list.do";
	}
}