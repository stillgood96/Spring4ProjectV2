<%@ page pageEncoding="utf-8" %>


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
                    <button type="button" class="btn btn-light id=listbdbtn"><i class="bi bi-card-list bidragup"> 목록</i></button>
                </div>
            </div><!--버튼들 -->
            <div class="row margin1050">
                <table class="table">
                    <tr class="tblines2 tbbg1 "><th colspan="2" class="text-center "><h2>어빙 정말 대단하네요 미르쓰띠~~</h2></th></tr> <!-- 제목 -->
                    <tr class="tbbg2 font-weight-bold"><td>imlsw96</td><td class="text-right">2021.01.25 11.18 / 45 / 256</td></tr> <!-- 작성자, 작성일, 조회수 -->
                    <tr class="tbbg3 tblines2"><td colspan="2">

                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae odio nulla. Praesent lacus dolor, <br>lobortis vel nisl nec, volutpat dapibus odio. Duis auctor, sem in fringilla ullamcorper, <br>elit libero pellentesque elit, sit amet tincidunt sem quam id purus. Integer interdum erat nisl,<br> ut finibus odio malesuada nec. Class aptent taciti sociosqu ad litora torquent per conubia nostra, <br>per inceptos himenaeos. Proin maximus nunc eu est semper rutrum at eleifend magna. Mauris fringilla iaculis laoreet. Curabitur pharetra, <br>odio tempus aliquam varius, eros eros ultricies arcu, ac tincidunt urna arcu ut elit. In varius, <br>dui a consequat pulvinar, nunc sapien placerat urna, ac consequat erat risus vitae purus. In mollis urna sit amet quam rhoncus pharetra.

                        Donec condimentum sed mi nec ultrices. Nullam porttitor lacinia nibh et tristique. Fusce at lacus elit. Maecenas et urna egestas, varius metus ac, pretium ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris at condimentum sapien, sed sagittis dui. Vestibulum ac lectus id lectus lobortis egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam egestas et est a sodales. Maecenas mattis elit mollis, pellentesque massa id, vestibulum est. Fusce laoreet porttitor odio, vel bibendum lorem vulputate sed. Nulla facilisi.

                        Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse tristique purus ut sem egestas tristique. Integer viverra ligula sapien, eget dignissim eros rutrum at. In condimentum lacus turpis, nec suscipit nisl commodo et. Integer egestas nec dui vitae malesuada. Suspendisse potenti. Praesent molestie risus id ornare consectetur. Ut eu justo efficitur, euismod neque sed, rhoncus orci. Ut quam mi, bibendum tempor euismod a, posuere et lacus. Cras ultricies, ex nec laoreet viverra, dui mi tempor nulla, eget tristique lacus sapien ut eros.</td></tr> <!-- 본문 -->
                </table>
            </div><!--본문글 -->


            <div class="row margin1050">
                    <div class="col-6">
                        <button type="button" id="updbtn" class="btn btn-warning"><i class="bi bi-pencil-square bidragup"></i>수정하기 </button>
                        <button type="button" id="rmdbtn" class="btn btn-danger"><i class="bi bi-trash-fill bidragup"></i>삭제하기 </button>
                    </div>
                    <div class="col-6 text-right">
                        <button type="button" class="btn btn-light id=listbdbtn"><i class="bi bi-card-list bidragup">목록으로</i></button>
                    </div>
                    </div><!--버튼들 -->
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

