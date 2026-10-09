
-- 5 registros para servicos
INSERT INTO servicos
(descricao)
VALUES
('Formatação de computador'),
('Troca de HD'),
('Instalação de sistema operacional'),
('Limpeza interna'),
('Troca de memória RAM');

-- 5 registros para ordem_servico
INSERT INTO ordem_servico
(cliente_id, status_id, funcionario_id, data_entrada, data_saida)
VALUES
(1, 1, 1, '2026-10-01 08:30:00', '2026-10-02 14:00:00'),
(2, 2, 2, '2026-10-02 09:15:00', NULL),
(3, 1, 3, '2026-10-03 10:00:00', '2026-10-04 16:30:00'),
(2, 3, 1, '2026-10-04 13:45:00', NULL),
(5, 2, 4, '2026-10-05 08:00:00', '2026-10-06 11:20:00');



-- 5 registros para itens_ordem_servico
INSERT INTO itens_ordem_servico
(os_id, equipamento_id, status_id, funcionario_id, servico_id, observacao)
VALUES
(1, 1, 2, 1, 1, 'Computador apresentava lentidão e travamentos frequentes.'),
(2, 2, 1, 2, 2, 'HD com setores defeituosos, recomendada substituição.'),
(3, 3, 3, 3, 3, 'Sistema operacional corrompido e necessitando reinstalação.'),
(4, 4, 1, 1, 4, 'Equipamento com excesso de poeira no sistema de refrigeração.'),
(5, 5, 2, 4, 5, 'Memória RAM apresentando falhas durante os testes.');


SELECT * FROM equipamentos;

UPDATE equipamentos SET tipo_id = 3 WHERE id = 5

-- ORDER BY (ASC/DESC) ORDENAÇÃO
SELECT * FROM clientes
ORDER BY id DESC; 


-- BOL (TRUE/FALSE) OU (1/0)
SELECT * FROM clientes ORDER BY ativo DESC



-- Não pode esquecer o where nas queries de UPDATE e DELETE
UPDATE clientes SET email = 'lucas.gabriel@gmail.com' WHERE id = 4;

DELETE FROM clientes WHERE ativo = false;

UPDATE clientes SET ativo = false WHERE id = 1;

ALTER TABLE clientes ALTER COLUMN telefone DROP NOT NULL;

UPDATE clientes SET telefone = null WHERE id = 2;


SELECT * FROM clientes ORDER BY telefone ASC, id ASC ;


SELECT * FROM public.ordem_servico
ORDER BY id ASC 

-- 5 registros para servicos
INSERT INTO servicos
(descricao)
VALUES
('Formatação de computador'),
('Troca de HD'),
('Instalação de sistema operacional'),
('Limpeza interna'),
('Troca de memória RAM');

SELECT * FROM servicos;

-- 5 registros para ordem_servico
INSERT INTO ordem_servico
(cliente_id, status_id, funcionario_id, data_entrada, data_saida)
VALUES
(1, 1, 1, '2026-10-01 08:30:00', '2026-10-02 14:00:00'),
(2, 2, 2, '2026-10-02 09:15:00', NULL),
(3, 1, 3, '2026-10-03 10:00:00', '2026-10-04 16:30:00'),
(2, 3, 1, '2026-10-04 13:45:00', NULL),
(5, 2, 4, '2026-10-05 08:00:00', '2026-10-06 11:20:00');



-- 5 registros para itens_ordem_servico
INSERT INTO itens_ordem_servico
(os_id, equipamento_id, status_id, funcionario_id, servico_id, observacao)
VALUES
(6, 1, 2, 1, 1, 'Computador apresentava lentidão e travamentos frequentes.'),
(7, 2, 1, 2, 2, 'HD com setores defeituosos, recomendada substituição.'),
(8, 3, 3, 3, 3, 'Sistema operacional corrompido e necessitando reinstalação.'),
(9, 4, 1, 1, 4, 'Equipamento com excesso de poeira no sistema de refrigeração.'),
(10, 5, 2, 4, 5, 'Memória RAM apresentando falhas durante os testes.');

INSERT INTO itens_ordem_servico
(os_id, equipamento_id, status_id, funcionario_id, servico_id, observacao)
VALUES
(10, 5, 2, 4, 5, 'Limpeza Preventiva.'),
(10, 5, 2, 4, 5, 'Limpeza Preventiva.'),
(10, 5, 2, 4, 5, 'Limpeza Preventiva.'),
(10, 5, 2, 4, 5, 'Limpeza Preventiva.'),
(10, 5, 2, 4, 5, 'Limpeza Preventiva.'),
(10, 5, 2, 4, 5, 'Limpeza Preventiva.');

SELECT * FROM equipamentos;

UPDATE equipamentos SET tipo_id = 2 WHERE id = 1
UPDATE equipamentos SET tipo_id = 2 WHERE id = 2
UPDATE equipamentos SET tipo_id = 3 WHERE id = 5

ALTER TABLE equipamentos RENAME COLUMN observacao TO descricao;

select * from itens_ordem_servico

-- COUNT (conta a quantidade de registros)

SELECT COUNT(*) AS total_itens_os_10 FROM itens_ordem_servico WHERE os_id = 10;

SELECT COUNT(*) AS total_itens_os_10 FROM itens_ordem_servico WHERE os_id = 10;

-- SUM() (faz somatória de valores)


-- Crie uma query para alterar a tabela de ordem_servico adicionando uma coluna chamada "valor_total_os" esse campo
-- é do tipo decimal(10,2)

ALTER TABLE ordem_servico ADD COLUMN valor_total_os DECIMAL(10,2);


-- Crie uma query para alterar a tabela de itens_ordem_servico adicionando uma coluna chamada "valor_total_item" 
-- esse campo é do tipo decimal(10,2)

ALTER TABLE itens_ordem_servico ADD COLUMN valor_total_os DECIMAL(10,2);

ALTER TABLE itens_ordem_servico RENAME COLUMN valor_total_os TO valor_total_item;

SELECT * FROM itens_ordem_servico;

-- Faça a alteração na tabela de itens_ordem_serviço, passando valores para cada item. 

UPDATE itens_ordem_servico AS i_os SET valor_total_item = v.preco FROM (
	VALUES 
	(1, 200),
	(2, 150),
	(3, 299.99),
	(4, 500),
	(5, 120.50),
	(6, 100),
	(7, 100),
	(8, 100),
	(9, 100),
	(10, 100),
	(11, 100)
) AS v(id, preco) WHERE i_os.id = v.id;


SELECT SUM(valor_total_item) AS total_venda_os FROM itens_ordem_servico WHERE os_id = 10;

UPDATE ordem_servico SET valor_total_os = 720.50 WHERE id = 10;

select * from itens_ordem_servico WHERE os_id = 10;


-- ESTUDEM E PEÇAM PRO CHAT EXPLICAR LINHA A LINHA DAS EXPRESSÕES DE EXEMPLO
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN

-- AVG, MIN, MAX, GROUP BY
