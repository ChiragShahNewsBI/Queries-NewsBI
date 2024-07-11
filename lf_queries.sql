
select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Facebook_Engagements,sum(public_views_cnt) as Facebook_Video_Views, sum(post_comments_cnt) as Facebook_Comments, sum(post_likes_cnt) as Facebook_Likes, sum(post_shares_cnt) as Facebook_Shares
from `i-dss-news-data.news_vw.listenfirst_facebook_content`
group by 1,2,3,4,5,6,7,8
UNION ALL
select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Twitter_Engagements,sum(lf_public_views_cnt) as Twitter_Video_Views, sum(total_replies_cnt) as Twitter_Comments, sum(post_likes_cnt) as Twitter_Likes, sum(total_retweets_cnt) as Twitter_Shares
from `i-dss-news-data.news_vw.listenfirst_twitter_content`
group by 1,2,3,4,5,6,7,8
UNION ALL
select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Tiktok_Engagements,sum(video_views_cnt) as Tiktok_Video_Views, sum(total_post_comments) as Tiktok_Comments, sum(video_likes) as Tiktok_Likes, sum(post_shares_cnt) as Tiktok_Shares
from `i-dss-news-data.news_vw.listenfirst_tiktok_content`
group by 1,2,3,4,5,6,7,8
UNION ALL
select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Instagram_Engagements,sum(video_views_cnt) as Instagram_Video_Views, sum(total_comments_cnt) as Instagram_Comments, sum(total_likes_cnt) as Instagram_Likes, sum(post_impressions_cnt) as Instagram_Impresions
from `i-dss-news-data.news_vw.listenfirst_instagram_content`
group by 1,2,3,4,5,6,7,8
UNION ALL
select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,(sum(coalesce(video_likes_cnt,0)) + sum(coalesce(video_comments_cnt,0)) + sum(coalesce(shares_cnt,0))) as Youtube_Engagements,sum(video_views_cnt) as Youtube_Video_Views, sum(video_comments_cnt) as Youtube_Comments, sum(video_likes_cnt) as Youtube_Likes, sum(shares_cnt) as Youtube_Shares
from `i-dss-news-data.news_vw.listenfirst_youtube_content`
group by 1,2,3,4,5,6,7,8


---------------------------------------------

SELECT 'news_listen_first_brand_facebook_day' AS `Table_Name`,brand_nm,day_dt,(new_posts_cnt) AS New_Posts, (public_video_views_cnt) as Public_VideoViews, total_fans_cnt as Total_Fans, new_fans_cnt as New_Followers, (engagements) as Engagement
FROM `i-dss-news-data.dw_vw.news_listen_first_brand_facebook_day` AS FB
group by 1,2,3,4,5,6,7,8
UNION ALL
SELECT 'news_listen_first_brand_twitter_day' AS `Table_Name`,brand_nm,day_dt,(new_posts_cnt) AS New_Posts, (new_public_video_views_cnt) as Public_VideoViews, total_followers_cnt as Total_Fans, new_followers_cnt as New_Followers, (engagements_cnt) as Engagement
FROM `i-dss-news-data.dw_vw.news_listen_first_brand_twitter_day` AS TW
group by 1,2,3,4,5,6,7,8
UNION ALL
SELECT 'news_listen_first_brand_instagram_day' AS `Table_Name`,brand_nm,day_dt,(new_posts_cnt) AS New_Posts, (video_views_cnt) as Public_VideoViews, total_followers_cnt as Total_Fans, new_followers_cnt as New_Followers, (engagement_score) as Engagement
FROM `i-dss-news-data.dw_vw.news_listen_first_brand_instagram_day` AS INS
group by 1,2,3,4,5,6,7,8
UNION ALL
SELECT 'news_listen_first_brand_tiktok_day' AS `Table_Name`,brand_nm,day_dt,(new_posts_cnt) AS New_Posts, (video_views_cnt) as Public_VideoViews, total_followers_cnt as Total_Fans, new_followers_cnt as New_Followers, (engagements) as Engagement
FROM `i-dss-news-data.dw_vw.news_listen_first_brand_tiktok_day` AS TK
group by 1,2,3,4,5,6,7,8
UNION ALL
SELECT 'news_listen_first_brand_youtube_day' AS `Table_Name`,brand_nm,day_dt,(new_official_videos_cnt) AS New_Posts, (new_official_video_views_cnt) as Public_VideoViews, total_subscribers_cnt as Total_Fans, new_subscribers_cnt as New_Followers, (engagements) as Engagement
FROM `i-dss-news-data.dw_vw.news_listen_first_brand_youtube_day` AS YT
group by 1,2,3,4,5,6,7,8


Revenue = CPM * (Imps / 1000)

11772998



select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Facebook_Engagements,sum(public_views_cnt) as Facebook_Video_Views, sum(post_comments_cnt) as Facebook_Comments, sum(post_likes_cnt) as Facebook_Likes, sum(post_shares_cnt) as Facebook_Shares, sum(organic_post_impressions_cnt) as Organic_Post_Impressions_Count,sum(paid_post_impressions_cnt) as Paid_Post_Impressions_Count
from `i-dss-news-data.news_vw.listenfirst_facebook_content`
where published_dt between '2021-12-27' and '2024-01-28'
and brand_view_nm like 'CBS Evening News%'
group by 1,2,3,4,5,6,7,8

select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Twitter_Engagements,sum(lf_public_views_cnt) as Twitter_Video_Views, sum(total_replies_cnt) as Twitter_Comments, sum(post_likes_cnt) as Twitter_Likes, sum(total_retweets_cnt) as Twitter_Shares, sum(organic_post_impressions_cnt) as Organic_Post_Impressions_Count,sum(paid_post_impressions_cnt) as Paid_Post_Impressions_Count
from `i-dss-news-data.news_vw.listenfirst_twitter_content`
where published_dt between '2021-12-27' and '2024-01-28'
and brand_view_nm like 'CBS Evening News%'
group by 1,2,3,4,5,6,7,8

select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Instagram_Engagements,sum(video_views_cnt) as Instagram_Video_Views, sum(total_comments_cnt) as Instagram_Comments, sum(total_likes_cnt) as Instagram_Likes, sum(organic_post_impressions_cnt) as Organic_Post_Impressions_Count,sum(paid_post_impressions_cnt) as Paid_Post_Impressions_Count
from `i-dss-news-data.news_vw.listenfirst_instagram_content`
where published_dt between '2021-12-27' and '2024-01-28'
and brand_view_nm like 'CBS Evening News%'
group by 1,2,3,4,5,6,7,8

select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,sum(engagements_cnt) as Tiktok_Engagements,sum(video_views_cnt) as Tiktok_Video_Views, sum(total_post_comments) as Tiktok_Comments, sum(video_likes) as Tiktok_Likes,sum(post_shares_cnt) as Tiktok_Post_Shares,sum(paid_impressions_cnt) as Paid_Post_Impressions_Count
from `i-dss-news-data.news_vw.listenfirst_tiktok_content`
where published_dt between '2021-12-27' and '2024-01-28'
and brand_view_nm like 'CBS Evening News%'
group by 1,2,3,4,5,6,7,8

select  content_id,content_text,content_type_cd, brand_view_nm as Brand,published_dt,published_dt_ut,text_link,channel_nm,(sum(coalesce(video_likes_cnt,0)) + sum(coalesce(video_comments_cnt,0)) + sum(coalesce(shares_cnt,0))) as Youtube_Engagements,sum(video_views_cnt) as Youtube_Video_Views, sum(video_comments_cnt) as Youtube_Comments, sum(video_likes_cnt) as Youtube_Likes, sum(shares_cnt) as Youtube_Shares
from `i-dss-news-data.news_vw.listenfirst_youtube_content`
where published_dt between '2021-12-27' and '2024-01-28'
and brand_view_nm like 'CBS Evening News%'
group by 1,2,3,4,5,6,7,8