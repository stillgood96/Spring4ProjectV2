<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  <!-- 문자를 다루기위함-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- 숫자를 다루기위함 -->

<%--
        // 게시판 네비게이션
        // 현재 페이지에 따라 보여줄 페이지 블록을 결정
        // ex) 총 페이지수가 pages가 27일때
        // cp = 1 : 1 2 3 4 5 6 7 8 9 10
        // cp = 3 : 1 2 3 4 5 6 7 8 9 10
        // cp = 9 : 1 2 3 4 5 6 7 8 9 10
        // cp = 11 : 11 12 13 14 15 16 17 18 19 20
        // cp = 17 : 11 12 13 14 15 16 17 18 19 20
        // cp = 23 : 21 22 23 24 25 26 27
        startPage = floor( (cp - 1) / 10) * 10 + 1
        endPage = startPage + 9
--%>

<fmt:parseNumber var="cp" value="${param.cp}" />

<fmt:parseNumber var="pp" value="10" />
<fmt:parseNumber var="bdcnt" value="${bdcnt}" />

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp - 1) / pp)}"/>
<fmt:parseNumber var="sp" value="${sp * 10 +1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${bdcnt / pp}" integerOnly="true"/>
<c:if test="${(bdcnt % pp) >0}">
    <fmt:parseNumber var="tp" value="${tp+1}" />
</c:if>


<div id="main">
        <div class="margin30">
            <h3><i class="bi bi-chat-dots-fill bidragup"></i>자유 게시판</h3>
            <hr>
        </div>

        <div class="row margin1050">
            <div class="col-12 text-right ">
                <c:if test="${not empty UID}">
                 <button type="button" id="newbd"
                        class="btn btn-info" ><i class="bi bi-plus-circle bidragup">  </i>새글쓰기</button>
                </c:if>
            </div>
        </div>
        <div class="row margin1050 mt-3">
            <div class="col-12">
                <table class="table table-striped tblines text-center table-hover" style="">
                    <thead class="" style="background: #dff0d8">
                    <tr class="">
                        <th style="width: 7%;">번호</th>
                        <th class="text-left">제목</th>
                        <th style="width: 12%;">작성자</th>
                        <th style="width: 10%;">작성일</th>
                        <th style="width: 7%;">추천</th>
                        <th style="width: 7%;">조회</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th class="text-danger">공지</th>
                        <th><span class="badge badge-danger bidragup">hot</span>
                            날마다 오는 어빙신이 아니라네~</th>
                        <th>운영자</th>
                        <th>2021.01.13</th>
                        <th>10</th>
                        <th>1238</th>
                    </tr>
                    <c:forEach var="b" items="${bds}">
                        <tr><!-- 유저작성글 -->
                            <td>${b.bno}</td>
                            <td><a href="/board/view?bno=${b.bno}&cp=${cp}">${b.title}</a></td>
                            <td>${b.userid}</td>
                            <td>${fn:substring(b.regdate,0,10)}</td>
                            <td>${b.thumbs}</td>
                            <td>${b.views}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div><!-- 게시판테이블-->



        <div class="row">
            <div class="col-12 ">
                <ul class="pagination justify-content-center">
                    <%--'이전'이 표시되어 할때는 cp >10--%>

                    <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                        <a href="/board/list?cp=${sp-10}" class="page-link">이전</a></li>

                        <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                            <c:if test="${i le tp}">
                                <c:if  test = "${i ne cp}">
                                    <li class="page-item"><a href="/board/list?cp=${i}" class="page-link font-weight-bold">${i}</a></li>
                                </c:if>

                                <c:if  test="${i eq cp}">
                                    <li class="page-item active"><a href="/board/list?cp=${i}" class="page-link font-weight-bold">${i}</a></li>
                                </c:if>
                            </c:if>
                        </c:forEach>

                        <%--'다음'이 표시되어 할때는 ??--%>
                    <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>"><a href="/board/list?cp=${sp+10}" class="page-link">다음</a></li>
                </ul>
            </div>
        </div><!-- 페이지네이션-->

    </div><!-- main -->





