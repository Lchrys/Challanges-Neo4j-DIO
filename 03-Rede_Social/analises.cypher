// Exemplos de queries com base nas questões propostas:

// 1. SISTEMA DE RECOMENDAÇÃO (Amigo de Amigo)
// Busca sugestões de amizade baseadas em conexões de 2º grau (exemplo: usuário 94)
MATCH (u:User {id: 94})-[:FOLLOWS]->(amigo)-[:FOLLOWS]->(sugestao:User)
WHERE NOT (u)-[:FOLLOWS]->(sugestao) AND u <> sugestao
RETURN sugestao.name AS Recomendacao, count(*) AS AmigosEmComum
ORDER BY AmigosEmComum DESC 
LIMIT 5;

// 2. CAMINHO MAIS CURTO (Graus de Separação)
// Encontra a menor rota de amizades entre dois usuários (exemplo: do usuário 15 ao 11 - unidirecional)
MATCH (a:User {id: 15}), (b:User {id: 11})
MATCH path = shortestPath((a)-[:FOLLOWS*..15]->(b))
RETURN path;

// 3. POST MAIS CURTIDO POR DATA
// Identifica o conteúdo com maior engajamento em um dia específico (exemplo: 2026-02-08)
MATCH (p:Post {date: '2026-02-08'})<-[r:LIKES]-(u:User)
RETURN p.content AS Post, count(r) AS TotalCurtidas
ORDER BY TotalCurtidas DESC 
LIMIT 1;
