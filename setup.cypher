CREATE CONSTRAINT user_id FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT movie_id FOR (m:Movie) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT series_id FOR (s:Series) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT actor_id FOR (a:Actor) REQUIRE a.id IS UNIQUE;
CREATE CONSTRAINT director_id FOR (d:Director) REQUIRE d.id IS UNIQUE;
CREATE CONSTRAINT genre_id FOR (g:Genre) REQUIRE g.id IS UNIQUE;

CREATE (:Genre {id: 'G1', name: 'Sci-Fi'}), 
       (:Genre {id: 'G2', name: 'Drama'}), 
       (:Genre {id: 'G3', name: 'Ação'});

CREATE (:Director {id: 'D1', name: 'Christopher Nolan'}), 
       (:Director {id: 'D2', name: 'Vince Gilligan'});

CREATE (:Actor {id: 'A1', name: 'Cillian Murphy'}), 
       (:Actor {id: 'A2', name: 'Bryan Cranston'});

CREATE (:Movie {id: 'M1', title: 'Oppenheimer', year: 2023}),
       (:Movie {id: 'M2', title: 'Inception', year: 2010}),
       (:Movie {id: 'M3', title: 'Interstellar', year: 2014}),
       (:Movie {id: 'M4', title: 'El Camino', year: 2019}),
       (:Movie {id: 'M5', title: 'The Dark Knight', year: 2008});

CREATE (:Series {id: 'S1', title: 'Breaking Bad', seasons: 5}),
       (:Series {id: 'S2', title: 'Better Call Saul', seasons: 6}),
       (:Series {id: 'S3', title: 'Dark', seasons: 3}),
       (:Series {id: 'S4', title: 'Stranger Things', seasons: 4}),
       (:Series {id: 'S5', title: 'The Bear', seasons: 2});

CREATE (:User {id: 'U1', name: 'Alice'}), (:User {id: 'U2', name: 'Bruno'}),
       (:User {id: 'U3', name: 'Carla'}), (:User {id: 'U4', name: 'Diego'}),
       (:User {id: 'U5', name: 'Elena'}), (:User {id: 'U6', name: 'Fábio'}),
       (:User {id: 'U7', name: 'Gisele'}), (:User {id: 'U8', name: 'Hugo'}),
       (:User {id: 'U9', name: 'Íris'}), (:User {id: 'U10', name: 'João'});
