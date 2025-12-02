-- 01_schema.sql
-- Projeto: G.H.L - Gestão Hospitalar de Leitos

CREATE TABLE setor (
  id_setor      INT PRIMARY KEY,
  nome          VARCHAR(80) NOT NULL,
  andar         VARCHAR(48) NOT NULL
);

CREATE TABLE leito (
  id_leito      INT PRIMARY KEY,
  status_atual  VARCHAR(32) NOT NULL,
  id_setor      INT NOT NULL,
  CONSTRAINT fk_leito_setor
    FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);

CREATE TABLE paciente (
  id_paciente     INT PRIMARY KEY,
  nome            VARCHAR(120) NOT NULL,
  cpf             VARCHAR(14) UNIQUE,
  data_nascimento DATE NOT NULL,
  id_leito        INT UNIQUE,
  CONSTRAINT fk_paciente_leito
    FOREIGN KEY (id_leito) REFERENCES leito(id_leito)
);

CREATE TABLE ocorrencia_ttv (
  id_ocorrencia      INT PRIMARY KEY,
  id_leito           INT NOT NULL,
  dt_alta            TIMESTAMP NOT NULL,
  dt_saida_paciente  TIMESTAMP,
  dt_leito_livre     TIMESTAMP,
  dt_inicio_limpeza  TIMESTAMP,
  dt_fim_limpeza     TIMESTAMP,
  dt_leito_liberado  TIMESTAMP,
  ttv_minutos        INT,
  CONSTRAINT fk_ocorrencia_leito
    FOREIGN KEY (id_leito) REFERENCES leito(id_leito)
);

CREATE TABLE ordem_servico (
  id_os         INT PRIMARY KEY,
  id_ocorrencia INT NOT NULL UNIQUE,
  dt_abertura   TIMESTAMP NOT NULL,
  dt_inicio     TIMESTAMP,
  dt_fim        TIMESTAMP,
  status        VARCHAR(20) NOT NULL,
  observacao    VARCHAR(255),
  CONSTRAINT fk_os_ocorrencia
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia_ttv(id_ocorrencia)
);

CREATE TABLE usuario (
  id_usuario  INT PRIMARY KEY,
  nome        VARCHAR(120) NOT NULL,
  perfil      VARCHAR(48) NOT NULL,
  email       VARCHAR(150) UNIQUE NOT NULL,
  ativo       BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE usuario_os (
  id_usuario    INT NOT NULL,
  id_os         INT NOT NULL,
  dt_atribuicao TIMESTAMP NOT NULL,
  PRIMARY KEY (id_usuario, id_os),
  CONSTRAINT fk_usuario_os_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  CONSTRAINT fk_usuario_os_os      FOREIGN KEY (id_os)      REFERENCES ordem_servico(id_os)
);
