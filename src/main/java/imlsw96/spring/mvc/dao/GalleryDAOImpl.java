package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.GalleryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("gdao")
public class GalleryDAOImpl implements GalleryDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertGallery(GalleryVO gvo) {
        sqlSession.insert("gallery.insertGallery",gvo);

        // 방금 입력한 갤러리 데이터 gno값을 조사해서 반환
        return sqlSession.selectOne("gallery.lastGalleryID");
    }

    @Override
    public List<GalleryVO> selectGallery(int snum) {
        return sqlSession.selectList("gallery.selectList",snum);
    }

    @Override
    public int selectCountGallery() {
        return sqlSession.selectOne("gallery.countGallery");
    }

    @Override
    public GalleryVO selectOneGallery(String gno) {
        return sqlSession.selectOne("gallery.selectOne",gno);
    }
}
