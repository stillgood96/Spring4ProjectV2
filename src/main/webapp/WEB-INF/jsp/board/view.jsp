<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 줄바꿈 문자를 newChar변수에 저장 --%>
<%-- <%String newChar = "블라블라";%>  <!-- 방법1 이물질같은 느낌 -->
<c:set var="newChar" value="블라블라"/> <!--방법2 html코드랑 이질감 덜함 자료형 선언을 안해주어도 됨 --> --%>

<%-- JSP 객체의 생존기간 : scope --%>
<%--page : 현재 페이지내에서만 객체 사용 --%>
<%--request : 이전페이지(폼)에서 생성한 객체를 현재페이지(처리)에 요청을 통해 사용--%>
<%--session : 동일 브라우져내에서 공유할 수 있는 객체--%>
<%--application : WAS(프로젝트) 내에서 공유할 수 있는 객체 전역서버같은 느낌 톰캣 서버 끌때까지 !--%>

<c:set var="newChar" value="
" scope="request"/>

    <div id="main">
        <div class="margin30">
            <h3><i class="bi bi-chat-dots-fill bidragup"></i>자유 게시판</h3>
            <hr>
        </div>

        </div>
        <div class="">
            <div class="row margin1050 mt-3">
                <div class="col-6">
                    <button type="button" id="before" class="btn btn-light"><i class="bi bi-chevron-left bidragup"></i>이전게시물 </button>
                    <button type="button" id="next" class="btn btn-light"><i class="bi bi-chevron-right bidragup"></i>다음게시물 </button>
                </div>

                <div class="col-6 text-right mb-2">

                    <c:if test="${not empty UID}">
                    <button id="newbd" type="button" class="btn btn-light id=listbdbtn"><i class="bi bi-card-list bidragup">새글쓰기</i></button></c:if>
                </div>
            </div><!--버튼들 -->
            <div class="row margin1050">
                <table class="table">
                    <tr class="tblines2 tbbg1 "><th colspan="2" class="text-center "><h2>${bd.title}</h2></th></tr> <!-- 제목 -->
                    <tr class="tbbg2 font-weight-bold"><td>${bd.userid}</td><td class="text-right">${bd.regdate} / ${bd.thumbs} / ${bd.views}</td></tr> <!-- 작성자, 작성일, 조회수 -->
                    <tr><td colspan="2" class="tbbg3 tblines2">
                        ${fn:replace(bd.contents, newChar, "<br>")} <!--이런식으로 데이터 저장할때 <br>태그를 넣는것이 좋다. 서버에서 처리하면 더 느려진다.-->
                    </td>
                </table>
            </div><!--본문글 -->


            <div class="row margin1050">
                    <div class="col-6">
                        <%-- 로그인 했고 , 지금 보는 글이 내가 작성한 글이라면 수정과 삭제가 가능하도록. --%>
                        <c:if test="${not empty UID and UID eq bd.userid}">
                            <button type="button" id="upbdbtn" class="btn btn-warning"><i class="bi bi-pencil-square bidragup"></i>수정하기 </button>
                            <button type="button" id="rmbdbtn" class="btn btn-danger"><i class="bi bi-trash-fill bidragup"></i>삭제하기 </button>
                        </c:if>
                    </div>
                    <div class="col-6 text-right">
                            <c:if test="${not empty UID}">
                        <button type="button" id="thumbbtn" class="btn btn-dark"><i class="bi bi-hand-thumbs-up bidragup"> </i>추천하기</button>
                            </c:if>
                        <button type="button" id="listbdbtn" class="btn btn-light id=listbdbtn"><i class="bi bi-card-list bidragup">목록으로</i></button>
                    </div>
                    </div><!--버튼들 -->

            <input type="hidden" id="bno" value="${param.bno}">
            <input type="hidden" id="cp" value="${param.cp}">
            <input type="hidden" id="userid" value="${bd.userid}">

            <div class="row margin1050">
                <h3><i class="bi bi-chat-square-dots-fill"></i>나도 한마디</h3>
                <table class="table tblines tbwide">
                    <tr><td><h4>imlsw96</h4></td>
                            <td>
                                <ul class="list-unstyled">
                                    <li><div class="cmtbg1 row">
                                        <span class="col-12 text-right">2021.01.14 16:16:16</span></div>
                                        <p>졸리다 졸려 ㅆㅃ </p>
                                    </li>
                                </ul><!-- 댓글 -->
                                    <ul class="list-unstyled">
                                        <li><div class="cmtbg2 row">
                                            <span class="h6 col-3">imlsw96</span><span class="col-9 text-right">2021.01.14 16:16:16</span></div>
                                                <p>졸리다고요~? 그러니까 할일을 제때 빠릿빠릿하게 했어야죠~</p>
                                        </li>
                                    </ul><!-- 대댓글 -->
                            </td>
                    </tr>

                    <tr>
                        <td><h4>imlsw96</h4></td>
                        <td>
                            <ul class="list-unstyled">
                                <li><div class="cmtbg1 row">
                                    <span class="col-12 text-right">2021.01.14 16:16:16</span></div>
                                    <p>졸리다 졸려 ㅆㅃ </p>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div><!--댓글목록 -->
            <div class="row margin1050">
                <form id="replyfrm" class="card card-body bg-light">
                    <div class="form-group row justify-content-center">
                        <label class="text-warning font-weight-bold pushtop50">로그인 하세요</label>&nbsp;
                        <textarea id="comment" rows="5" class="form-control col-8"></textarea>&nbsp;
                       <span><button id="bdcmtbtn" class="btn btn-dark pushtop50 "><i class="bi bi-chat-text-fill bidragup "></i>댓글쓰기</button></span>
                    </div>
                </form>
            </div><!--댓글폼 -->
    </div><!-- main -->

