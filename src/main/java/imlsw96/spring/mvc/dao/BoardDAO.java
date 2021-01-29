package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardDAO {
    int insertBoard(BoardVO bvo);
    List<BoardVO> selectBoard(int snum);
    BoardVO selectOneBoard(String bno);
    int updateBoard(BoardVO bvo);
    int deleteBoard(String bno);

    int selectCountBoard();
}
