-- Query all of the entries in the Genre table
SELECT genreid, label
FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist
values (null, "Frank Solivan and Dirty Kitchen", 2012)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
SELECT null, "Frank Solivan and Dirty Kitchen", 2012, 5819, "Fiddlemon Music", artist.artistid, genre.genreid
FROM Artist, Genre
WHERE artist.artistname = "Frank Solivan and Dirty Kitchen"
AND genre.label = "Bluegrass"

INSERT into Album
SELECT null, "On the Edge", 2013, 5819, "Compass Records", artist.artistid, genre.genreid
FROM Artist, Genre
WHERE artist.artistname = "Frank Solivan and Dirty Kitchen"
AND genre.label = "Bluegrass"

INSERT into Album
SELECT null, "Cold Spell", 2014, 5819, "Compass Records", artist.artistid, genre.genreid
FROM Artist, Genre
WHERE artist.artistname = "Frank Solivan and Dirty Kitchen"
AND genre.label = "Bluegrass"


-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
SELECT null, "Driftin' Apart", 342, 2012, genre.genreid, artist.artistid, album.albumid
FROM genre, artist, album
WHERE genre.label = "Bluegrass"
AND artist.artistname = "Frank Solivan and Dirty Kitchen"
AND album.title = "Frank Solivan and Dirty Kitchen"

INSERT into Song
SELECT null, "M80", 342, 2012, genre.genreid, artist.artistid, album.albumid
FROM genre, artist, album
WHERE genre.label = "Bluegrass"
AND artist.artistname = "Frank Solivan and Dirty Kitchen"
AND album.title = "On the Edge"

INSERT into Song
SELECT null, "She Said She Will", 342, 2012, genre.genreid, artist.artistid, album.albumid
FROM genre, artist, album
WHERE genre.label = "Bluegrass"
AND artist.artistname = "Frank Solivan and Dirty Kitchen"
AND album.title = "Cold Spell"


-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT song.title, album.title, artist.artistname
FROM Song
LEFT JOIN album ON song.albumid = album.albumid
LEFT JOIN artist ON song.artistid = artist.artistid
WHERE artist.artistname = "Frank Solivan and Dirty Kitchen"

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as '# of songs', album.title
FROM Song
JOIN album on song.albumid = album.albumid
JOIN artist on song.artistid = artist.artistid
WHERE artist.artistname = "Frank Solivan and Dirty Kitchen"
group by song.albumid
order by album.title

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as '# of songs', artist.artistname
FROM Song
JOIN Artist on song.artistid = artist.artistid
group by song.artistid
order by artist.artistname

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as '# of songs', genre.label
FROM Song
JOIN genre on song.genreid = genre.genreid
group by song.artistid
order by genre.label

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT max(album.albumlength), album.title
FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT max(song.songlength), song.title
FROM song

-- Modify the previous query to also display the title of the album.
SELECT max(song.songlength), song.title, album.title
FROM song
JOIN album ON song.albumid = album.albumid
