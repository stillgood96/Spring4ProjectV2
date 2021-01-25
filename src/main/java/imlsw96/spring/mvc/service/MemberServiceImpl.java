package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.dao.MemberDAO;
import imlsw96.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO mdao;

    @Override
    public String NewMember(MemberVO mvo) {
       String result="회원가입 실패!";
        int cnt =mdao.insertMember(mvo);
       if (cnt>0) result="회원가입 성공!";
        return result ;
    }
}
