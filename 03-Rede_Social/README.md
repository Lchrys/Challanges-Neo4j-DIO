
<div align="center">
  <img src="https://i0.wp.com/codigosimples.net/wp-content/uploads/2019/11/neo4j-aura-logo-white-1.png?fit=468%2C468&ssl=1" alt="Neo4j Logo" height="160">
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://hermes.digitalinnovation.one/assets/diome/logo.svg" alt="DIO Logo" height="80">
</div>

---

# 🌐 Projeto: Análise de Engajamento em Redes Sociais com Grafos

Este repositório contém o desenvolvimento de um protótipo funcional para uma startup de análise de mídias sociais. O objetivo é oferecer insights profundos sobre o engajamento e as conexões entre usuários utilizando o poder do **Neo4j Aura DB**. 

Diferente de bancos de dados relacionais (SQL), a abordagem por grafos permite percorrer trilhas de interações complexas — como amizades de múltiplos níveis e caminhos de influência — com alta performance e baixa complexidade de código.

---

## 📌 Objetivo do Projeto
O sistema foi projetado para responder a perguntas críticas de negócio sobre o ecossistema da rede social:
* **Recomendações Inteligentes**: Sugerir amizades baseadas em conexões de 2º grau (FoAF - Friend of a Friend).
* **Graus de Separação**: Identificar o caminho mais curto (unidirecional) entre dois usuários.
* **Métricas de Engajamento**: Rankear o conteúdo mais popular com base em interações temporais (curtidas por data).

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** Neo4j Aura (Instância Cloud)
* **Linguagem de Consulta:** Cypher (CQL)
* **Engenharia de Dados:** Python para geração de dataset sintético (100 usuários / 100 posts).
* **Versionamento de Dados:** GitHub (Carga automatizada via `LOAD CSV`).

---

## 📐 Modelo de Dados (Grafo)

Para este projeto, priorizamos a integridade dos dados através da conversão de tipos e limpeza de strings (`trim()` e `toInteger()`).



### Nós (Labels)
* **`User`**: Representa os usuários da plataforma (ID, Name, Age).
* **`Post`**: Conteúdo publicado (ID, Content, Date).

### Relacionamentos
* `[:FOLLOWS]`: Relacionamento **unidirecional** entre usuários. Representa o fluxo de informação e influência.
* `[:LIKES]`: Relacionamento entre um **User** e um **Post**, quantificando o engajamento.

---

## 🧠 Lógica de Análise (`analysis_queries.cypher`)

O núcleo do projeto utiliza a teoria dos grafos para extrair inteligência:

### 1. Sistema de Recomendação (Filtragem Colaborativa)
O motor identifica usuários que seus amigos seguem, mas que você ainda não segue. O sistema calcula a **Força da Conexão** com base na quantidade de amigos em comum.

### 2. Análise de Caminho (Shortest Path)
Utiliza algoritmos de busca em largura para encontrar o menor número de saltos entre dois usuários, respeitando a direcionalidade das setas (`(a)-[:FOLLOWS]->(b)`).

### 3. Posts Populares
Cálculo do posto mais curtido em uma detrminada data.

---

## 🚀 Como Replicar este Projeto

1. Acesse o [Neo4j Aura](https://neo4j.com/cloud/aura/) e crie sua instância gratuita.
2. **Setup e Carga**: Execute os comandos contidos no arquivo `setup.cypher`.
    * *Nota: O script realiza o mapeamento de tipos de dados para garantir que IDs sejam tratados como Inteiros.*
3. **Exploração de Insights**: Utilize o arquivo `analalises.cypher` para rodar os testes de recomendação e caminho mais curto.

### Visualização do Grafo (Perspective):

<div align="center">
  <img src="https://github.com/Lchrys/Challanges-Neo4j-DIO/blob/main/03-Rede_Social/IMG/vis_03.png" width="80%">
</div>
