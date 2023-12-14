
Q)1 who is the senior most employee based on job title

select title,first_name,last_name 
from employee
order by levels desc
limit 1

Q)2 which countries have the most invoices

select count(*) as c,billing_country
from invoice
group by billing_country
order by c desc 



Q3) what are top three values total invoice

SELECT total 
FROM invoice
ORDER BY total DESC

Q4) which city has the best customers ? we whould like throw a promotional music festival in the city
we made the most money wriet a query that returns one city that has the highest sum of invoice total
returns the both city name and sum of all invoice

SELECT billing_city,SUM(total) AS InvoiceTotal
FROM invoice
GROUP BY billing_city
ORDER BY InvoiceTotal DESC

Q5) who is the best customer? the customer who has spant the most money will be declard the
customer write the query that return the person who has spend the most money

select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as total
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1




Q1) write a query to writen email,first_name,last_name,& genre of all rock musice listeners
writen your list ordered alphabectally by email starting with A


select distinct email,first_name,last_name
from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id

where track_id in(
select track_id from track
	join genre on track.genre_id=genre.genre_id
	where genre.name like 'Rock'	
)
order by email

Q2)lets invite the artist who has written the most rock music in our dataset. write a query
that returns the artist name and total count of the top 10 rock bands

select artist.artist_id,artist.name,count(artist.artist_id) as number_of_songs
from track
join album on  album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

Q3)return all the track names that have a song length longer than the average song length
return the name and millisecounds for each track.order by the song length with the logest
songs listed first

select name,milliseconds 
from track
where milliseconds >(
            select avg(milliseconds) as avg_of_length
	        from track)
order by milliseconds desc
	






