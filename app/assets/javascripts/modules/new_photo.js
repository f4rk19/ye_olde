// $(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(image){
      var html =
      `
        <img src="${image}", alt="post" class="post-image">
      `
      return html;
    }
    $(document).on('change','.photo-box__image__file', function(){
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
        var image = this.result;
        var html = buildHTML(image)
        $('.photo-box__image').prepend(html);
        $('p').remove();
      }
    });
  });
// });