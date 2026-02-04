// Diretores
MATCH (d:Director {id: 'D1'}), (m1:Movie {id: 'M1'}) MERGE (d)-[:DIRECTED]->(m1);
MATCH (d:Director {id: 'D1'}), (m2:Movie {id: 'M2'}) MERGE (d)-[:DIRECTED]->(m2);
MATCH (d:Director {id: 'D2'}), (s1:Series {id: 'S1'}) MERGE (d)-[:DIRECTED]->(s1);
MATCH (d:Director {id: 'D2'}), (m4:Movie {id: 'M4'}) MERGE (d)-[:DIRECTED]->(m4);

// Atores
MATCH (a:Actor {id: 'A1'}), (m1:Movie {id: 'M1'}) MERGE (a)-[:ACTED_IN]->(m1);
MATCH (a:Actor {id: 'A1'}), (m2:Movie {id: 'M2'}) MERGE (a)-[:ACTED_IN]->(m2);
MATCH (a:Actor {id: 'A2'}), (s1:Series {id: 'S1'}) MERGE (a)-[:ACTED_IN]->(s1);

// Gêneros
MATCH (m1:Movie {id: 'M1'}), (g2:Genre {id: 'G2'}) MERGE (m1)-[:IN_GENRE]->(g2);
MATCH (m2:Movie {id: 'M2'}), (g1:Genre {id: 'G1'}) MERGE (m2)-[:IN_GENRE]->(g1);
MATCH (m3:Movie {id: 'M3'}), (g1:Genre {id: 'G1'}) MERGE (m3)-[:IN_GENRE]->(g1);
MATCH (s1:Series {id: 'S1'}), (g2:Genre {id: 'G2'}) MERGE (s1)-[:IN_GENRE]->(g2);
MATCH (s3:Series {id: 'S3'}), (g1:Genre {id: 'G1'}) MERGE (s3)-[:IN_GENRE]->(g1);

// Usuários (Visualizações e Ratings)
MATCH (u:User {id: 'U1'}), (m:Movie {id: 'M1'}) MERGE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {id: 'U2'}), (s:Series {id: 'S1'}) MERGE (u)-[:WATCHED {rating: 4.8}]->(s);
MATCH (u:User {id: 'U3'}), (m:Movie {id: 'M2'}) MERGE (u)-[:WATCHED {rating: 3.5}]->(m);
MATCH (u:User {id: 'U4'}), (s:Series {id: 'S2'}) MERGE (u)-[:WATCHED {rating: 4.2}]->(s);
MATCH (u:User {id: 'U5'}), (m:Movie {id: 'M3'}) MERGE (u)-[:WATCHED {rating: 5.0}]->(m);
MATCH (u:User {id: 'U6'}), (s:Series {id: 'S3'}) MERGE (u)-[:WATCHED {rating: 4.0}]->(s);
MATCH (u:User {id: 'U7'}), (m:Movie {id: 'M4'}) MERGE (u)-[:WATCHED {rating: 4.5}]->(m);
MATCH (u:User {id: 'U8'}), (s:Series {id: 'S4'}) MERGE (u)-[:WATCHED {rating: 3.8}]->(s);
MATCH (u:User {id: 'U9'}), (m:Movie {id: 'M5'}) MERGE (u)-[:WATCHED {rating: 4.9}]->(m);
MATCH (u:User {id: 'U10'}), (s:Series {id: 'S5'}) MERGE (u)-[:WATCHED {rating: 4.1}]->(s);
