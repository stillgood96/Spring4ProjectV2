package imlsw96.spring.mvc.dao;

import imlsw96.spring.mvc.vo.GalleryVO;

import java.util.List;

public interface GalleryDAO {
    int insertGallery(GalleryVO gvo);

    List<GalleryVO> selectGallery(int snum);

    int selectCountGallery();

    GalleryVO selectOneGallery(String gno);
}
