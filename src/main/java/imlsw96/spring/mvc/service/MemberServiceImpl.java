package imlsw96.spring.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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

    @Override // 동이름으로 우편번호 검색
    public String findZipcode(String dong) {
        // JSON : object mapper  (pom.xml)

        // 조회결과 출력방법 1 : csv
        // 서울, 강남구, 논현동, 123번지

        // 조회결과 출력방법2 : xml
        // <zip><sido>서울</sido><gugun> 강남구</gugun><dong>논현동</dong><bunji>123</bunji></zip>

        // 조회결과 출력방법3 : json (쉼표로 구분) (추천!)
        // {'sido':'서울','gugun': '강남구','dong':'논현동' , '번지': '123번지' }

        // StringBuilder sb = new StringBuilder();
        // sb.append("{'sido':").append(" '서울,' ")
        // .append(" 'gugun': ").append(" '강남구', ")
        // .append(" 'dong': ").append(" '논현동동', ")

        // 코드로 json형태로 결과물을 만들려면 상당히 복잡함
        //ObjectMapper 라이브러리를 이용하면
        // 손쉽게 JSON 유형의 데이터를 생성할 수 있음.
        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        dong = dong + "%";

        try {
            json = mapper.writeValueAsString(
                    mdao.selectZipcode(dong) );
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        // 검색한 주소데이터를 json형식으로 변환환


       return json;
    }

    @Override
    public String checkUserid(String uid) {
        String isOk="0";
        int cnt = mdao.selectOneUserid(uid);
        if (cnt>0) isOk="1";

        return isOk;
    }
}
