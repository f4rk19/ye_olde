$(function(){
  $(".about-me-tag").on("click",function(){
    $(".about-me__show").addClass("is-show");
  });
  $(".return-btn").click(function(){
    $(".about-me__show").removeClass('is-show')
  })
});

$(function(){
  let tabs =$(".menu-item");

  function tabSwitch(){
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index =tabs.index(this);
    $(".content").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
});