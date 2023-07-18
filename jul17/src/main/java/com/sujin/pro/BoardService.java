package com.sujin.pro;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {
	
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {	
		return boardDAO.boardList();
	}

	public BoardDTO detail(String bno) {
		return boardDAO.detail(bno);
	}
}
