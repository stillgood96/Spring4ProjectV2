// list
$('#newbd').on('click',function(){
    location.href="/board/write";
});

// view


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



