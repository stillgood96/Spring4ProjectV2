package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.vo.PdsVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface PdsService {
    boolean newPds(Map<String, String> frmdata, PdsVO pvo);
    boolean newPds(PdsVO pvo, MultipartFile[] file);

    List<PdsVO> readPds(String cp);

    int countPds();
    PdsVO readOnePds(String bno);

    boolean viewCountPds(String bno);

    Object readReply(String bno);


    PdsVO readOneFname(String pno, String order);

    boolean downCountPds(String pno, String order);
}
