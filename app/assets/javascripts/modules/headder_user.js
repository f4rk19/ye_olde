$(function(){
  $(".header__drop-menu").click(function(){
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      $(".drop-down").addClass('close');
      $(".header__drop-menu, body").removeClass('open');
    }else{
      $(this).addClass('active');
      $(".drop-down").removeClass('close');
      $(".header__drop-menu, body").addClass('open');
    }
  });
});