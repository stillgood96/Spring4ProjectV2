// list
$('#newbd').on('click',function(){
    location.href="/board/write";
});

// view (본문글페이지에서 목록/ 새글쓰기 /추천/ 이전페이지 /다음 페이지 /삭제하기/수정하기

$('#newbd').on('click',function(){ //새글쓰기
    location.href="/board/write";
});
$('#bdfindbtn').on('click',function(){
    let param = '?findtype=' + $('#findtype').val();
    param += '&findkey=' + $('#findkey').val();
    location.href='/board/find/' + param + '&cp=1';
});

$('#before').on('click',function(){});
$('#next').on('click',function(){});

$('#upbdbtn').on('click',function(){
    if (confirm('정말로 이글을 수정하시겠습니까 ?')) {
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val();
        param += "&userid=" + $('#userid').val();
        location.href = '/board/update' + param;
    }
});

$('#rmbdbtn').on('click',function(){
    if (confirm('정말로 이글을 삭제하시겠습니까 ?')) {
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val();
        param += "&userid=" + $('#userid').val();
        //location.href = '/board/delete?bno=' + $('#bno').val();
        location.href = '/board/delete' + param;
    }
});

$('#listbdbtn').on('click',function(){ // 목록으로
    //location.href="/board/list?cp=1" 최신페이지로
    //history.back(); 단순히 뒤로가기
    location.href="/board/list?cp=" + $('#cp').val(); // 뒤페이지

});
$('#thumbbtn').on('click',function(){});

$('#bdcmtbtn').on('click',function(){
    if($('#reply').val()=='') alert('댓글을 작성하세요!!');
    else {
        $('#replyfrm').attr('method','post');
        $('#replyfrm').attr('action','/board/replyok');
        $('#uid').val('리플작성');
        $('#replyfrm').submit();
  }
});

// 새글 쓰기 write
$('#newbdbtn').on('click',function() {
    if ($('#title').val()=='') alert('제목 작성하세요!');
    else if ($('#contents').val()=='') alert('본문 작성하세요!');
    else {
        $('#newbdfrm').attr("method","post");
        $('#newbdfrm').attr("action","/board/write");
        $('#newbdfrm').submit();
    }
});


// update
$('#upbdokbtn').on('click',function(){
    if (confirm('정말로 수정하시겠습니까?')){
        $('#upbdfrm').attr('method','post');
        $('#upbdfrm').attr('action','/board/update');
        $('#upbdfrm').submit();
    }
});




