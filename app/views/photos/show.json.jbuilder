json.id @photo.id
json.user_id @photo.user_id
json.created_at @photo.created_at,strftime("%Y/%m/%d %H:%M")
json.content @photo.content
json.image @photo.image_url
json.user_name @photo.user.name
json.text @comment.text
json.comment_user_name @comment.user.name
json.comment_user_id @comment.user.id
json.comment_created_at @comment.created_at.strftime("%Y/%m/%d %h:%M")