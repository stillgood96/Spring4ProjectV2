<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://www.google.com/recaptcha/api.js"></script>
<div id="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-people-fill"></i> 회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-success disabled btn-sm">이용약관</button>
        </li>
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-success disabled btn-sm">실명확인</button></li>
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-success disabled btn-sm">정보입력</button></li>
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-light disabled btn-sm">가입완료</button></li>
    </ul>

    <div class="margin100">
        <h2>회원정보 입력력</h2>
        <small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small>
        <hr>
    </div><!--제목-->

    <div class="card card-body bg-light margin1050">
        <h3 class="font-weight-bold">일반회원</h3>
        <form name="joinfrm" id="joinfrm">
            <div class="row">

                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label class="col-form-label  col-2 text-danger text-right" for="name">이름</label>
                        <input type="text" class="form-control col-2 border-danger" id="name" name="name" readonly value="${param.name}">
                    </div><!--이름-->

                    <div class="form-group row">
                        <label class=" col-form-label  col-2 text-danger text-right" for="jumin1">주민번호</label>
                        <input type="text" class="form-control col-2 border-danger" id="jumin1" name="jumin1" readonly value="${param.jumin1}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" class="form-control col-2 border-danger" id="jumin2" name="jumin2" readonly value="${param.jumin2}">
                    </div><!--주민번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="newuid">아이디</label>
                        <input type="text" class="form-control col-2 border-danger" id="newuid" name="userid" value="${mvo.userid}">
                        <span id="uidmsg" class="col-form-label text-danger">&nbsp;&nbsp;7~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
                    </div><!--아이디-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right " for="newpwd">비밀번호</label>
                        <input type="password" class="form-control col-2 border-danger" id="newpwd" name="passwd" >
                        <span class="col-form-label text-danger">&nbsp;&nbsp;7~16자의 영문 대소문자,숫자 및 특수문자 사용할 수 있습니다.</span>
                    </div><!--비밀번번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="repwd">비밀번호확인</label>
                        <input type="password" class="form-control col-2 border-danger" id="repwd" name="repwd" >
                        <span class="col-form-label text-danger">&nbsp;&nbsp;이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.</span>
                    </div><!--비밀번호확인-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="zip1">우편번호</label>
                        <input type="text" class="form-control col-1 border-danger" id="zip1" name="zip1" readonly value="${fn:split(mvo.zipcode,'-')[0]}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" class="form-control col-1 border-danger" id="zip2" name="zip2" readonly value="${fn:split(mvo.zipcode,'-')[1]}">
                        <span>
                            &nbsp;&nbsp;<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#zipmodal">
                            <i class="bi bi-question-circle">우편번호 찾기</i></button>
                        </span>
                    </div><!--우편번호-->

                    <div class="form-group row">
                        <label class=" col-form-label  col-2 text-danger text-right" for="addr1">주소</label>
                        <input type="text" class="form-control col-3 border-danger" id="addr1" name="addr1" readonly value="${mvo.addr1}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" class="form-control col-3 border-danger" id="addr2" name="addr2" >
                    </div><!--주소-->

                    <div class="form-group row">
                        <label class=" col-form-label  col-2 text-danger text-right" for="email1">이메일</label>

                        <input type="text" class="form-control col-2 border-danger igborder" id="email1" name="email1" value="${fn:split(mvo.email,'@')[0]}">
                        <div class="input-group-append">
                            <span class="input-group-text igborder ">@</span>
                        </div>
                        <input type="text" class="form-control col-2 border-danger igborder" id="email2" name="email2"  readonly value="${fn:split(mvo.email,'@')[1]}">&nbsp;&nbsp;

                        <select id="email3" class="form-control col-2 border-danger">
                            <option>선택하세요</option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>hotmail.com</option>
                            <option>직접입력하기</option>
                        </select>
                    </div><!--이메일-->

                    <div class="form-group row">
                        <label class=" col-form-label  col-2 text-danger text-right" for="hp1">개인 연락처</label>
                        <select id="hp1"  name="hp1" class="form-control  border-danger" style="width: 85px;">
                            <option>국번</option>
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>019</option>
                        </select>

                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" class="form-control col-1 border-danger" id="hp2" name="hp2" value="${fn:split(mvo.phone,'-')[1]}">

                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" class="form-control col-1 border-danger" id="hp3" name="hp3" value="${fn:split(mvo.phone,'-')[2]}">
                    </div><!--전화번호-->

                    <div class="form-group row">
                        <label class=" col-form-label  col-2 text-danger text-right" >자동가입방지</label>
                        <div class="g-recaptcha" data-sitekey="6LfE1joaAAAAAOXu6tXDltDl0o7cTFICeotZwcWO"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                        <span style="color:#ff0000">${checkCaptcha}</span>
                    </div><!--자동가입방지-->



                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" class="btn btn-primary" id="joinbtn"><i class="bi bi-check">입력완료</i></button>
                    <button type="button" class="btn btn-danger" id="cancelbtn"><i class="bi bi-x">취소하기</i></button>
                </div>
            </div><!--버튼들 -->

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="zipcode" id="zipcode">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="phone" id="phone">
        </form>
    </div><!-- 카드정보입력-->

</div><!-- main -->

<!-- 우편번호 찾기 모달-->
<div class="modal fade" id="zipmodal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">우편번호 찾기</h3>
                <button type="button" id="modalx"
                        class="close">&times;</button>
            </div>

            <div class="modal-body">
                <form id="zipfrm">
                    <div class="form-group row margin25">
                        <div class="col-1"></div>
                        <label for="dong"
                               class="col-form-label col-4 text-right text-danger ">
                            검색하실 주소의<br>동 이름을 입력하세요
                        </label>
                        <input type="text" id="dong" name="dong"
                               class="form-control col-3 border-danger">
                        <span class="col-3">
                            <button type="button" id="findbtn"
                                    class="btn btn-primary"><i class="bi bi-search"></i>검색하기</button>
                        </span>
                        <div class="col-1"></div>
                    </div>
                    <hr>
                    <div class="form-group row justify-content-center">
                        <span class="text-center text-primary">지역의 읍/면/동의 이름을 공백없이 입력하신 후 [검색하기]버튼을 클릭하세요</span>
                        <select id="addrlist" name="addrlist"
                                class="form-control text-left col-8 margin25" size="10">
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="modal-footer justify-content-end">
                <button type="button"
                        class="btn btn-danger" id="sendbtn">
                    <i class="bi bi-check2-circle"></i>&nbsp;&nbsp;선택하고 닫기</button>
            </div>

        </div>
    </div>

</div>