package imlsw96.spring.mvc.controller;

import imlsw96.spring.mvc.service.MemberService;
import imlsw96.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JoinController {

    @Autowired
    private MemberService msrv;

    @GetMapping("join/agree")
    public String agree(){
        return "join/agree.tiles";
    }

    @GetMapping("join/checkme")
    public String checkme(){
        return "join/checkme.tiles";
    }

    @GetMapping("join/joinme") // 회원가입 폼
    public String joinme(){
        return "join/joinme.tiles";
    }

    @PostMapping("join/joinme") // 회원가입처리
    public String joinmeok(MemberVO mvo){

        System.out.println(msrv.NewMember(mvo));
        return "redirect:/join/joinok.tiles";
    }

    @GetMapping("join/joinok")
    public String joinok(){
        return "join/joinok.tiles";
    }
}
