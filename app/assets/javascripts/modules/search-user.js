$(function(){
  function searchUser(user) {
    let html =`
              <div class="User clearfix">
              <i class="fas fa-search"></i><a href="/users/${user.id}" class="User__search User__btn" data-user-id="${user.id}" data-hashtag-name="${user.name}">${user.name}</a>
              </div>
                `;
    $("#search-result-user").append(html);
  }
  function searchNoUser(){
    let html =`
              <div class="User clearfix">
                <p class="User__name">No search results</p>
              </div>
              `;
    $("#search-result-user").append(html);
  }

  $(".search-form-user").on ("keyup",function(){
    let input =$(".search-form-user").val();
    $.ajax({
      type: "GET",
      url:"/users",
      data:{keyword: input},
      dataType: "json"
    })
    .done(function(users){
      $("#search-result-user").empty();
      if(users.length !==0){
        users.forEach(function(user){
          searchUser(user);
        });
      } else if(input.length ==0){
        return false;
      } else{
        searchNoUser();
      }
    })
    .fail(function(){
      alert("Errors")
    });
  });
});
