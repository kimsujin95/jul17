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

	// 글쓰기입니다.
	public void write(BoardDTO dto) {
		boardDAO.write(dto); // 실행만 시키고 결과를 받지 않습니다.
		// select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.
	}
}
