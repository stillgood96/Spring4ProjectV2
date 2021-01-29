package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.dao.BoardDAO;
import imlsw96.spring.mvc.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bsrv")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO bdao;

    @Override
    public boolean newBoard(BoardVO bvo) {
        // inserBoard가 인트를 반환 그래서 Boolean으로 반환하기위한 추가 작업.
        boolean isOk=false;
        int cnt= bdao.insertBoard(bvo);
        if(cnt>0) isOk= true;

        return isOk;
    }

    @Override
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp)-1) * 10;
        return bdao.selectBoard(snum);
    }

    @Override
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override
    public boolean modifyBoard(BoardVO bvo) {
        return false;
    }

    @Override
    public boolean deleteBoard(String bno) {
        return false;
    }


    //게시글 총 갯수
    public int countBoard() {
        return bdao.selectCountBoard();
    }

}
