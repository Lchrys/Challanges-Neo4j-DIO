// 1. FILTRAGEM COLABORATIVA (User-User Similarity)
// Lógica: "Pessoas que ouvem o que você ouve, também curtem isso."
MATCH (u1:User {id: "U1"})-[:LISTENED|LIKED]->(s:Song)<-[:LISTENED|LIKED]-(u2:User)
WHERE u1 <> u2
MATCH (u2)-[voto:LIKED]->(rec:Song)
WHERE NOT (u1)-[:LISTENED|LIKED]->(rec)
RETURN rec.title AS Sugestao, 
       count(DISTINCT u2) AS Popularidade_entre_Similares,
       collect(DISTINCT u2.name)[0..3] AS Usuarios_Exemplo
ORDER BY Popularidade_entre_Similares DESC
LIMIT 5;

// 2. RECOMENDAÇÃO POR AFINIDADE DE GÊNERO (Content-Based)
// Lógica: "Músicas novas nos gêneros que você mais interage."
MATCH (u:User {id: "U1"})-[r:LISTENED|LIKED]->(s:Song)-[:BELONGS_TO]->(g:Genre)
WITH u, g, sum(r.weight) AS score_afinidade
MATCH (rec:Song)-[:BELONGS_TO]->(g)
WHERE NOT (u)-[:LISTENED|LIKED]->(rec)
RETURN rec.title AS Musica, 
       g.name AS Genero, 
       score_afinidade
ORDER BY score_afinidade DESC, rec.title ASC
LIMIT 5;

// 3. ANÁLISE DE PERFIL (Descoberta)
// Lógica: Quais artistas o usuário mais "consome" no grafo?
MATCH (u:User {id: "U1"})-[r:LISTENED|LIKED]->(s:Song)-[:PERFORMED_BY]->(a:Artist)
RETURN a.name AS Artista, 
       count(s) AS Qtd_Musicas_Ouvidas, 
       sum(r.weight) AS Score_Total
ORDER BY Score_Total DESC
LIMIT 5;
