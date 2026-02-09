// LIMPEZA E CONFIGURAÇÃO DE INTEGRIDADE
CREATE CONSTRAINT user_id_unique IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT post_id_unique IF NOT EXISTS FOR (p:Post) REQUIRE p.id IS UNIQUE;

// NÓS (IMPORTAÇÃO BLINDADA)

// Importar Usuários (Forçando Integer e removendo espaços)
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Lchrys/Challanges-Neo4j-DIO/refs/heads/main/03-Rede_Social/data/users.csv' AS row
MERGE (u:User {id: toInteger(trim(row.id))})
SET u.name = trim(row.name),
    u.age = toInteger(row.age);

// Importar Posts
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Lchrys/Challanges-Neo4j-DIO/refs/heads/main/03-Rede_Social/data/posts.csv' AS row
MERGE (p:Post {id: toInteger(trim(row.id))})
SET p.content = trim(row.content),
    p.date = trim(row.date);

// RELACIONAMENTOS (EDGES)

// Cria Relacionamentos de Seguidores
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Lchrys/Challanges-Neo4j-DIO/refs/heads/main/03-Rede_Social/data/edges.csv' AS row
WITH row, toInteger(trim(row.source_id)) AS src, toInteger(trim(row.target_id)) AS tgt
WHERE row.type = 'FOLLOWS'
MATCH (a:User {id: src}), (b:User {id: tgt})
MERGE (a)-[:FOLLOWS]->(b);

// Cria Relacionamentos de Curtidas
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Lchrys/Challanges-Neo4j-DIO/refs/heads/main/03-Rede_Social/data/edges.csv' AS row
WITH row, toInteger(trim(row.source_id)) AS src, toInteger(trim(row.target_id)) AS tgt
WHERE row.type = 'LIKES'
MATCH (u:User {id: src}), (p:Post {id: tgt})
MERGE (u)-[:LIKES]->(p);

// Visualização dos dados
MATCH (n)-[r]->(m) RETURN n, r, m
