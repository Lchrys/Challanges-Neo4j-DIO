Este repositório contém a entrega do projeto prático de banco de dados orientado a grafos, desenvolvido como parte da formação na **DIO (Digital Innovation One)**. 
Este pequeno projeto utiliza o **Neo4j Aura DB** (instância cloud) para modelar conexões entre filmes, séries, diretores, atores e usuários.
Como meu projeto de estreia em Modelagem de Grafos, busquei aplicar os conceitos fundamentais de nós, relacionamentos e propriedades utilizando o Neo4j Aura.

## 📌 Objetivo do Projeto
O objetivo é criar um grafo que represente o ecossistema de entretenimento, permitindo identificar:
- Quais diretores dirigiram determinados títulos.
- Elenco de atores por produção.
- Classificação por gênero.
- Histórico de visualização e avaliações (ratings) de usuários.

## 🛠️ Tecnologias Utilizadas
- **Banco de Dados:** Neo4j Aura (Cloud)
- **Linguagem de Consulta:** Cypher (CQL)
- **Ferramentas:** Neo4j Workspace / Browser

## 📐 Modelo de Dados (Grafo)

### Nós (Labels)
- `Movie`: Filmes (ex: Oppenheimer, Inception).
- `Series`: Séries (ex: Breaking Bad, Dark).
- `Actor`: Atores (ex: Cillian Murphy).
- `Director`: Diretores (ex: Christopher Nolan).
- `Genre`: Gêneros cinematográficos (ex: Sci-Fi, Drama).
- `User`: Usuários que assistem e avaliam os títulos.

### Relacionamentos
- `[:DIRECTED]`: (Diretor) -> (Filme/Série)
- `[:ACTED_IN]`: (Ator) -> (Filme/Série)
- `[:IN_GENRE]`: (Filme/Série) -> (Gênero)
- `[:WATCHED {rating}]`: (Usuário) -> (Filme/Série) com nota atribuída.

## 🚀 Como Replicar este Projeto

Se você deseja rodar este projeto na sua própria instância do Neo4j:

1. Acesse o [Neo4j Aura](https://neo4j.com/cloud/aura/) e crie uma conta gratuita.
2. No console do banco, execute os comandos do arquivo `setup.cypher` para criar os nós e as constraints de unicidade.
3. Execute os comandos do arquivo `relacionamentos.cypher` para conectar os dados.
4. Utilize o arquivo `consultas.cypher` para realizar testes de busca.
