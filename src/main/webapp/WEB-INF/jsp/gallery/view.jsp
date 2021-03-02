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
" scope="application"/>
<%--<c:set var="baseImgURL" value="http://localhost/cdn/" />--%>
<c:set var="baseImgURL" value="http://ec2-54-180-30-68.ap-northeast-2.compute.amazonaws.com:1512/cdn/" />

<div id="main">
        <div class="margin30">
            <h3><i class="bi bi-card-image bidragup"></i>갤러리</h3>
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
                    <button id="newgal" type="button" class="btn btn-light" id="listbdbtn"><i class="bi bi-card-list bidragup">새글쓰기</i></button></c:if>
                </div>
            </div><!--버튼들 -->

            <div class="row margin1050">
                <table class="table">
                    <tr class="tblines2 tbbg1 "><th colspan="2" class="text-center "><h2>${gal.title}</h2></th></tr> <!-- 제목 -->
                    <tr class="tbbg2 font-weight-bold"><td>${gal.userid}</td><td class="text-right">${gal.regdate} / ${gal.thumbs} / ${gal.views}</td></tr> <!-- 작성자, 작성일, 조회수 -->
                    <tr><td colspan="2" class="tbbg3 tblines2">
                        <c:forEach begin="0" end="2" step="1" var="i">
                            <c:if test="${fn:split(gal.fnames,'[/]')[i] ne '-'}">
                                <img src="${baseImgURL}${fn:split(gal.fnames,'[/]')[i]}" width="75%" height="">
                            </c:if>
                        </c:forEach>


                       <p> ${fn:replace(gal.contents, newChar, "<br>")} </p><!--이런식으로 데이터 저장할때 <br>태그를 넣는것이 좋다. 서버에서 처리하면 더 느려진다.-->
                    </td></tr><!--본문 -->


                    <!-- 첨부1은 무조건나오니까 IF문 필요X -->
                    <c:forEach begin="0" end="2" step="1" var="i">
                    <c:if test="${fn:split(gal.fnames,'[/]')[i] ne '-'}">
                    <tr><td class="text-left">첨부${i+1}</td><td>(${fn:split(gal.fnames,"[/]")[i]} ${fn:split(gal.fsizes,"[/]")[i]}KB)</td></tr>
                    </c:if>
                    </c:forEach>
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
                        <button type="button" id="listbdbtn" class="btn btn-light" id="listbdbtn"><i class="bi bi-card-list bidragup">목록으로</i></button>
                    </div>
                    </div><!--버튼들 -->

            <input type="hidden" id="pno" value="${param.pno}">
            <input type="hidden" id="cp" value="${param.cp}">
            <input type="hidden" id="userid" value="${pd.userid}">

            <div class="row margin1050">
                <h3><i class="bi bi-chat-square-dots-fill"></i>나도 한마디</h3>

                <table class="table tblines tbwide">
                    <c:forEach var="r" items="${rp}">

                        <c:if test="${r.rno eq r.cno}"><!-- 댓글 -->
                    <tr><td><h4>${r.userid}</h4></td>
                            <td>
                                <ul class="list-unstyled">
                                    <li><div class="cmtbg1 row">
                                        <span class="col-12 text-right">${r.regdate}</span></div>
                                        <span style="float:right">
                                            <c:if test="${not empty UID}">
                                            <a href="javascript:addReply('${r.rno}')">[추가]</a></c:if>
                                            <c:if test="${UID eq r.userid}">
                                            <a>[수정]</a><a>[삭제]</a></c:if>
                                        </span>
                                        <p>${r.reply} </p>
                                    </li>
                                </ul>
                            </td>
                    </tr>
                        </c:if>

                        <c:if test="${r.rno ne r.cno}"><!-- 대댓글 -->
                            <tr><td><h4></h4></td>
                                <td>
                                    <ul class="list-unstyled">
                                        <li><div class="cmtbg2 row">
                                            <span class="h6 col-3">${r.userid}</span><span class="col-9 text-right">${r.regdate}</span></div>
                                            <p>${r.reply}</p>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </c:if>



                    </c:forEach>


                </table>
            </div><!--댓글목록 -->

            <c:if test="${not empty UID}">
                <div class="row margin1050">
                    <form id="replyfrm" class="card card-body bg-light">
                        <div class="form-group row justify-content-center">
                            <label class="text-warning font-weight-bold pushtop50">${UID}</label>&nbsp;
                            <textarea id="reply" name="reply" rows="5" class="form-control col-8"></textarea>&nbsp;
                           <span><button type="button" id="bdcmtbtn" class="btn btn-dark pushtop50 "><i class="bi bi-chat-text-fill bidragup "></i>댓글쓰기</button></span>
                        </div>
                        <input type="hidden" name="pno" value="${param.pno}">
                        <input type="hidden" name="userid" id="uid" value="${UID}">
                    </form>
                </div><!--댓글폼 -->
            </c:if>
    </div><!-- main -->

<!-- 댓글수정/삭제/대댓글다는 모달상자 -->
<div class="modal hide" id="replyModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header"><h3 class="modal-title">대댓글 쓰기</h3></div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
                    <textarea name="reply" id="rereply" rows="8" cols="75" class="span4"></textarea>
                    <input type="hidden" name="userid" value="${UID}">
                    <input type="hidden" name="bno" value="${param.pno}">
                    <input type="hidden" name="cno" id="cno">
                </form>
            </div>
            <div class="modal-footer"><button type="button" id="rpbtn" class="btn btn-warning">대댓글 작성</button></div>
        </div>
    </div>
</div>