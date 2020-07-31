// $(function(){

//   $(".main__search-bookmark").on ("",function(){
//     let input =$(".search-form__bookmark").val();
//     $.ajax({
//       type: "GET",
//       url:"/hashtags",
//       data:{keyword: input},
//       dataType: "json"
//     })
//     .done(function(hashtags){
//       $("#search-result").empty();
//       if(hashtags.length !==0){
//         hashtags.forEach(function(hashtag){
//           searchHashtag(hashtag);
//         });
//       } else if(input.length ==0){
//         return false;
//       } else{
//         searchNoHashtag();
//       }
//     })
//     .fail(function(){
//       alert("Errors")
//     });
//   });
// });
