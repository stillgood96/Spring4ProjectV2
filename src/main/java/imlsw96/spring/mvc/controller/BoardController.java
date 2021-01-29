package imlsw96.spring.mvc.controller;

import imlsw96.spring.mvc.service.BoardReplyService;
import imlsw96.spring.mvc.service.BoardService;
import imlsw96.spring.mvc.util.GoogleCaptchaUtil;
import imlsw96.spring.mvc.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

    private BoardService bsrv;
    private GoogleCaptchaUtil gcutil;
    private BoardReplyService brsrv;

    @Autowired
    public BoardController(BoardService bsrv, GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
        //this.brsrv = brsrv; 나중에 만들예정 BoardReplyService
    }

    // 게시판 목록 처리1 : 페이징
    // ex) 총게시글 수 count : 101
    // 페이지당 출력 게시글 수 perpage : 10
    // 총 페이지 수pages는  ? : 11
    // => pages = counts / perpage

    // 게시물의 번호 범위 : 101 ~ 1
    // 구현코드 : select ??? from Board limit startnum, perpage
    // 1page에 출력할 게시물의 범위 :0~9
    // 2page에 출력할 게시물의 범위 : 10~19
    // 3page에 출력할 게시물의 범위 : 20~29
    // => 특정 페이지에 속하는 게시물의 시작범위(startnum) 산출식 ?
    // startnum = (page-1) *10



    // 게시판 목록 처리 2 : 검색처리

    @GetMapping("/board/list")  // 게시판 목록 출력
    public ModelAndView list(ModelAndView mv, String cp) {
        if (cp==null) cp="1";

        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard(cp));
        mv.addObject("snum",bsrv.readBoard(cp));// 하단 navbar를 사용하는 값.
        mv.addObject("bdcnt",bsrv.countBoard()); // 총페이지수를 구하

        return mv;
    }

    @GetMapping("/board/view")// 게시판 본문글 출력
    public ModelAndView view(String bno, ModelAndView mv) {
        mv.setViewName("board/view.tiles");
        mv.addObject("bd",bsrv.readOneBoard(bno));
        return mv;
    }


    @GetMapping("/board/update")
    public String update() {
        return "board/update.tiles";
    }


    @GetMapping("/board/write")
    public String write() {
        return "board/write.tiles";
    }

    @PostMapping("/board/write") // 새글ㅡㅆ기 처리
    public String writeok(BoardVO bvo) {
        String returnPage ="redirect:/board/write";

        bvo.setUserid("지현수지"); // 세션처리전 임시방편
        if(bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list";

        return returnPage;
    }
}

