<%@ page pageEncoding="utf-8" %>


    <div id="main">
        <div class="margin30">
            <h3><i class="bi bi-chat-fill bidragup"></i>자유 게시판</h3>
            <hr>
        </div>

        <form class="margin1050">
            <div class="row mb-2">
                <div class="col-6">
                    <h4><i class="bi bi-pencil-square bidragup"></i>수정하기 </h4>
                </div>
                <div class="col-6 text-right mb-2">
                    <button type="button" class="btn btn-light id=listbdbtn"><i class="bi bi-card-list bidragup"> 목록</i></button>
                </div>
            </div><!-- 상단버튼 -->
            <div class="card card-body bg-light">
                <div class="form-group row">
                    <label for="title"  class="col-form-label col-2 text-right">제목</label>
                    <input type="text" id="title" name="title" class="form-control col-9">
                </div>
                <div class="form-gourp row">
                    <label for="uid"  class="col-form-label col-2 text-right">작성자</label>
                    <input type="text" id="uid" name="userid" class="form-control col-2" readonly>
                </div>
                <div class="form-gourp row mt-3">
                    <label for="contents"  class="col-form-label col-2 text-right">본문내용</label>
                    <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="15"></textarea>
                </div>

                <div class="row">
                    <label class="col-2 text-right">자동가입방지</label>
                    <img src="../../img/google_recaptcha.gif" width="40%" height="40%" style="margin-left:-4px">
                </div>
            </div> <!--새글쓰기 폼폼 -->

            <div class="row">
               <div class="col-12 text-center">
                   <button type="button" class="btn btn-primary id=upbdbtn"><i class="bi bi-check">수정완료</i></button>
                   <button type="button" class="btn btn-danger id=cancelbdbtn"><i class="bi bi-x">취소하기</i></button>
               </div>
           </div><!-- 하단 버튼 -->
        </form>
    </div><!-- main -->

