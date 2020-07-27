// $(function(){
//   function userSignin(data){
//     let html=`
//               <div class="main">
//                 <div class="main__photos">
//                   <h2>Photo detail</h2>
//                   <div class="photo-frame">
//                     <div class="photo-frame__photo-info">
//                       <div class="user-name">
//                         User name :
//                           <a href="/users/${data.user_id}">${data.user_name}
//                           </a>
//                       </div>
//                       <div class="created-at">
//                         ${data.created_at}
//                       </div>
//                       <ul class="photo-edit">
//                         <li class="edit-form">
//                           <a href="/photos/${data.id}/edit"><i class="fas fa-edit"></i>
//                           Edit
//                           </a>
//                         </li>
//                         <li class="delete-btn">
//                           <a rel="nofollow" data-method="delete" href="/photos/${data.id}"><i class="fas fa-trash-alt"></i>
//                           Delete
//                           </a>
//                         </li>
//                       </ul>
//                       <div class="detail-form">
//                         <img class="photo-frame__image" src="${data.image}">
//                         <div class="photo-frame__content">
//                         <p>${data.content}</p>
//                         </div>
//                       </div>
//                     </div>
//                   </div>
//                 </div>
//                 <div class="main__comments">
//                   <form class="input-comment" action="/photos/${data.id}/comments" accept-charset="UTF-8" method="post">
//                     <input type="hidden" name="authenticity_token" value="SoiH+7elRRNgV4WgAOtmUz3YlpGLHNlKSzOUtcR8ikV7bTtatsb62HtqUD8y/El8Q2EPIN4QoJXmXDVWSQY4Yw==">
//                     <textarea placeholder="Write a comment..." rows="2" class="textbox" name="comment[text]" id="comment_text"></textarea>
//                     <input type="submit" name="commit" value="Post" class="submitbtn" data-disable-with="Post">
//                   </form>
//                   <div class="comments-show">
//                     <h4>Comment field</h4>
//                   </div>
//                 </div>
//               </div>
//              `
//       return html;
//   }
//   $(".image-box-image").on('click',function(e){
//     e.preventDefault();
//     var $photoId = $(this).data('id');
//     $.ajax({
//       type: 'GET',
//       url: '/photos/' + $photoId,
//       data: {id: $photoId },
//       dataType: 'jason'
//     })
//     .done(function(data){
//       let html = userSignin(data);
//         $('.main').append(html);
//     })
//     .fail(function(){
//       alert("error")
//     });
//   });
// });