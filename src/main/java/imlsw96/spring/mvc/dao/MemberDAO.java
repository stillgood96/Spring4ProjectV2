package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.MemberVO;
import imlsw96.spring.mvc.vo.ZipcodeVO;

import java.util.List;

public interface MemberDAO {
    int insertMember(MemberVO mvo);

    List<ZipcodeVO> selectZipcode(String dong);


    int selectOneUserid(String uid);
}
