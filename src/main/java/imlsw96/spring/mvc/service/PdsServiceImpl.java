package imlsw96.spring.mvc.service;

import imlsw96.spring.mvc.dao.PdsDAO;
import imlsw96.spring.mvc.util.FileUpDownUtil;
import imlsw96.spring.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("psrv")
public class PdsServiceImpl implements PdsService{
    @Autowired
    private PdsDAO pdao;
    @Autowired
    private FileUpDownUtil fud;

    @Override
    public List<PdsVO> readPds(String cp) {
        int snum=(Integer.parseInt(cp)-1) *10;
        return pdao.selectPds(snum);
    }

    @Override
    public int countPds() {
        return pdao.selectCountPds();
    }

    @Override //본문보기
    public PdsVO readOnePds(String pno) {
        return pdao.selectOnePds(pno);
    }

    @Override // 조회수 증가
    public boolean viewCountPds(String pno) {
        boolean isOk=false;

        int cnt= pdao.updateViewCount(pno);
        if(cnt>0) isOk= true;

        return isOk;
    }

    @Override // 댓글 미구현
    public Object readReply(String bno) {
        return null;
    }

    @Override
    public boolean newPds(Map<String, String> frmdata, PdsVO pvo) {
        // 폼데이터를 pvo에 나눠
        procFormdata(pvo, frmdata);

        int cnt = pdao.insertPds(pvo);

        return true;
    }

    // 새로 구현된 자료실 소스  : 리눅스 서버에 저장되도록 변경한 것.
    // MultipartFile로 구현함 ㅎㅎㅎ    @Override
    public boolean newPds(PdsVO pvo, MultipartFile[] file) {

        // 파일 업로드시 사용할 UUID 생성
        String uuid = fud.makeUUID();

        // 업로드한 파일의 정보를 저장하기 위해 동적배열 생성
        List<String> files = new ArrayList<>();

        for(MultipartFile f : file){
            if (!f.getOriginalFilename().isEmpty())
                files.add(fud.FileUpload2(f,uuid));
                // 파일업로드시 앞서 만든 uuid값을  매개변수로 넘김
                // 업로드한 뒤 결과값은 '파일명/파일크기/파일종류'로  넘어옴
            else
                files.add("-/-/-");
                // 업로드를 하지 못한 경우 '-/-/-'만 넘김
        }
        // 업로드한 파일정보와 폼데이터 확인
//        System.out.println(pvo.getTitle());
//        System.out.println(pvo.getContents());
        System.out.println(files.get(0));
//        System.out.println(files.get(1));

        // 업로드한 파일정보를 vo로 나눠 저장
        pvo.setFname1(files.get(0).split("[/]")[0]);
        pvo.setFsize1(files.get(0).split("[/]")[1]);
        pvo.setFtype1(files.get(0).split("[/]")[2]);

        pvo.setFname2(files.get(0).split("[/]")[0]);
        pvo.setFsize2(files.get(0).split("[/]")[1]);
        pvo.setFtype2(files.get(0).split("[/]")[2]);

        pvo.setFname3(files.get(0).split("[/]")[0]);
        pvo.setFsize3(files.get(0).split("[/]")[1]);
        pvo.setFtype3(files.get(0).split("[/]")[2]);

        // 위에서 생성한 uuid를 uuid를 pvo에 저장
        pvo.setUuid(uuid);

        // 테이블에 입력데이터 저장.
        int cnt = pdao.insertPds(pvo);

        return true;
    }

    // 폼데이터를 PdsVO에 나눠 담음
    // title : 제목
    // userid : 작성자
    // contents : 본문내용
    // file1 : 첨부 파일명
    // file1size : 첨부파일 크기
    // file1type : 첨부파일 유형
    private void procFormdata(PdsVO  p, Map<String, String> frmdata) {
        for(String key : frmdata.keySet()) { // Map 으로부터 키를 하나씩 꺼냄
            String val = frmdata.get(key);      // key에 해당하는 값을 알아냄
            switch (key) {
                case "uuid" : p.setUuid(val); break;
                case "title" : p.setTitle(val); break;
                case "userid" : p.setUserid(val); break;
                case "contents" : p.setContents(val); break;
                case "file1" : p.setFname1(val); break;
                case "file1size" : p.setFsize1(val); break;
                case "file1type" : p.setFtype1(val); break;
                case "file2" : p.setFname2(val); break;
                case "file2size" : p.setFsize2(val); break;
                case "file2type" : p.setFtype2(val); break;
                case "file3" : p.setFname3(val); break;
                case "file3size" : p.setFsize3(val); break;
                case "file3type" : p.setFtype3(val); break;
            }
        }
    }

    @Override
    public PdsVO readOneFname(String pno, String order) {
        return pdao.selectOneFname(pno, order);
    }

    @Override
    public boolean downCountPds(String pno, String order) {
        Map<String, String> param = new HashMap<>();
        param.put("pno",pno);
        param.put("order","fdown" + order);

        int cnt =pdao.updateDownCount(param);

        return true ;
    }
}
