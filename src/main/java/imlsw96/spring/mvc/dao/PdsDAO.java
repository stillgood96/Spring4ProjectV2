package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsDAO {
    List<PdsVO> selectPds(int snum);

    int selectCountPds();

    int insertPds(PdsVO pvo);

    PdsVO selectOnePds(String pno);
    int updateViewCount(String pno);

    PdsVO selectOneFname(String pno, String order);

    int updateDownCount(Map<String, String> param);
}
