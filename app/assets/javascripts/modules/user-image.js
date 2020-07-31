$(function(){
  function buildHTML(image){
    var html =
    `
      <img src="${image}", alt="user-image" class="user-image">
    `
    return html;
  }
  $(document).on('change','.photo-box__user-image__file', function(){
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(){
      var image = this.result;
      var html = buildHTML(image)
      $('.photo-box__user-image').prepend(html);
      $('p').remove();
      $('.image-icon').remove();
    }
  });
});