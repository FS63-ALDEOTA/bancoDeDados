CREATE TABLE usuarios (
id SERIAL PRIMARY KEY, 
nome VARCHAR(150) NOT NULL, 
email VARCHAR(100) UNIQUE NOT NULL,
telefone VARCHAR(11),
cpf CHAR(11) UNIQUE, 
criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM usuarios;

-- Criem uma tabela de professores com os campos
-- id, nome, email, senha, formacao 

CREATE TABLE professores (
id SERIAL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
senha VARCHAR(7) NOT NULL,
formacao VARCHAR(50) NOT NULL
);

SELECT * FROM professores;

ALTER TABLE professores ADD COLUMN ativo BOOLEAN DEFAULT true NOT NULL;
