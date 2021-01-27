package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.vo.MemberVO;

public interface MemberService {
    String NewMember(MemberVO mvo);

    String findZipcode(String dong);

    String checkUserid(String id);
}
