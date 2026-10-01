-- DROP TABLE usuarios;

-- ordem_servico

CREATE TABLE status (
id SERIAL PRIMARY KEY,
descricao VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO status (descricao) VALUES 
('em aberto'),
('finalizada'), 
('entregue'), 
('bloqueada'), 
('cancelada');

SELECT * FROM status;


CREATE TABLE ordem_servico (
id SERIAL PRIMARY KEY,
-- cascade exclui todos os registros de ordem_servico vinculado ao cliente excluido
cliente_id INT NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
status_id SMALLINT NOT NULL REFERENCES status(id) ON DELETE RESTRICT DEFAULT 1,
funcionario_id INT REFERENCES funcionarios(id) ON DELETE RESTRICT,
data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
data_saida TIMESTAMP
);


CREATE TABLE servicos (
id SERIAL PRIMARY KEY,
descricao VARCHAR(50) NOT NULL UNIQUE
);

-- itens_ordem_servico
CREATE TABLE itens_ordem_servico (
id SERIAL PRIMARY KEY,
os_id INT REFERENCES ordem_servico(id) ON DELETE CASCADE NOT NULL,
equipamento_id INT REFERENCES equipamentos(id) ON DELETE RESTRICT NOT NULL,
status_id INT REFERENCES status(id) ON DELETE RESTRICT NOT NULL,
funcionario_id INT REFERENCES funcionarios(id) ON DELETE RESTRICT,
servico_id INT NOT NULL REFERENCES servicos(id) ON DELETE RESTRICT,
observacao VARCHAR(255)  
);

