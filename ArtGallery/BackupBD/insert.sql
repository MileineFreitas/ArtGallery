-- INSERÇÃO DE DADOS

INSERT INTO usuario (nome_usu, nome_comp, email_usu, senha_usu, tipo_usu)
VALUES
('ana01', 'Ana Souza', 'ana01@email.com', 'senha123', 'apr'),
('bruno02', 'Bruno Lima', 'bruno02@email.com', 'senha123', 'apr'),
('carla03', 'Carla Alves', 'carla03@email.com', 'senha123', 'apr'),
('daniel04', 'Daniel Rocha', 'daniel04@email.com', 'senha123', 'adm'),
('edu05', 'Eduardo Silva', 'edu05@email.com', 'senha123', 'apr'),
('flavia06', 'Flávia Martins', 'flavia06@email.com', 'senha123', 'apr'),
('gabriel07', 'Gabriel Nunes', 'gabriel07@email.com', 'senha123', 'apr'),
('helen08', 'Helen Teixeira', 'helen08@email.com', 'senha123', 'apr'),
('igor09', 'Igor Fernandes', 'igor09@email.com', 'senha123', 'apr'),
('juliana10', 'Juliana Ribeiro', 'juliana10@email.com', 'senha123', 'apr');
//novos
INSERT INTO usuario (nome_usu, nome_comp, email_usu, senha_usu, tipo_usu)
VALUES
('mileinefreitas', 'Mileine Freitas', 'mileine.freitas@email.com', 'senha123', 'adm'),
('artlover22', 'Ana Silva', 'ana.silva@email.com', 'senha123', 'art'),
('paintmaster', 'Carlos Mendes', 'carlos.mendes@email.com', 'senha123', 'art'),
('galleryadmin', 'Mariana Oliveira', 'admin@gallery.com', 'senha123', 'art'),
('modern_art', 'Roberto Santos', 'roberto.art@email.com', 'senha123', 'art'),
('artcollector', 'Fernanda Lima', 'fernanda.lima@email.com', 'senha123', 'art');

INSERT INTO artista (nome_usu, nome_comp, bio_art, id_usu)
VALUES
('ana01', 'Ana Souza', 'Pintora surrealista', 1),
('bruno02', 'Bruno Lima', 'Artista contemporâneo', 2),
('carla03', 'Carla Alves', 'Obras em aquarela', 3),
('edu05', 'Eduardo Silva', 'Escultor moderno', 5),
('flavia06', 'Flávia Martins', 'Retratista', 6),
('gabriel07', 'Gabriel Nunes', 'Arte digital', 7),
('helen08', 'Helen Teixeira', 'Minimalista', 8),
('igor09', 'Igor Fernandes', 'Arte urbana', 9),
('juliana10', 'Juliana Ribeiro', 'Abstracionismo', 10),
('daniel04', 'Daniel Rocha', 'Fotografia artística', 4);

INSERT INTO categoria (nome_cat, descricao_cat, foto_cat)
VALUES
('Pintura', 'Obras feitas com tinta', '/uploads/categorias/1.jpg'),
('Escultura', 'Obras em 3D esculpidas', '/uploads/categorias/2.jpg'),
('Fotografia', 'Capturas fotográficas', '/uploads/categorias/3.jpg'),
('Arte Digital', 'Obras criadas digitalmente', '/uploads/categorias/4.jpg'),
('Desenho', 'Obras em grafite/lápis', '/uploads/categorias/5.jpg'),
('Abstrata', 'Arte não figurativa', '/uploads/categorias/6.jpg'),
('Surrealismo', 'Obras surreais e oníricas', '/uploads/categorias/7.jpg'),
('Retrato', 'Foco em pessoas', '/uploads/categorias/8.jpg'),
('Paisagem', 'Foco em cenários naturais', '/uploads/categorias/9.jpg'),
('Minimalista', 'Composições simples', '/uploads/categorias/10.jpg');

INSERT INTO obra (titulo_obr, descricao_obr, situacao_obr, foto_obr, id_cat, id_art)
VALUES
('Sonho Azul', 'Pintura surreal', 1, '/uploads/imagem.png', 7, 1),
('Cidade Cinza', 'Grafite urbano', 1, '/uploads/imagem.png', 8, 9),
('Reflexos', 'Foto noturna', 1, '/uploads/imagem.png', 3, 10),
('Rostos', 'Retratos expressivos', 1, '/uploads/imagem.png', 8, 6),
('Natureza Bruta', 'Escultura em pedra', 1, '/uploads/imagem.png', 2, 5),
('Luz e Sombra', 'Arte minimalista', 1, '/uploads/imagem.png', 10, 8),
('Chamas Digitais', 'Arte digital em vermelho', 1, '/uploads/imagem.png', 4, 7),
('Jardim Invisível', 'Pintura surrealista', 1, '/uploads/imagem.png', 1, 1),
('Horizonte Vazio', 'Desenho monocromático', 1, '/uploads/imagem.png', 5, 3),
('Vento Norte', 'Paisagem montanhosa', 1, '/uploads/imagem.png', 9, 2);

INSERT INTO colecao (nome_col, id_usu)
VALUES
('Coleção Aquarela', 3),
('Coleção Urbana', 9),
('Coleção Luzes', 10),
('Coleção Clássica', 5),
('Coleção Sombras', 8),
('Coleção Abstrata', 1),
('Coleção Natureza', 2),
('Coleção Digital', 7),
('Coleção Retrato', 6),
('Coleção Experimental', 4);

INSERT INTO obra_colecao (id_obr, id_col)
VALUES
(1, 6),
(2, 2),
(3, 3),
(4, 9),
(5, 4),
(6, 5),
(7, 8),
(8, 6),
(9, 1),
(10, 7);

INSERT INTO comentario (id_usu, id_obr, texto_com)
VALUES
(2, 1, 'Obra fantástica!'),
(3, 2, 'Muito criativa!'),
(4, 3, 'Adorei a iluminação.'),
(5, 4, 'Incrível retrato.'),
(6, 5, 'Escultura impactante.'),
(7, 6, 'Simples e belo.'),
(8, 7, 'Cores vibrantes.'),
(9, 8, 'Surreal mesmo!'),
(10, 9, 'Muito expressivo.'),
(1, 10, 'Cenário inspirador.');

INSERT INTO favorito_obra (id_usu, id_obr, ativo)
VALUES
(1, 3, 1),
(2, 4, 1),
(3, 5, 1),
(4, 1, 1),
(5, 2, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

INSERT INTO liberacao_artista (status_lib, id_usu)
VALUES
('a', 1),
('a', 2),
('p', 3),
('a', 4),
('r', 5),
('p', 6),
('a', 7),
('p', 8),
('a', 9),
('a', 10);

INSERT INTO seguidor_artista (id_seguidor, id_artista)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

INSERT INTO suporte (email_sup, assunto_sup, descricao_sup)
VALUES
('ana01@email.com', 'Erro no login', 'Não consigo acessar minha conta.'),
('bruno02@email.com', 'Obra sumiu', 'Minha obra foi removida.'),
('carla03@email.com', 'Alterar senha', 'Como trocar minha senha?'),
('daniel04@email.com', 'Conta bloqueada', 'Recebi uma advertência injusta.'),
('edu05@email.com', 'Imagem da obra', 'Como faço upload da foto?'),
('flavia06@email.com', 'Problema de carregamento', 'Site muito lento.'),
('gabriel07@email.com', 'Cobrança indevida', 'Fui cobrado indevidamente.'),
('helen08@email.com', 'Dados errados', 'Meu nome está errado.'),
('igor09@email.com', 'Revisar perfil', 'Atualizei o perfil, mas não aparece.'),
('juliana10@email.com', 'Reportar bug', 'Encontrei um erro no envio de obras.');

UPDATE categoria SET descricao_cat = 'Obras visuais criadas com tinta sobre tela, papel ou outros suportes, explorando cores, formas e texturas.' WHERE id_cat = 1;
UPDATE categoria SET descricao_cat = 'Representações tridimensionais esculpidas em pedra, madeira, argila ou materiais modernos, com valor estético e simbólico.' WHERE id_cat = 2;
UPDATE categoria SET descricao_cat = 'Imagens captadas por câmeras que registram momentos, expressões, paisagens e cenas com composição artística.' WHERE id_cat = 3;
UPDATE categoria SET descricao_cat = 'Obras produzidas com ferramentas digitais como softwares gráficos, IA, renderizações 3D e manipulações de imagem.' WHERE id_cat = 4;
UPDATE categoria SET descricao_cat = 'Representações feitas com grafite, lápis, carvão ou tinta, geralmente em papel, com foco em linhas, formas e sombreamento.' WHERE id_cat = 5;
UPDATE categoria SET descricao_cat = 'Arte sem representação direta da realidade, usando formas, cores e gestos para transmitir ideias ou emoções.' WHERE id_cat = 6;
UPDATE categoria SET descricao_cat = 'Obras que exploram o inconsciente, os sonhos e o imaginário, com elementos fantásticos e composições oníricas.' WHERE id_cat = 7;
UPDATE categoria SET descricao_cat = 'Representações artísticas de pessoas, com foco no rosto, expressões faciais e personalidade do retratado.' WHERE id_cat = 8;
UPDATE categoria SET descricao_cat = 'Obras que retratam ambientes naturais como montanhas, florestas, praias e campos, com foco na beleza do cenário.' WHERE id_cat = 9;
UPDATE categoria SET descricao_cat = 'Composições simples e diretas que valorizam o essencial, com poucos elementos, cores neutras e formas geométricas.' WHERE id_cat = 10;

INSERT INTO qtd_seguidores (id_usu)
SELECT id_usu FROM usuario
WHERE id_usu NOT IN (SELECT id_usu FROM qtd_seguidores);

INSERT INTO qtd_seguindo (id_usu)
SELECT id_usu FROM usuario
WHERE id_usu NOT IN (SELECT id_usu FROM qtd_seguindo);

-- VIEWS & TRIGGERS

-- Quantidade de favoritos por obra
CREATE VIEW qtd_favoritos AS
SELECT id_obr, COUNT(*) AS total_favoritos
FROM favorito_obra
WHERE ativo = 1
GROUP BY id_obr;

-- Quantidade de comentários por obra
CREATE VIEW qtd_comentarios AS
SELECT id_obr, COUNT(id_com) AS total_comentarios
FROM comentario
GROUP BY id_obr;

-- Comentários detalhados de cada obra
CREATE VIEW comentarios_da_obra AS
SELECT id_obr, id_usu, texto_com
FROM comentario;

-- Coleções de usuários com detalhes das obras
CREATE VIEW colecoes_usuario AS
SELECT 
    c.nome_col,
    c.id_usu,
    oco.id_obr,
    oco.id_col,
    o.titulo_obr,
    o.descricao_obr,
    o.situacao_obr,
    o.id_cat,
    o.id_art
FROM colecao c
INNER JOIN obra_colecao oco ON c.id_col = oco.id_col
INNER JOIN obra o ON oco.id_obr = o.id_obr;

-- Retornos da barra de pesquisa
CREATE VIEW pesquisar AS
SELECT u.nome_usu, u.nome_comp, NULL AS nome_cat, NULL AS titulo_obr
FROM usuario u
WHERE u.tipo_usu = 'art'
UNION ALL
SELECT NULL, NULL, c.nome_cat, NULL
FROM categoria c
UNION ALL
SELECT NULL, NULL, NULL, o.titulo_obr
FROM obra o;

-- Advertência de usuários
CREATE VIEW advertencia_usuarios AS
SELECT u.id_usu, u.nome_usu, u.nome_comp, u.advertencia_usu
FROM usuario u
WHERE u.advertencia_usu > 0;

-- Banimento de usuários
CREATE VIEW banimento_usuarios AS
SELECT u.id_usu, u.nome_usu, u.nome_comp, u.ban_usu
FROM usuario u
WHERE u.ban_usu = 1;

-- Trigger para inserir artista automaticamente ao cadastrar usuário
DELIMITER //
CREATE TRIGGER trg_pos_insert_usuario_art
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
  IF NEW.tipo_usu = 'art' THEN
    INSERT INTO liberacao_artista (id_usu, status_lib)
    VALUES (NEW.id_usu, 'p');
  END IF;
END;
//
DELIMITER ;

-- Trigger para atualizar artista ao liberar artista
DELIMITER //
CREATE TRIGGER trg_pos_update_liberacao_artista
AFTER UPDATE ON liberacao_artista
FOR EACH ROW
BEGIN
  IF NEW.status_lib = 'l' AND OLD.status_lib != 'l' THEN
    INSERT INTO artista (nome_usu, nome_comp, bio_art, id_usu)
    SELECT nome_usu, nome_comp, 
           CONCAT('Bem-vindo ao perfil do artista ', nome_comp, '!'), 
           id_usu
    FROM usuario
    WHERE id_usu = NEW.id_usu;
  END IF;
END;
//
DELIMITER ;

-- Marcar e desmarcar favoritos
DELIMITER |
CREATE TRIGGER obra_ja_favoritada
BEFORE INSERT ON favorito_obra
FOR EACH ROW
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM favorito_obra
    WHERE id_usu = NEW.id_usu AND id_obr = NEW.id_obr;

    IF existe > 0 THEN
        UPDATE favorito_obra
        SET ativo = IF(ativo = 1, 0, 1)
        WHERE id_usu = NEW.id_usu AND id_obr = NEW.id_obr;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Atualizado favorito existente'; -- evita INSERT real
    END IF;
END|
DELIMITER ;

-- Banimento automático ao atingir 2 advertências
DELIMITER |
CREATE TRIGGER banir
AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
    IF NEW.advertencia_usu >= 2 THEN
        UPDATE usuario
        SET ban_usu = 1
        WHERE id_usu = NEW.id_usu;
    END IF;
END|
DELIMITER ;


DELIMITER //
--Trigger após inserção (seguindo alguém)
CREATE TRIGGER trg_after_insert_seguidores
AFTER INSERT ON seguidores
FOR EACH ROW
BEGIN
  -- Incrementa total_seguindo do seguidor
  UPDATE qtd_seguindo
  SET total_seguindo = total_seguindo + 1
  WHERE id_usu = NEW.seguidor_id;

  -- Incrementa total_seguidores do seguido
  UPDATE qtd_seguidores
  SET total_seguidores = total_seguidores + 1
  WHERE id_usu = NEW.seguido_id;
END;
//
DELIMITER ;


DELIMITER //
--Trigger após remoção (deixar de seguir)
CREATE TRIGGER trg_after_delete_seguidores
AFTER DELETE ON seguidores
FOR EACH ROW
BEGIN
  -- Decrementa total_seguindo do seguidor
  UPDATE qtd_seguindo
  SET total_seguindo = total_seguindo - 1
  WHERE id_usu = OLD.seguidor_id;

  -- Decrementa total_seguidores do seguido
  UPDATE qtd_seguidores
  SET total_seguidores = total_seguidores - 1
  WHERE id_usu = OLD.seguido_id;
END;
//
DELIMITER ;