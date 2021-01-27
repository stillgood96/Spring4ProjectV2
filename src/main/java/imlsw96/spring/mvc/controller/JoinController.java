package imlsw96.spring.mvc.controller;

import imlsw96.spring.mvc.service.MemberService;
import imlsw96.spring.mvc.util.GoogleCaptchaUtil;
import imlsw96.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class JoinController {

    // 하나하나씩 DI받을 변수들을 쓰는방법
    //@Autowired
    //private MemberService msrv;
    //@Autowired
   // private GoogleCaptchaUtil gcutil;


    //생성자를 이용해서 @Autowired를 한번만 쓰는 방법
    @Autowired
    public JoinController(MemberService msrv, GoogleCaptchaUtil gcutil) {
        this.msrv = msrv;
        this.gcutil = gcutil;
    }

    private MemberService msrv;
    private GoogleCaptchaUtil gcutil;


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


    // 회원가입시 입력한 정보는 MemberVO객체 저장됨
    // 하지만, 클라이언트에서 회원정보와 상관없는 데이터를 보낸 경우
    // HttpServletRequest 객체를 이용해서 처리함. (추천!)
    // 물론, MemberVO 객체에 같이 정의해서 사용해도 됨.

    // Model/ModelAttribute/ModelAndView
    // 뷰에 사용자 데이터를  보내고 싶을때 사용하는 객체들
    // 단, 데이터는 request 객체에 1회성으로 저장됨

    // RedirectAttribute
    // 리다이렉트된 뷰에 사용자 데이터를 보내고 싶을때 사용하는 객체
    // 단, 데이터는 session 객체에 1회성으로 저장됨
    @PostMapping("join/joinme") // 회원가입처리
    public String joinmeok(MemberVO mvo, HttpServletRequest req, RedirectAttributes rds) throws UnsupportedEncodingException {

        // 질의문자열에 한글을 포함시키려면
        // 반드시 URLEncoder를 이용해서 한글에 대한 적절한 인코딩이 필요!

        String param="?name=" + URLEncoder.encode(mvo.getName(),"UTF-8");
        param += "&jumin1=" + mvo.getJumin().split("-")[0];
        param += "&jumin2=" + mvo.getJumin().split("-")[1];
        String returnPage = "redirect:/join/joinme" + param;

        // 클라이언트에서 생성한 captcha 코드를 가져옴
        String gCaptcha = req.getParameter("g-recaptcha");

        // captcha코드의 유효성을 확인함
        // 결과 : true => 테이블에 회원정보 저장후, /join/joinok 이동
        // 결과 : false => 다시 /join/joinme로 이동해야 한다.
        if ( gcutil.checkCaptcha(gCaptcha) ) {
            msrv.NewMember(mvo);
            returnPage = "redirect:/join/joinok";
        } else {
            rds.addFlashAttribute("checkCaptcha","자동가입방지 확인이 실패했습니다.");
            rds.addFlashAttribute("mvo",mvo);
        }

        return returnPage;
    }

    @GetMapping("join/joinok")
    public String joinok(){
        return "join/joinok.tiles";
    }

    //우편번호 검색
    // /join/zipcode?dong=동이름
    // 검색된 결과를 뷰페이지 없이 바로응답으로 출력 : REST
    // 결과는 자바스크립트 ajax로 적절히 가공해서 폼에 출력

    // 뷰페이지 없이 바로 응답으로 처리하게 해주는 어노테이션 (ResponseBody)
    // 서블릿에서 제공하는 HttpServletResponse 객체를 이용하면
    // 스프링의 뷰리졸버 없이 응답을 출력할 수 있음.
    @ResponseBody
    @GetMapping("/join/zipcode")
    public void zipcode (String dong, HttpServletResponse res) {  //동을 받아와야하기 때문에
            try {
                // 응답결과의 유형은 json 으로 설정
                res.setContentType("application/json; charset=UTF-8");

                // 응답결과를 브라우져로 보냄
                res.getWriter().print(msrv.findZipcode(dong));


            } catch(Exception ex) {
                ex.printStackTrace();
            }

    }
    //아이디 중복체크
    // /join/checkuid?uid=아이디
    // 사용가능 아이디 : 0
    // 사용 불가능 아이디 (다른 사람이 사용중) : 1
    @ResponseBody
    @GetMapping("/join/checkuid")
    public void checkuid (String uid, HttpServletResponse res) {  //동을 받아와야하기 때문에
        try {
            // 응답결과를 브라우져로 보냄
            res.getWriter().print(msrv.checkUserid(uid));
        } catch(Exception ex) {
            ex.printStackTrace();
        }

    }

}
