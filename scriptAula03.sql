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

INSERT INTO enderecos (cep, logradouro, num, bairro, cidade, uf, complemento) VALUES
('01310200', 'Avenida Paulista', '1578', 'Bela Vista', 'São Paulo', 'SP', 'Apto 42'),
('20040002', 'Avenida Rio Branco', '123', 'Centro', 'Rio de Janeiro', 'RJ', 'Sala 501'),
('30140010', 'Avenida Cristóvão Colombo', '45', 'Savassi', 'Belo Horizonte', 'MG', NULL),
('70160900', 'Praça dos Três Poderes', 'S/N', 'Zona Cívico-Administrativa', 'Brasília', 'DF', 'Palácio do Planalto'),
('60150160', 'Avenida Santos Dumont', '2626', 'Aldeota', 'Fortaleza', 'CE', 'Loja B');


SELECT * FROM enderecos;

-- FILTROS 

SELECT * FROM enderecos WHERE uf = 'SP';

SELECT cidade, uf FROM enderecos;

-- LIKE '%Palavra' : termina com a palavra
-- LIKE 'Palavra%' : começa com a palavra
-- LIKE '%Palavra%' : em qualquer ponto da célula


SELECT * FROM enderecos WHERE logradouro LIKE 'Avenida%' AND cidade = 'São Paulo';

SELECT * FROM enderecos WHERE logradouro LIKE 'Avenida%';

-- sem registros pois o filtro é case sensitive
SELECT * FROM enderecos WHERE bairro = 'centro';

select * from enderecos;



-- carlos - cargo 
INSERT INTO public.cargos (descricao)
VALUES
    ('Técnico Informática'),
    ('Técnico Eletrônica'),
    ('Atendente'),
    ('Gerente'),
    ('Auxiliar Técnico');

-- raul - marcas
INSERT INTO public.marcas (descricao)
VALUES
    ('Dell'),
    ('Lenovo'),
    ('HP'),
    ('ASUS'),
    ('Acer');
	
-- william - funcionarios
INSERT INTO public.funcionarios (nome, cpf, email, telefone, endereco_id, cargo_id) 
VALUES
('Ana Silva Santos', '12345678901', 'ana.silva@email.com', '11988887777', 1, 1),
('Bruno Souza Lima', '98765432100', 'bruno.lima@email.com', '21977776666', 2, 2),
('Carla Costa Ribeiro', '45678912345', 'carla.costa@email.com', '31966665555', 3, 3),
('Diego Oliveira Alves', '32165498711', 'diego.alves@email.com', '41955554444', 4, 4),
('Elena Martins Pereira', '78912345622', 'elena.martins@email.com', '51944443333', 5, 5);

-- rafael - tipos
INSERT INTO tipos (descricao)
VALUES
('Celular'),
('Notebook'),
('Computador'),
('Tablet'),
('Impressora');

-- ronaldo - clientes 
INSERT INTO public.clientes (nome, cpf, email, telefone, endereco_id, ativo) VALUES
('Ana Clara Souza', '12345678901', 'ana.souza@email.com', '11987654321', 1, true),
('Carlos Eduardo Lima', '23456789012', 'carlos.lima@email.com', '21976543210', 2, true),
('Beatriz Mendes Rocha', '34567890123', 'beatriz.rocha@email.com', '31965432109', 3, true),
('Lucas Gabriel Martins', '45678901234', 'lucas.martins@email.com', '41954321098', 4, false),
('Mariana Costa Ribeiro', '56789012345', 'mariana.ribeiro@email.com', '51943210987', 5, true);


-- domingos - equipamentos
INSERT INTO equipamentos (cliente_id, tipo_id, marca_id, cor, tamanho, ano, serie, observacao) VALUES 
(1, 1, 1, 'Prata', '14 Polegadas', '2025', 'BRLPT001', 'Notebook corporativo - Funcionário 1'),
(1, 1, 2, 'Prata', '14 Polegadas', '2025', 'BRLPT002', 'Notebook corporativo - Funcionário 2'),
(1, 2, 5, 'Preto', '6.1 Polegadas', '2026', 'BRCEL001', 'Notebook corporativo - Funcionário 3'),
(1, 3, 4, 'Preto', '24 Polegadas', '2024', 'BRMON001', 'Notebook corporativo - Funcionário 4'),
(1, 1, 3, 'Cinza', '15.6 Polegadas', '2026', 'BRLPT003', 'Notebook de alta performance - Funcionário 5');

-- ALTERAÇÃO EM DADOS DA TABELA
UPDATE equipamentos SET cliente_id = 2 WHERE tipo_id = 2;


UPDATE equipamentos SET cliente_id = 2 WHERE id = 4;

select * from equipamentos

