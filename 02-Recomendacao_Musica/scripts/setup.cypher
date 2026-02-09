// Unicidade para Usuários, Músicas, Artistas e Gêneros
CREATE CONSTRAINT IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (s:Song) REQUIRE s.title IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (a:Artist) REQUIRE a.name IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (g:Genre) REQUIRE g.name IS UNIQUE;

// Carrega o csv music_interations.csv:
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Lchrys/Challanges-Neo4j-DIO/refs/heads/main/02-Recomendacao_Musica/dados/music_interactions.csv' AS row

// Criar/Localiza os Nós
MERGE (u:User {id: row.user_id}) 
  SET u.name = row.user_name

MERGE (s:Song {title: row.song_title})

MERGE (a:Artist {name: row.artist_name})

MERGE (g:Genre {name: row.genre_name})

// Cria Conexões Estruturais
MERGE (s)-[:PERFORMED_BY]->(a)
MERGE (s)-[:BELONGS_TO]->(g)

// Criar Interações com Propriedades (Peso)
// Se for LISTENED, cria aresta com peso 1
FOREACH (_ IN CASE WHEN row.interaction_type = 'LISTENED' THEN [1] ELSE [] END |
    MERGE (u)-[r:LISTENED]->(s) 
    SET r.weight = toInteger(row.weight))

// Se for LIKED, cria aresta com peso 5
FOREACH (_ IN CASE WHEN row.interaction_type = 'LIKED' THEN [1] ELSE [] END |
    MERGE (u)-[r:LIKED]->(s) 
    SET r.weight = toInteger(row.weight))
