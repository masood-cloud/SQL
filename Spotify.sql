use SuperStoreOrders

Select * from Songs

#Identify the most popular artists and songs based on the popularity column

select artist, song, popularity
from Songs
where artist != 'NULL'
order by popularity desc

#Analyze the audio features such as danceability, energy, loudness, speechiness, etc

SELECT AVG(danceability) AS avg_danceability, AVG(energy) AS avg_energy, AVG(loudness) AS avg_loudness
FROM Songs;

#Explore the distribution of songs across different years using the year column.

select year, COUNT(*) as songs_count
from Songs
group by year
order by year

#Examine the distribution of songs across different genres. 

Select genre, COUNT(*) as songs_count
from Songs
Group by genre
order by songs_count desc

#Investigate the presence of explicit content using the explicit column.

SELECT explicit, COUNT(*) AS song_count
FROM Songs
GROUP BY explicit;


#Track Count by year and Genre

SELECT year, genre, COUNT(*) AS track_count
from Songs
group by year, genre
order by track_count desc

#Average Tempo by year

Select year, AVG(tempo) as avg_tempo
from Songs
group by year
order by year

#Top Genres by Popularity

Select genre, AVG(popularity) as avg_popularity
from Songs	
Group by genre
order by avg_popularity desc

#Songs Duration Distribution

Select genre, MIN(duration_ms) as min_duration, MAX(duration_ms) as max_duration,
AVG(duration_ms) as avg_duration
from Songs
Group by genre

#Percentage of Explicit Songs by Genre

SELECT genre, COUNT(*) AS total_songs, SUM(explicit) AS explicit_songs,
       ROUND((SUM(explicit) * 100.0) / COUNT(*), 2) AS explicit_percentage
FROM Songs
GROUP BY genre
ORDER BY explicit_percentage DESC;
