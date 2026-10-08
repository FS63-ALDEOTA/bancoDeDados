
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
