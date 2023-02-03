-- Five oldest users of instagram
Select * from ig_clone.users
order by created_at asc limit 5


-- Users who hasn't posted a photo yet
Select username from ig_clone.users
left join ig_clone.photos on photos.user_id=users.id
where photos.user_id is Null


-- Identify the winner of the contest which was held on instagram
Select users.username, photo_id,
count(*) as most_likes
from ig_clone.likes
Inner join users on users.id=likes.user_id
group by photo_id
order by most_likes desc
limit 1;


-- Identify top 5 most commonly used #hashtag
Select tag_name FROM ig_clone.tags
photo_tags natural join tags order by tag_name desc limit 5;


-- How many times does average user posts on Instagram. Also provide total number of photos on Instagram.
Select avg(users.id) as average_user
from ig_clone.photos natural join ig_clone.users

Select count(image_url) as total_photos
from ig_clone.photos
-- comment


-- Provide the data on users who have liked every single photo on instagram
Select user_id from ig_clone.likes
