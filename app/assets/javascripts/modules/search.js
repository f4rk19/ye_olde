$(function(){
  function searchHashtag(hashtag) {
    let html =`
              <div class="Hashtag clearfix">
              <i class="fas fa-search"></i><a href="/hashtags/${hashtag.hashname}" class="Hashtag__search Hashtag__btn" data-hashtag-id="${hashtag.id}" data-hashtag-hashname="${hashtag.hashname}">${hashtag.hashname}</a>
              </div>
                `;
    $("#search-result").append(html);
  }
  function searchNoHashtag(){
    let html =`
              <div class="Hashtag clearfix">
                <p class="Hashtag__name">No search results</p>
              </div>
              `;
    $("#search-result").append(html);
  }

  $(".search-form__text").on ("keyup",function(){
    let input =$(".search-form__text").val();
    $.ajax({
      type: "GET",
      url:"/hashtags",
      data:{keyword: input},
      dataType: "json"
    })
    .done(function(hashtags){
      $("#search-result").empty();
      if(hashtags.length !==0){
        hashtags.forEach(function(hashtag){
          searchHashtag(hashtag);
        });
      } else if(input.length ==0){
        return false;
      } else{
        searchNoHashtag();
      }
    })
    .fail(function(){
      alert("Errors")
    });
  });
});
