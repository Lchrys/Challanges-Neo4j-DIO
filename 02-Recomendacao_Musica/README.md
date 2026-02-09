<div align="center">
  <img src="https://i0.wp.com/codigosimples.net/wp-content/uploads/2019/11/neo4j-aura-logo-white-1.png?fit=468%2C468&ssl=1" alt="Neo4j Logo" height="160">
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://hermes.digitalinnovation.one/assets/diome/logo.svg" alt="DIO Logo" height="80">
</div>

---

# 🎵 Projeto: Sistema de Recomendação Musical

Este repositório contém o desenvolvimento de um motor de recomendação baseado em grafos, focado em interações musicais. O projeto utiliza o **Neo4j Aura DB** para modelar o comportamento de usuários e gerar sugestões personalizadas através de conexões complexas entre artistas, gêneros e preferências de escuta.

Este projeto explora como a **análise de caminhos (paths)** em grafos pode superar modelos relacionais tradicionais em sistemas de personalização em tempo real.

---

## 📌 Objetivo do Projeto
O grafo foi estruturado para representar cerca de 100 músicas únicas e 500 interações reais, permitindo:
* **Representar entidades**: Usuários, Músicas, Artistas e Gêneros como nós independentes.
* **Modelar Comportamento**: Utilizar arestas com propriedades de **peso (weight)** para diferenciar o interesse do usuário.
* **Gerar Inteligência**: Aplicar consultas **Cypher** para Filtragem Colaborativa e Afinidade de Conteúdo.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** Neo4j Aura (Instância Cloud)
* **Linguagem de Consulta:** Cypher (CQL)
* **Processamento de Dados:** Python (Pandas) para geração do dataset sintético.
* **Ferramentas:** Neo4j Workspace / Explore / Browser.

---

## 📐 Modelo de Dados (Grafo)

### Nós (Labels)
* **`Song`**: As 100 faixas do catálogo.
* **`Artist`**: Os 20 artistas produtores.
* **`Genre`**: Os 10 estilos musicais (Rock, Pop, Samba, etc).
* **`User`**: Os 25 usuários da plataforma.

### Relacionamentos e Propriedades
* `[:PERFORMED_BY]`: Conecta uma **Song** ao seu **Artist**.
* `[:BELONGS_TO]`: Classifica a **Song** em um **Genre**.
* `[:LISTENED {weight: 1}]`: Interação de escuta passiva entre **User** e **Song**. O 'Escutar' tem peso 1.
* `[:LIKED {weight: 5}]`: Interação de preferência ativa entre **User** e **Song**. O 'Gostar' tem peso 5.

---

## 🧠 Motor de Recomendação (`recom.cypher`)

O núcleo do projeto utiliza a lógica de grafos para resolver o problema de recomendação:

O motor de recomendação foi estruturado em três pilares fundamentais:

1. Filtragem Colaborativa (User-User Similarity)
Identifica usuários que possuem histórico de escuta similar. Se o "Usuário B" gosta do que você ouve e ele deu `LIKE` em uma música que você ainda não conhece, o sistema a recomenda com base na **Popularidade entre Similares**.

2. Recomendação por Afinidade de Gênero
Soma o `weight` de todas as interações do usuário dentro de cada gênero. O sistema então sugere músicas inéditas dos gêneros onde o usuário possui o maior **Score de Afinidade**.

3. Análise de Perfil (Descoberta)
Mapeia a densidade de conexões entre o usuário e os artistas, quantificando o volume de músicas ouvidas versus o peso total das interações para identificar os artistas favoritos no grafo.

---

## 🚀 Como Replicar este Projeto

1.  Acesse o [Neo4j Aura](https://neo4j.com/cloud/aura/) e crie sua instância gratuita.
2.  **Setup Inicial**: Execute os comandos de constraints e carga contidos no arquivo `setup.cypher`.
    * *Nota: O script realiza o `LOAD CSV` direto do dataset hospedado neste repositório.*
3.  **Exploração**: Utilize o arquivo `recom.cypher` para testar as recomendações personalizadas.

### Visualização do Grafo (Perspective):

<div align="center">
  <img src="https://github.com/Lchrys/Challanges-Neo4j-DIO/blob/main/01-Servi%C3%A7o_de_Streaming/IMG/bloom-visualisation.png?raw=true" alt="Visual
