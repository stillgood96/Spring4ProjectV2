package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyService {
    List<ReplyVO> readReply(String bno);

    boolean newReply(ReplyVO rvo);
}
