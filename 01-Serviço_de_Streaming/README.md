<div align="center">
  <img src="https://dist.neo4j.com/wp-content/uploads/20210423201726/Aura-logo_color.png" alt="Neo4j Logo" height="80">
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://hermes.digitalinnovation.one/assets/diome/logo.svg" alt="DIO Logo" height="80">
</div>

---

# 🎬 Projeto 01: Serviço de Streaming

Este repositório contém a entrega do meu primeiro projeto prático de banco de dados orientado a grafos, desenvolvido durante a formação na **DIO (Digital Innovation One)**. 

Neste desafio de estreia, utilizei o **Neo4j Aura DB** (instância cloud) para modelar conexões complexas entre produções audiovisuais, elencos e interações de usuários. O foco foi aplicar os conceitos fundamentais de **nós**, **relacionamentos** e **propriedades** em um ambiente real de nuvem.

---

## 📌 Objetivo do Projeto
O grafo foi estruturado para representar um ecossistema de entretenimento completo, permitindo consultas eficientes para:
* Identificar **diretores** e seus respectivos títulos.
* Mapear o **elenco de atores** por produção.
* Classificar conteúdos por **gênero**.
* Analisar o **histórico de visualização** e as **avaliações (ratings)** dadas pelos usuários.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** Neo4j Aura (Cloud DB)
* **Linguagem de Consulta:** Cypher (CQL)
* **Ferramentas:** Neo4j Workspace / Browser

---

## 📐 Modelo de Dados (Grafo)

### Nós (Labels)
* **`Movie`**: Filmes (ex: *Oppenheimer*, *Inception*).
* **`Series`**: Séries (ex: *Breaking Bad*, *Dark*).
* **`Actor`**: Atores (ex: *Cillian Murphy*).
* **`Director`**: Diretores (ex: *Christopher Nolan*).
* **`Genre`**: Gêneros cinematográficos (ex: *Sci-Fi*, *Drama*).
* **`User`**: Usuários da plataforma.

### Relacionamentos
* `[:DIRECTED]`: Conecta um **Director** a um **Movie** ou **Series**.
* `[:ACTED_IN]`: Conecta um **Actor** a uma produção.
* `[:IN_GENRE]`: Classifica o título em um **Genre**.
* `[:WATCHED {rating}]`: Representa a interação do **User**, armazenando a nota da avaliação.

---

## 🚀 Como Replicar este Projeto

Para rodar este grafo na sua própria instância do Neo4j:

1.  Acesse o [Neo4j Aura](https://neo4j.com/cloud/aura/) e crie uma conta gratuita.
2.  Abra o **Neo4j Workspace (Query)**.
3.  Execute os comandos contidos no arquivo `setup.cypher` para criar os nós e as constraints.
4.  Execute os comandos do arquivo `relacionamentos.cypher` para gerar as conexões.
5.  Utilize o arquivo `consultas.cypher` para explorar os dados e validar as buscas.

### Visualização do grafo deste projeto:

<div align="center">
  <img src="https://github.com/Lchrys/Challanges-Neo4j-DIO/blob/main/01-Servi%C3%A7o_de_Streaming/IMG/bloom-visualisation.png?raw=true" alt="Visualização do Grafo no Bloom" width="80%">
</div>
