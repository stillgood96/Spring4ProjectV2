<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--로그인하지 않았으면 list페이지로 강제 전환  --%>
<c:if test="${empty UID}">
    <%-- <c:redirect url="/pds/list?cp=1"/> --%>
</c:if>
    <div id="main">
        <div class="margin30">
            <h3><i class="bi bi-cloud-download-fil bidragup"></i>자료실</h3>
            <hr>
        </div>

        <form id="newpdfrm">
            <div class="row mb-2 margin1050">
                <div class="col-6">
                    <h4><i class="bi bi-plus-circle-fill bidragup"></i>새글 쓰기 </h4>
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
                    <input type="text" id="uid" name="userid" class="form-control col-2" readonly value="${UID}">
                </div>
                <div class="form-gourp row mt-3">
                    <label for="contents"  class="col-form-label col-2 text-right">본문내용</label>
                    <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="15"></textarea>
                </div>
                <!--파일 첨부 시작 -->
                    <div class="form-group row">
                        <label for="fname1"  class="col-form-label col-2 text-right">파일첨부</label>
                        <div class="custom-file col-9">
                            <input type="file" id="fname1" name="file" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요.</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" id="fname2" name="file" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요.</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" id="fname3" name="file" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요.</label>
                        </div>
                    </div>
                <!--파일 첨부 끝! -->

                <div class="row">
                    <label class="col-2 text-right">자동가입방지</label>
                    <img src="../../img/google_recaptcha.gif" width="40%" height="40%" style="margin-left:-4px">
                </div>
            </div> <!--새글쓰기 폼폼 -->

            <div class="row">
               <div class="col-12 text-center">
                   <button type="button" class="btn btn-primary" id="newpdbtn"><i class="bi bi-check">입력완료</i></button>
                   <button type="button" class="btn btn-danger" id="cancelbdbtn"><i class="bi bi-x">취소하기</i></button>
               </div>
           </div><!-- 하단 버튼 -->
        </form>
    </div><!-- main -->



