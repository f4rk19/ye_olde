$(function(){
  function buildHTML(comment){
    let html = `
              <div class="comment-box">
                <div class="comment-info">
                  <a href="/users/${comment.user_id}">
                    <div class="comment-user">
                      ${comment.user_name}
                    </div>
                  </a>
                  <div class="comment-date">
                    ${comment.created_at}
                  </div>
                  <div class="comment-delete">
                    <a href="/photos/${comment.photo_id}/comments/${comment.id}" data-method="Delete">Delete</a>
                  </div>
                </div>
                <div class="comment-text">
                  ${comment.text}
                </div>
              </div>
               `
    return html;
  }
  $('.input-comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments-show').append(html);
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
      $('.textbox').val('');
      $('.submitbtn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  });
});