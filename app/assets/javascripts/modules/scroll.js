$(document).on("turbolinks:load",function(){
  if($("nav.pagination a[rel=next}").length){
    $(".main__photos").infiniteScroll({
      path:"nav.pagination a[rel=next]",
      append:".main",
      elementScroll: true,
      history: true,
      prefill: false,
      status:'.page-load-status',
      hideNav:".pagination"
    });
  }
});