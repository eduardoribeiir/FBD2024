# FBD2024
Este projeto consiste no desenvolvimento de um sistema de gerenciamento de bibliotecas para instituições educacionais. Ele foi dividido em três etapas principais:

Definição da Aplicação e Levantamento de Requisitos: Nesta fase, definimos os requisitos funcionais do sistema, incluindo cadastro de livros e usuários, gestão de empréstimos, devoluções, reservas, multas, geração de relatórios e notificações. Também criamos um modelo de dados utilizando diagramas ER/EER para representar as entidades e seus relacionamentos.

Modelagem Relacional e Povoamento do Banco de Dados: Focamos na implementação do modelo relacional a partir do diagrama ER, especificando chaves primárias, estrangeiras e atributos multivalorados. Criamos as tabelas no banco de dados e populamos com dados iniciais. Além disso, implementamos as regras de negócio, como limite de empréstimos por usuário e geração de multas automáticas.

Desenvolvimento das Telas: Utilizamos Jupyter Notebooks, a biblioteca Panel para a interface gráfica, e psycopg2/SQLAlchemy para acessar o banco de dados. Foram desenvolvidas três telas principais:

Tela de Empréstimo e Devolução: para gerenciar o processo de retirada e devolução de livros pelos bibliotecários.
Tela de Reserva (Aluno/Professor): permitindo que alunos e professores realizem reservas de livros.
Tela de Pagamento de Multa: para visualizar e pagar multas geradas por devoluções atrasadas.
Essas entregas proporcionaram uma aplicação funcional e eficiente, com uma base sólida para o gerenciamento de bibliotecas.

Link da apresentação:
https://drive.google.com/drive/folders/1rlQBN1oZIkglIB3_dBNQm8mi5-zMuRIo?usp=drive_link
