package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    // boolean의 설정이유 : true/false로 데이터추가/변환/삭제 성공여부 확인하려고
    boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean deleteBoard(String bno);
    int countBoard();
}
