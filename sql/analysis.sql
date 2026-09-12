-- inspection on subscribers table
select * from subscribers limit 5;

select COUNT(subscriber_id) as total_customers
from subscribers;

select plan_type, count(*) as total_subscriber, sum(monthly_price_usd) as monthly_spend
from subscribers 
where signup_date >= (select max(signup_date) - INTERVAL '30' Day as last_30day from subscribers)
group by plan_type
order by monthly_spend desc;

select MIN(signup_date) as StratDate, MAX(signup_date) as EndData, (MAX(signup_date) - MIN(signup_date))/365 as Years
from subscribers;

select distinct primary_device
from subscribers;

select distinct payment_method
from subscribers;

select distinct plan_type
from subscribers;

select is_active, count(*) as count_of_records
from subscribers
group by is_active
order by count_of_records DESC

-- inspection on titles table

select * from titles limit 10;

select COUNT(title_id) as total_titles
from titles;

ALTER TABLE titles
RENAME COLUMN type TO cuntent_type;

select cuntent_type, count(*) as count_of_records
from titles
group by cuntent_type
order by count_of_records DESC

select MIN(date_added) as Strat_date, MAX(date_added) as EndDate, (MAX(date_added) - MIN(date_added))/365 as Years
from titles;

with genre AS (
	select primary_genre, count(*) as count_of_records
	from titles
	group by primary_genre
	order by count_of_records DESC
)
select primary_genre, count_of_records, RANK() OVER(order by count_of_records DESC) as rnk
from genre;

-- inspection on ratings table

select * from ratings;

select min(rating) as minimum_rating, max(rating) as maximum_rating
from ratings;

select DISTINCT(rating), count(rating) over(partition by rating order by rating)
from ratings;

select s.subscriber_id, s.is_active, s.primary_device, r.title_id, r.rating_id
from subscribers s
left JOIN ratings r
on s.subscriber_id = r.subscriber_id
where r.subscriber_id IS NULL;

-- inspection on review table

select * from reviews;

select t.primary_genre, t.language, r.sentiment, count(*)
from titles t
inner join reviews r
on t.title_id = r.title_id
where r.sentiment = 'Positive'
group by t.primary_genre, t.language, r.sentiment
order by count(*) desc
limit 32;

select s.subscriber_id, s.is_active, s.primary_device, r.title_id
from subscribers s
left JOIN reviews r
on s.subscriber_id = r.subscriber_id
where r.subscriber_id IS NULL;

-- inspection on watch_history table

select * from watch_history limit 10;

select distinct device, completed, count(*)
from watch_history
group by device, completed
having completed = 'True'
order by count(*) desc
limit 3;

select avg(completion_pct) from watch_history;

select t.primary_genre,AVG(w.completion_pct), MIN(w.completion_pct), MAX(w.completion_pct)
from titles t
inner join watch_history w
on t.title_id = w.title_id
where w.completion_pct > (
	select avg(completion_pct) as avg_completion_perc
	from watch_history
)
group by t.primary_genre
order by AVG(w.completion_pct) desc, MIN(w.completion_pct) desc, MAX(w.completion_pct) desc;

select w.subscriber_id, t.primary_genre, count(*)
from watch_history w
inner join titles t
on w.title_id = t.title_id
where completed = 'True'
group by subscriber_id, primary_genre
order by count(*) desc, subscriber_id, primary_genre;

-- Top genres by total watch hours
select t.primary_genre, ROUND(SUM(w.watch_duration_min/60.00),2) AS total_watch_hours
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.primary_genre
order by total_watch_hours desc;

-- Top origin countries by watch hours, plus efficiency (hours per title)
select t.country, ROUND(SUM(w.watch_duration_min/60.00),2) AS total_watch_hours, ROUND(SUM(W.watch_duration_min/60.00)/COUNT(DISTINCT t.title_id),2) as hours_per_title
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.country
order by total_watch_hours desc,hours_per_title desc;

-- Engagement by release year (hours per title)
select t.release_year, ROUND(SUM(w.watch_duration_min/60.00)/COUNT(DISTINCT t.title_id),2) as hours_per_title
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.release_year
order by t.release_year;

-- Movies vs TV Shows: share of hours and completion

select t.cuntent_type, ROUND(SUM(w.watch_duration_min/60.00),2) as watch_hours, ROUND(AVG(completion_pct),2) AS completion
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.cuntent_type
order by watch_hours desc;

-- Watch hours by language (rank markets)

select t.language, ROUND(SUM(w.watch_duration_min/60.00),2) as watch_hours
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.language
order by watch_hours desc;

-- Completion rate by genre

select t.primary_genre, ROUND(AVG(w.completion_pct),2) AS completion_rate, count(*) as total_session, SUM(CASE WHEN w.completed = 'True' THEN 1 else 0 END) as completed_sessions
from titles t
inner join watch_history w
on t.title_id = w.title_id
group by t.primary_genre
order by completion_rate desc;

-- Most engaged subscriber segments (by plan)
select s.plan_type, COUNT(DISTINCT s.subscriber_id) as total_subscribers, ROUND(SUM(w.watch_duration_min/60.00)/COUNT(DISTINCT s.subscriber_id),2) as avg_hours_per_subscriber, AVG(w.completion_pct) as avg_completion_prc
from subscribers s
inner join watch_history w
on s.subscriber_id = w.subscriber_id
group by s.plan_type
order by avg_hours_per_subscriber desc;

-- Device usage share

select device, count(*) as total_sessions, ROUND(100 * count(*)/(select count(*) from watch_history),2) AS session_pct
from watch_history
group by device
order by session_pct desc;

-- Churn rate and active rate

select count(*) as total_subscribers, sum(case when is_active = 'True' THEN 1 ELSE 0 END) AS active_subscribers, round(100 * sum(case when is_active = 'True' THEN 1 ELSE 0 END)/count(*),2) as active_prc, round(100 * sum(case when is_active = 'False' THEN 1 ELSE 0 END)/count(*),2) as inactive_prc
from subscribers
order by active_subscribers;

-- Monthly Recurring Revenue (MRR) and ARPU from active subscribers

select sum(monthly_price_usd) as mrr, round(sum(monthly_price_usd)/count(*),2) as arpu
from subscribers
where is_active = 'True';

-- Watchlist conversion rate (saved -> watched)
select * from Watchlist limit 5;

select sum(case when watched = 'True' then 1 else 0 end) as converted, round(100 * sum(case when watched = 'True' then 1 else 0 end)/ count(*),2) as conversion_rate
from watchlist;

-- Content investment efficiency: watch hours per $1,000 of licence cost, by genre

SELECT t.primary_genre,
       ROUND(SUM(t.license_cost_usd) / 1000.0, 0)              AS spend_thousands_usd,
       ROUND(SUM(t.total_watch_hours), 0)                      AS watch_hours,
       ROUND(SUM(t.total_watch_hours)
             / (SUM(t.license_cost_usd) / 1000.0), 3)          AS hours_per_1k_usd
FROM titles t
GROUP BY t.primary_genre
ORDER BY hours_per_1k_usd DESC;