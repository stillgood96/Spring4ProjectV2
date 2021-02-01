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

    @Override // 새글쓰기
    public boolean newBoard(BoardVO bvo) {
        // inserBoard가 인트를 반환 그래서 Boolean으로 반환하기위한 추가 작업.
        boolean isOk=false;

        // 줄바꿈기호를 <br>로 변환작업 필요할 수도 있음
        // 지금 예제에서는 뷰단에서 변환작업을 수행하도록 작성함
        // 서비스에서 처리하는 문구를 작성하면 서버의 퍼포먼스가 떨어지게 됨 .
        // 서버에서 글을 불러올때마다 줄바꿈 처리를 따로 해야하니까

        int cnt= bdao.insertBoard(bvo);
        if(cnt>0) isOk= true;

        return isOk;
    }

    @Override // 리스트보기
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp)-1) * 10;
        return bdao.selectBoard(snum);
    }

    @Override // 본문보기
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override // 수정하기
    public boolean modifyBoard(BoardVO bvo) {
        boolean isOk=false;
        int cnt =bdao.updateBoard(bvo);
        if(cnt>0) isOk=true;
        return isOk;
    }

    @Override // 삭제하기
    public boolean removeBoard(String bno) {
        boolean isOk=false;
        int cnt =bdao.deleteBoard(bno);
        if(cnt>0) isOk=true;
        return isOk;
    }


    //게시글 총 갯수
    public int countBoard() {
        return bdao.selectCountBoard();
    }

    @Override // 조회수 증가
    public boolean viewCountBoard(String bno) {
        boolean isOk=false;

        int cnt= bdao.updateViewCount(bno);
        if(cnt>0) isOk= true;

        return isOk;
    }
}
