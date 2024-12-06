# Dicionário de Dados

## Tabela: **Usuario**

| Campo                  | Tipo         | Descrição                                                                       | Restrição        |
| ---------------------- | ------------ | ------------------------------------------------------------------------------- | ---------------- |
| CPF                    | CHAR(11)     | Número de Cadastro de Pessoa Física, usado como identificador único do usuário. | PK               |
| Nome                   | VARCHAR(100) | Nome completo do usuário.                                                       | NOT NULL         |
| Email                  | VARCHAR(100) | Endereço de email do usuário, deve ser único.                                   | UNIQUE, NOT NULL |
| Senha                  | VARCHAR(255) | Senha de acesso do usuário.                                                     | NOT NULL         |
| Telefone               | VARCHAR(20)  | Número de telefone do usuário.                                                  | NOT NULL         |
| Data_Nascimento        | DATE         | Data de nascimento do usuário.                                                  | NOT NULL         |
| Cidade_Nascimento      | VARCHAR(100) | Cidade onde o usuário nasceu.                                                   | NULL             |
| Curriculo              | BLOB         | Arquivo de currículo do usuário.                                                | NULL             |
| Logradouro             | VARCHAR(255) | Endereço do usuário.                                                            | NULL             |
| Numero                 | VARCHAR(10)  | Número do endereço do usuário.                                                  | NULL             |
| Complemento            | VARCHAR(255) | Complemento do endereço do usuário.                                             | NULL             |
| Bairro                 | VARCHAR(100) | Bairro do endereço do usuário.                                                  | NULL             |
| CEP                    | VARCHAR(20)  | Código Postal do endereço do usuário.                                           | NULL             |
| Cidade                 | VARCHAR(100) | Cidade do endereço do usuário.                                                  | NULL             |
| Estado                 | VARCHAR(50)  | Estado do endereço do usuário.                                                  | NULL             |
| Foto_Perfil            | BLOB         | Foto de perfil do usuário.                                                      | NULL             |
| Formacao_Profissional  | TEXT         | Formação profissional do usuário.                                               | NULL             |
| Motivacao_Empreendedor | TEXT         | Motivação do usuário para ser empreendedor.                                     | NULL             |
| Ocupacao_Atual         | VARCHAR(100) | Ocupação atual do usuário.                                                      | NULL             |
| Tempo_Experiencia      | TEXT         | Tempo de experiência do usuário.                                                | NULL             |

---

## Tabela: **Usuario_Rede_Social**

| Campo     | Tipo         | Descrição                                                                                | Restrição              |
| --------- | ------------ | ---------------------------------------------------------------------------------------- | ---------------------- |
| CPF       | CHAR(11)     | Número de Cadastro de Pessoa Física do usuário, chave estrangeira para a tabela Usuario. | PK, FK -> Usuario(CPF) |
| Nome_Rede | VARCHAR(50)  | Nome da rede social.                                                                     | PK                     |
| Link      | VARCHAR(255) | Link para o perfil do usuário na rede social.                                            | NOT NULL               |

---

## Tabela: **Admin**

| Campo                 | Tipo                     | Descrição                                                                             | Restrição        |
| --------------------- | ------------------------ | ------------------------------------------------------------------------------------- | ---------------- |
| CPF                   | CHAR(11)                 | Número de Cadastro de Pessoa Física, usado como identificador único do administrador. | PK               |
| Nome                  | VARCHAR(100)             | Nome completo do administrador.                                                       | NOT NULL         |
| Email                 | VARCHAR(100)             | Endereço de email do administrador, deve ser único.                                   | UNIQUE, NOT NULL |
| Senha                 | VARCHAR(255)             | Senha de acesso do administrador.                                                     | NOT NULL         |
| Perfil                | ENUM('ROOT', 'Analista') | Perfil do administrador, pode ser 'ROOT' ou 'Analista'.                               | NOT NULL         |
| Telefone              | VARCHAR(20)              | Número de telefone do administrador.                                                  | NOT NULL         |
| Data_Nascimento       | DATE                     | Data de nascimento do administrador.                                                  | NOT NULL         |
| Cidade_Nascimento     | VARCHAR(100)             | Cidade onde o administrador nasceu.                                                   | NULL             |
| Foto_Perfil           | BLOB                     | Foto de perfil do administrador.                                                      | NULL             |
| Formacao_Profissional | TEXT                     | Formação profissional do administrador.                                               | NULL             |

---

## Tabela: **Startup**

| Campo                | Tipo          | Descrição                                                     | Restrição                  |
| -------------------- | ------------- | ------------------------------------------------------------- | -------------------------- |
| ID_Startup           | INT           | Identificador único da startup.                               | PK, AUTO_INCREMENT         |
| Nome                 | VARCHAR(100)  | Nome da startup.                                              | NOT NULL                   |
| Logo                 | BLOB          | Logotipo da startup.                                          | NOT NULL                   |
| ID_Empreendedor      | CHAR(11)      | CPF do empreendedor, chave estrangeira para a tabela Usuario. | PK, FK -> Usuario(CPF)     |
| ID_Analista          | CHAR(11)      | CPF do analista, chave estrangeira para a tabela Admin.       | FK -> Admin(CPF), NOT NULL |
| CNPJ                 | CHAR(14)      | Número de Cadastro Nacional da Pessoa Jurídica da startup.    | UNIQUE, NULL               |
| Data_Abertura        | DATE          | Data de abertura da startup.                                  | NULL                       |
| Data_Ingresso        | DATE          | Data de ingresso da startup no programa.                      | NULL                       |
| Descricao            | TEXT          | Descrição da startup.                                         | NULL                       |
| Email                | VARCHAR(100)  | Endereço de email da startup.                                 | NULL                       |
| Logradouro           | VARCHAR(255)  | Endereço da startup.                                          | NULL                       |
| Numero               | VARCHAR(10)   | Número do endereço da startup.                                | NULL                       |
| Complemento          | VARCHAR(255)  | Complemento do endereço da startup.                           | NULL                       |
| Bairro               | VARCHAR(100)  | Bairro do endereço da startup.                                | NULL                       |
| CEP                  | VARCHAR(20)   | Código Postal do endereço da startup.                         | NULL                       |
| Cidade               | VARCHAR(100)  | Cidade do endereço da startup.                                | NULL                       |
| Estado               | VARCHAR(50)   | Estado do endereço da startup.                                | NULL                       |
| Investimento_Inicial | DECIMAL(10,2) | Valor do investimento inicial na startup.                     | NULL                       |
| Objetivo_PIBTec      | TEXT          | Objetivo da startup no programa PIBTec.                       | NULL                       |
| Ramo_Atuacao         | VARCHAR(100)  | Ramo de atuação da startup.                                   | NULL                       |
| Telefone             | VARCHAR(20)   | Número de telefone da startup.                                | NULL                       |

---

## Tabela: **Startup_Rede_Social**

| Campo      | Tipo         | Descrição                                                                | Restrição                     |
| ---------- | ------------ | ------------------------------------------------------------------------ | ----------------------------- |
| ID_Startup | INT          | Identificador único da startup, chave estrangeira para a tabela Startup. | PK, FK -> Startup(ID_Startup) |
| Nome_Rede  | VARCHAR(50)  | Nome da rede social.                                                     | PK                            |
| Link       | VARCHAR(255) | Link para o perfil da startup na rede social.                            | NOT NULL                      |

---

## Tabela: **Socios**

| Campo           | Tipo     | Descrição                                                                | Restrição                     |
| --------------- | -------- | ------------------------------------------------------------------------ | ----------------------------- |
| ID_Startup      | INT      | Identificador único da startup, chave estrangeira para a tabela Startup. | PK, FK -> Startup(ID_Startup) |
| ID_Empreendedor | CHAR(11) | CPF do empreendedor, chave estrangeira para a tabela Usuario.            | PK, FK -> Usuario(CPF)        |

---

## Tabela: **JornadaStartup**

| Campo         | Tipo         | Descrição                                                                | Restrição                     |
| ------------- | ------------ | ------------------------------------------------------------------------ | ----------------------------- |
| ID_Startup    | INT          | Identificador único da startup, chave estrangeira para a tabela Startup. | PK, FK -> Startup(ID_Startup) |
| Data_Inicio   | DATE         | Data de início da jornada.                                               | NOT NULL                      |
| Data_Fim      | DATE         | Data de fim da jornada.                                                  | NULL                          |
| Progresso     | DECIMAL(5,2) | Progresso da jornada em porcentagem.                                     | DEFAULT 0                     |
| Ultimo_Acesso | DATETIME     | Data e hora do último acesso à jornada.                                  | NULL                          |

---

## Tabela: **JornadaBaseItem**

| Campo      | Tipo                                                | Descrição                                                                            | Restrição                    |
| ---------- | --------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------- |
| ID         | INT                                                 | Identificador único.                                                                 | PK, AUTO_INCREMENT           |
| ID_Startup | INT                                                 | Identificador da startup.                                                            | FK -> Startup(ID_Startup)    |
| ID_Etapa   | INT                                                 | Identificador da etapa.                                                              | FK -> JornadaEtapa(ID_Etapa) |
| ID_Eixo    | INT                                                 | Identificador do eixo.                                                               | FK -> JornadaEixo(ID_Eixo)   |
| ID_Item    | INT                                                 | Identificador do item.                                                               | FK -> JornadaItem(ID_Item)   |
| Input      | TEXT                                                | Arquivo de entrada para o item da jornada.                                           | NULL                         |
| Status     | ENUM('vazio', 'em analise', 'aprovado', 'recusado') | Status do item da jornada, pode ser 'vazio', 'em analise', 'aprovado' ou 'recusado'. | DEFAULT 'vazio'              |

---

## Tabela: **JornadaEtapa**

| Campo    | Tipo        | Descrição                     | Restrição          |
| -------- | ----------- | ----------------------------- | ------------------ |
| ID_Etapa | INT         | Identificador único da etapa. | PK, AUTO_INCREMENT |
| Nome     | VARCHAR(50) | Nome da etapa.                | NOT NULL           |

---

## Tabela: **JornadaEixo**

| Campo   | Tipo        | Descrição                    | Restrição          |
| ------- | ----------- | ---------------------------- | ------------------ |
| ID_Eixo | INT         | Identificador único do eixo. | PK, AUTO_INCREMENT |
| Nome    | VARCHAR(50) | Nome do eixo.                | NOT NULL           |

---

## Tabela: **JornadaItem**

| Campo              | Tipo | Descrição                                                                   | Restrição                    |
| ------------------ | ---- | --------------------------------------------------------------------------- | ---------------------------- |
| ID_Item            | INT  | Identificador único do item da jornada.                                     | PK, AUTO_INCREMENT           |
| ID_Etapa           | INT  | Identificador único da etapa, chave estrangeira para a tabela JornadaEtapa. | FK -> JornadaEtapa(ID_Etapa) |
| ID_Eixo            | INT  | Identificador único do eixo, chave estrangeira para a tabela JornadaEixo.   | FK -> JornadaEixo(ID_Eixo)   |
| Item               | TEXT | Descrição do item da jornada.                                               | NOT NULL                     |
| Descricao          | TEXT | Descrição detalhada do item da jornada.                                     | NOT NULL                     |
| Exemplos_Genericos | TEXT | Exemplos genéricos relacionados ao item da jornada.                         | NULL                         |
| Ferramentas        | TEXT | Ferramentas recomendadas para o item da jornada.                            | NULL                         |
| Material_Apoio     | TEXT | Material de apoio para o item da jornada.                                   | NOT NULL                     |
| Video              | TEXT | Vídeo relacionado ao item da jornada.                                       | NULL                         |
| Entregas_Concretas | TEXT | Entregas concretas esperadas para o item da jornada.                        | NOT NULL                     |

---

## Tabela: **Feedback**

| Campo         | Tipo     | Descrição                                                                                     | Restrição                 |
| ------------- | -------- | --------------------------------------------------------------------------------------------- | ------------------------- |
| ID_Feedback   | INT      | Identificador único do feedback.                                                              | PK, AUTO_INCREMENT        |
| ID_BaseItem   | INT      | Identificador único do item da jornada base, chave estrangeira para a tabela JornadaBaseItem. | FK -> JornadaBaseItem(ID) |
| Observacoes   | TEXT     | Observações do feedback.                                                                      | NULL                      |
| Data_Feedback | DATETIME | Data e hora do feedback.                                                                      | NOT NULL                  |

---

## Tabela: **Monitoramento**

| Campo                 | Tipo          | Descrição                                                                | Restrição                 |
| --------------------- | ------------- | ------------------------------------------------------------------------ | ------------------------- |
| ID                    | INT           | Identificador único do monitoramento.                                    | PK, AUTO_INCREMENT        |
| ID_Startup            | INT           | Identificador único da startup, chave estrangeira para a tabela Startup. | FK -> Startup(ID_Startup) |
| ID_Empreendedor       | CHAR(11)      | CPF do empreendedor, chave estrangeira para a tabela Usuario.            | FK -> Usuario(CPF)        |
| ID_Analista           | CHAR(11)      | CPF do analista, chave estrangeira para a tabela Admin.                  | FK -> Admin(CPF)          |
| Data                  | DATE          | Data do monitoramento.                                                   | NOT NULL                  |
| Faturamento           | DECIMAL(10,2) | Faturamento da startup no período do monitoramento.                      | NULL                      |
| Num_Funcionario       | INT           | Número de funcionários da startup no período do monitoramento.           | NULL                      |
| Plano_Desenvolvimento | TEXT          | Plano de desenvolvimento da startup.                                     | NULL                      |

---

## Tabela: **MonitoramentoItens**

| Campo            | Tipo | Descrição                                                                                     | Restrição                 |
| ---------------- | ---- | --------------------------------------------------------------------------------------------- | ------------------------- |
| ID               | INT  | Identificador único do item de monitoramento.                                                 | PK, AUTO_INCREMENT        |
| ID_Monitoramento | INT  | Identificador único do monitoramento, chave estrangeira para a tabela Monitoramento.          | FK -> Monitoramento(ID)   |
| ID_BaseItem      | INT  | Identificador único do item da jornada base, chave estrangeira para a tabela JornadaBaseItem. | FK -> JornadaBaseItem(ID) |

---

## Tabela: **MonitoramentoSocios**

| Campo            | Tipo     | Descrição                                                                            | Restrição                         |
| ---------------- | -------- | ------------------------------------------------------------------------------------ | --------------------------------- |
| ID_Monitoramento | INT      | Identificador único do monitoramento, chave estrangeira para a tabela Monitoramento. | PK, FK -> Monitoramento(ID)       |
| ID_Socio         | CHAR(11) | CPF do sócio, chave estrangeira para a tabela Socios.                                | PK, FK -> Socios(ID_Empreendedor) |

---

## Tabela: **Notificacoes**

| Campo        | Tipo     | Descrição                                                     | Restrição                |
| ------------ | -------- | ------------------------------------------------------------- | ------------------------ |
| ID           | INT      | Identificador único da notificação.                           | PK, AUTO_INCREMENT       |
| Remetente    | CHAR(11) | CPF do remetente, chave estrangeira para a tabela Admin.      | FK -> Admin(CPF)         |
| Destinatario | CHAR(11) | CPF do destinatário, chave estrangeira para a tabela Usuario. | FK -> Usuario(CPF), NULL |
| Mensagem     | TEXT     | Mensagem da notificação.                                      | NOT NULL                 |
| Data_Envio   | DATETIME | Data e hora do envio da notificação.                          | NOT NULL                 |
| Lida         | BOOLEAN  | Indica se a notificação foi lida (TRUE) ou não (FALSE).       | DEFAULT FALSE            |

---

Claro, aqui está a documentação da procedure `CriarJornadaStartup` para o dicionário de dados:

## Procedure: CriarJornadaStartup

### Descrição
A procedure `CriarJornadaStartup` é responsável por criar uma nova jornada para uma startup específica. Ela insere uma nova entrada na tabela **JornadaStartup** e copia os itens da jornada para a tabela **JornadaBaseItem**, associando-os à startup.

### Parâmetros de Entrada
- `p_ID_Startup` (INT): Identificador único da startup.
- `p_Data_Inicio` (DATE): Data de início da jornada.

### Operações Realizadas
1. **Inserção na Tabela JornadaStartup:**
   - Insere uma nova linha na tabela **JornadaStartup** com os seguintes valores:
     - `ID_Startup`: Identificador da startup fornecido como parâmetro.
     - `Data_Inicio`: Data de início da jornada fornecida como parâmetro.
     - `Data_Fim`: Definido como `NULL`.
     - `Progresso`: Definido como `0`.
     - `Ultimo_Acesso`: Definido como `NULL`.

2. **Cópia dos Itens da Jornada para JornadaBaseItem:**
   - Copia os itens da tabela **JornadaItem** para a tabela **JornadaBaseItem**, associando-os à startup. Os valores copiados são:
     - `ID_Item`: Identificador do item da jornada.
     - `ID_Startup`: Identificador da startup fornecido como parâmetro.
     - `ID_Etapa`: Identificador da etapa do item.
     - `ID_Eixo`: Identificador do eixo do item.
     - `Input`: Definido como `NULL`.
     - `Status`: Definido como `'vazio'`.

### Exemplo de Uso

Para criar uma nova jornada para a startup com `ID_Startup = 1` e data de início `2025-01-01`, você pode chamar a procedure da seguinte forma:

```sql
CALL CriarJornadaStartup(1, '2025-01-01');
```

OBS: Sempre utilizar o padrão `YYYY-MM-DD` para campos do tipo `DATE`.