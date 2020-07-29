$(function(){
  $(".drop-btn").click(function(){
  $(".header__drop-menu").addClass('open')
  });
  $(".back-btn").click(function(){
    $(".header__drop-menu").removeClass('open')
  });
});