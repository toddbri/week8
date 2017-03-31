
-- 1.    What are tracks for a given album?

      select * from album left outer join track on album.id = track.album join song on track.song = song.id where album.name = 'houses of the holy'


-- 2.    What are the albums produced by a given artist?

      select * from artist join album on artist.id = album.artist where artist.name = 'b.b. king'

-- 3.    What is the track with the longest duration?

      select * from track join song on track.song = song.id order by length desc limit 1

-- 4.    What are the albums released in the 60s? 70s? 80s? 90s?

      select * from album where released >=1960 and released < 1970 order by released

-- 5.    How many albums did a given artist produce in the 90s?

      select * from artist join album on artist.id = album.artist where album.released between 1990 and 2000 and artist.name = 'ice cube'

-- 6.    What year is each artist's latest album?

      select artist.name , max(released) from artist join album on artist.id = album.artist group by artist.id

-- 7.    What is the title of each artist's latest album?

        option 1) select * from artist join album on artist.id = album.artist where released = (select max(released) from album where album.artist = artist.id);


        option 2) select distinct on (artist.id) * from artist join album on artist.id = album.artist order by artist.id, released desc;

-- 8.    List all albums along with its total duration based on summing the duration of its tracks.

        select album.name, sum(length) from album join track on album.id = track.album join artist on album.artist = artist.id group by album.id order by sum(length) desc


-- 9.    What is the album with the longest duration?

          select album.name, sum(length) from album join track on album.id = track.album group by album.id order by sum(length) desc limit 1;

-- 10.   Who are the 5 most prolific artists based on the number of albums they have recorded?

          select artist.name, count(album.id) from artist join album on artist.id = album.artist group by artist.id order by count(album.id) desc limit 5

-- 11.   What are all the tracks a given artist has recorded?

          select artist.name, song.name from track join song on track.song = song.id join artist on song.writer = artist.id where artist.name = 'steely dan';

-- 12.   What are the top 5 most often recorded songs?

        select song.name, count(track.id) from song join track on song.id = track.song group by song.id order by count(track.id) desc limit 5

-- 13.   Who are the top 5 song writers whose songs have been most often recorded?

        select song.name, count(track.id) from song join track on song.id = track.song group by song.id order by count(track.id) desc limit 5

-- 14.   Who is the most prolific song writer based on the number of songs he has written?

          select artist.name, count(song.id) from song join artist on song.writer = artist.id group by artist.id order by count(song.id) desc limit 1

-- 15.   What songs has a given artist recorded?

         select artist.name, song.name from track join song on track.song = song.id join artist on song.writer = artist.id where artist.name = 'steely dan';

-- 16.   Who are the song writers whose songs a given artist has recorded?

          select * from artist join song on artist.id = song.writer join track on song.id = track.song join album on track.album = album.id where artist.name ='red hot chili peppers'

-- 17.   Who are the artists who have recorded a given song writer's songs?

          select performers.id, performers.name performer, writers.id, writers.name writer from artist as writers join song on writers.id = song.writer join track on song.id = track.song join album on track.album = album.id join artist as performers on album.artist = performers.id where performers.name = 'red hot chili peppers'
