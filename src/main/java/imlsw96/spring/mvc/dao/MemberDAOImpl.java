package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember",mvo);
    }

}
