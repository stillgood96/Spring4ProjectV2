package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
    List<ReplyVO> selectReply(int bno);

    int insertReply(ReplyVO rvo);
}
