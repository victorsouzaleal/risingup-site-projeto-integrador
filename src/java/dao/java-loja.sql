-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Out-2018 às 13:53
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java-loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `ID` bigint(20) NOT NULL,
  `ICONE1` varchar(255) DEFAULT NULL,
  `ICONE2` varchar(255) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`ID`, `ICONE1`, `ICONE2`, `NOME`) VALUES
(1, '4ec83247-e36e-463e-8ed6-56ba3a9cf9f9.png', '', 'Computador'),
(2, '8108d8ef-ddc9-4873-af42-296a6754c614.png', '', 'Notebook'),
(3, '6987a780-8563-40f7-a865-6e2b424d69f1.png', NULL, 'Teclado'),
(4, '9ac4a274-9796-41c1-a44b-395c2665c829.png', NULL, 'Mouse');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `CEP` varchar(255) NOT NULL,
  `BAIRRO` varchar(255) DEFAULT NULL,
  `CIDADE` varchar(255) DEFAULT NULL,
  `LOGRADOURO` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`CEP`, `BAIRRO`, `CIDADE`, `LOGRADOURO`, `UF`) VALUES
('23058230', 'Cosmos', 'Rio de Janeiro', 'Rua Pacuaré', 'RJ'),
('23058250', 'Cosmos', 'Rio de Janeiro', 'Rua Jacareuba', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `ID` bigint(20) NOT NULL,
  `QUANT` int(11) DEFAULT NULL,
  `VALORITENS` double DEFAULT NULL,
  `PEDIDO_ID` bigint(20) DEFAULT NULL,
  `PRODUTO_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item_pedido`
--

INSERT INTO `item_pedido` (`ID`, `QUANT`, `VALORITENS`, `PEDIDO_ID`, `PRODUTO_ID`) VALUES
(1, 1, 33, 1, 1),
(2, 1, 33, 51, 1),
(3, 333, 10989, 101, 1),
(4, 2, 666, 151, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `ID` bigint(20) NOT NULL,
  `DATAPEDIDO` datetime DEFAULT NULL,
  `FECHADO` tinyint(1) NOT NULL DEFAULT '0',
  `FRETE` double DEFAULT NULL,
  `PAGO` tinyint(1) NOT NULL DEFAULT '0',
  `TOTAL` double DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  `CLIENTE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`ID`, `DATAPEDIDO`, `FECHADO`, `FRETE`, `PAGO`, `TOTAL`, `VALOR`, `CLIENTE_ID`) VALUES
(1, '2018-09-07 11:14:10', 1, 50, 0, 83, 33, 1),
(51, '2018-09-07 18:01:08', 1, 50, 0, 83, 33, 1),
(101, '2018-09-09 11:30:04', 1, 50, 0, 11039, 10989, 1),
(151, '2018-09-12 12:53:23', 1, 50, 0, 716, 666, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID` bigint(20) NOT NULL,
  `ATIVO` tinyint(1) DEFAULT '0',
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `ESPECIFICACAO` varchar(30000) NOT NULL,
  `FOTO1` varchar(255) DEFAULT NULL,
  `FOTO2` varchar(255) DEFAULT NULL,
  `FOTO3` varchar(255) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `NOME_DETALHADO` varchar(500) NOT NULL,
  `PRECO` float DEFAULT NULL,
  `QUANT` int(11) DEFAULT NULL,
  `CATEGORIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`ID`, `ATIVO`, `DESCRICAO`, `ESPECIFICACAO`, `FOTO1`, `FOTO2`, `FOTO3`, `NOME`, `NOME_DETALHADO`, `PRECO`, `QUANT`, `CATEGORIA_ID`) VALUES
(1, 1, 'Você é aficionado por games e precisa de uma máquina que te acompanhe, certo? Conheça o Raptor, um computador desenvolvido pela Rising UP!', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">Intel Core i5-7600</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Placa de v&iacute;deo</td>\r\n<td style=\"width: 50%;\">GeForce GTX 1070 8 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Mem&oacute;ria RAM</td>\r\n<td style=\"width: 50%;\">16GB DDR4-2400 (2x 8GB)</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">SSD</td>\r\n<td style=\"width: 50%;\">Samsung 860 EVO de 250 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">HD</td>\r\n<td style=\"width: 50%;\">1 TB Seagate BarraCuda</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Fonte de alimenta&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">500W</td>\r\n</tr>\r\n</tbody>\r\n</table>', '8f7906d0-c66e-47af-a156-c1773aa51ab1.jpg', 'bf5722c9-92d2-4945-ba8e-24fdc3047c14.jpg', 'f773308e-a79e-43b0-95c6-a31c1c3f5d03.jpg', 'Neuron', 'Intel Core i5-7600 - SSD 250GB + HD 1 TB - RAM 16GB -  Nvidia Geforce  GTX 1070', 3500, 200, 1),
(2, 1, 'Texto para galeriaO Firestorm chega a sua 4ª edição! Agora ainda mais moderno, mais rápido e mais impressionante! No seu coração pulsa o poderoso e novíssimo i5.', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">AMD Ryzen 1920X</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Placa de v&iacute;deo</td>\r\n<td style=\"width: 50%;\">GeForce GTX 1070 Ti 8 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Mem&oacute;ria RAM</td>\r\n<td style=\"width: 50%;\">16GB DDR4-2400 Corsair</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">SSD</td>\r\n<td style=\"width: 50%;\">Samsung 860 EVO de 250 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">HD</td>\r\n<td style=\"width: 50%;\">2 TB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Fonte de alimenta&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">600W</td>\r\n</tr>\r\n</tbody>\r\n</table>', '54e7852a-ecdd-4d5c-812f-2fed0e7334eb.jpg', 'a56adea1-9b13-4c24-b895-0674166f9c10.jpg', '341c93db-c71c-47ae-a627-edb83845ac1f.jpg', 'Chronos', 'Intel Core i7-8700K, SSD 250 GB, HD 2 TB - RAM 16GB - AMD Radeon RX Vega 64 HBM2 de 8 GB', 3000, 300, 1),
(3, 1, 'Aguce seus instintos, é hora da caça! Que tal conhecer de perto o poder dessa super-máquina? Equipada com Intel Core i7 e reunindo tudo o que há de melhor.', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">AMD Ryzen 7 2700</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Placa de v&iacute;deo</td>\r\n<td style=\"width: 50%;\">GeForce RTX 2080 Ti de 11 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Mem&oacute;ria RAM</td>\r\n<td style=\"width: 50%;\">16GB DDR4-2400 Corsair</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">SSD</td>\r\n<td style=\"width: 50%;\">Samsung 860 EVO de 250 GB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">HD</td>\r\n<td style=\"width: 50%;\">2 TB Seagate BarraCuda</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Fonte de alimenta&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">600W</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'af5502a9-8569-4239-9e4e-9da1bd9da066.jpg', '1f62ea5e-16c4-4742-9a83-3739cdbd71f9.jpg', 'bd9c5c6b-efef-41c7-8e59-2eca25a58e58.jpg', 'Genesis', 'AMD Ryzen 7 2700 - SSD 250 GB - HD 2 TB - GDDR6 NVIDIA GeForce RTX 2080 Ti de 11 GB', 4500, 200, 1),
(4, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Samsung</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">Odyssey</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Cor</td>\r\n<td style=\"width: 50%;\">Preto</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Polegadas da Tela</td>\r\n<td style=\"width: 50%;\">15.6\"</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sistema Operacional</td>\r\n<td style=\"width: 50%;\">Windows 10</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">Intel Core i7</td>\r\n</tr>\r\n</tbody>\r\n</table>', '9644dab4-535c-4bff-a194-a69dfbdf2354.jpg', '0064026b-f7a7-44d2-92a9-f056e372440b.jpg', '55f5cbcd-65dc-4df0-aae2-637fa92258ca.jpg', 'Samsung Odyssey', 'Intel Core i7 8GB - GeForce GTX 1050 de 4GB - 1TB Tela LED Full HD 15,6', 3500, 200, 2),
(5, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Dell</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">7567-A20P</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Cor</td>\r\n<td style=\"width: 50%;\">Preto</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Polegadas da Tela</td>\r\n<td style=\"width: 50%;\">15.6\"</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sistema Operacional</td>\r\n<td style=\"width: 50%;\">Windows 10</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">Intel Core i7</td>\r\n</tr>\r\n</tbody>\r\n</table>', '63a683c6-d13f-4e80-809b-11cca5eb140c.jpg', '070902d2-92b9-4f29-9355-79b4b5279918.jpg', '1506fd91-cd65-4743-8d0c-035248bcdd33.jpg', 'Dell Inspiron 15', 'Intel Core i7 - RAM 8GB - GeForce GTX 1050TI com 4GB - HD 1TB - Tela 15,6', 4000, 222, 2),
(6, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">Legion Y720 I7-7700HQ</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Lenovo</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Cor</td>\r\n<td style=\"width: 50%;\">Preto</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sistema Operacional</td>\r\n<td style=\"width: 50%;\">Windows 10 Home</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Polegadas da Tela</td>\r\n<td style=\"width: 50%;\">15.6\"</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Processador</td>\r\n<td style=\"width: 50%;\">Intel Core i7</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'eed58e5c-d6b2-456f-9b78-20479f473285.png', 'c78d8119-94f7-4385-9278-5dec7d5e84db.jpg', 'bbaf4bc1-6bab-47c1-9bf0-0f5a292c67e1.jpg', 'Lenovo Legion', 'I7-7700HQ - RAM 16GB - HD 1TB - GTX1060 6GB -  Windows 10 - Tela 15,6', 5000, 222, 2),
(7, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">HyperX</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">Mars</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de teclado</td>\r\n<td style=\"width: 50%;\">Mec&acirc;nico</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB 2.0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Velocidade do USB</td>\r\n<td style=\"width: 50%;\">Velocidade m&aacute;xima</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Ilumina&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">RGB</td>\r\n</tr>\r\n</tbody>\r\n</table>', '0ae1aedb-6230-4949-bbb7-efde4448dd2a.jpg', '5fcfbe5c-10de-4f00-aabf-f5c970f0da58.jpg', '2375aceb-a88c-4a97-8a71-6483668f7b48.jpg', 'HyperX Mars', ' O teclado mecânico para jogos HyperX™ Mars RGB™ apresenta backlighting RGB que você pode personalizar com a facilidade de uso do software Genesis', 300, 300, 3),
(8, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Logitech</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">G910</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de teclado</td>\r\n<td style=\"width: 50%;\">Mec&acirc;nico</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB 2.0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Velocidade do USB</td>\r\n<td style=\"width: 50%;\">Velocidade m&aacute;xima</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Ilumina&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">RGB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: center;\">&nbsp;</p>', 'b9ce0047-1a9b-46e2-a7f3-de118e013e9c.jpg', '9b6f5de6-d8f2-4c95-be66-a6e0bad2aec9.jpg', '', 'Logitech G910', ' Conheça o G910 com seus exclusivos Romer-G-Switches, iluminação RGB inteligente e toneladas de opções para personalizar cores e perfis', 699, 222, 3),
(9, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Cooler Master</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">MasterKeys PRO L</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de teclado</td>\r\n<td style=\"width: 50%;\">Mec&acirc;nico (Switch Brown)</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB 2.0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Velocidade do USB</td>\r\n<td style=\"width: 50%;\">Velocidade m&aacute;xima</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Ilumina&ccedil;&atilde;o</td>\r\n<td style=\"width: 50%;\">RGB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: center;\"><br /><br /></p>', '3efbc35d-7a23-4c7d-84f4-f5d572f4dcd2.jpg', '0228967e-a4f0-4d93-9e0e-b05cd8a43c7c.jpg', '2234da51-08eb-4c24-b201-e40ba93309a0.jpg', 'Masterkeys PRO', 'Um ótimo teclado custo benefício, com um ótimo visual, o Masterkeys PRO L RGB oferece uma das melhores experiências gamer no mercado.', 249, 222, 3),
(10, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Razer</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">Naga Epic Chroma</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sensor</td>\r\n<td style=\"width: 50%;\">Laser</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo</td>\r\n<td style=\"width: 50%;\">Mouse Sem Fio</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de Conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">DPI</td>\r\n<td style=\"width: 50%;\">8.200</td>\r\n</tr>\r\n</tbody>\r\n</table>', '63de1836-2cfc-425b-a4af-9ffeaed380d0.jpg', '7f06f567-f317-4f48-be18-589c520809cd.jpg', 'd0bbccb7-27e4-4024-9afd-709fc73ad89e.jpg', 'Razer Epic Chroma', 'Em qualquer MMO, quanto mais feitiços você tiver à disposição, maior torna-se sua vantagem. Agora permitindo que você mapeie e acesse mais habilidades.', 699, 222, 4),
(11, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Razer</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">DeathAdder Elite Overwatch</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sensor</td>\r\n<td style=\"width: 50%;\">&Oacute;ptico 4G</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo</td>\r\n<td style=\"width: 50%;\">Mouse com fio</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de Conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">DPI</td>\r\n<td style=\"width: 50%;\">16.000</td>\r\n</tr>\r\n</tbody>\r\n</table>', '1da76932-c566-4252-81f1-c56015835561.jpg', 'd547c68a-bf8d-4914-bce2-8f7f3d3c3cb0.jpg', 'edb558c7-5666-4fbb-9b97-beedc1b71dab.jpeg', 'Overwatch Elite', 'Para comemorar o aniversário de Overwatch, o mouse de jogo preferido dos agentes Overwatch vem não só com uma nova pele, mas características melhoradas.', 349, 200, 4),
(12, 1, 'Texto para galeria', '<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">Marca</td>\r\n<td style=\"width: 50%;\">Logitech</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Modelo</td>\r\n<td style=\"width: 50%;\">G502</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Sensor</td>\r\n<td style=\"width: 50%;\">&Oacute;ptico</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo</td>\r\n<td style=\"width: 50%;\">Mouse com fio</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">Tipo de Conex&atilde;o</td>\r\n<td style=\"width: 50%;\">USB</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">DPI</td>\r\n<td style=\"width: 50%;\">12.000</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'f00d7caa-7838-4467-a03b-b98149c4a427.jpg', 'ee0d8e9c-388c-424f-9135-6c0e08f54683.jpg', '3ba994e6-529f-4a5f-933b-cbe06ce1aa1f.jpg', 'Logitech Spectrum', ' CALIBRADO. AFINADO. DESTRUIDOR!** Proteus Core – a solução para qualquer desafio. FPS, MMO, RTS, seja qual for o estilo de jogo, superfície ou competição.', 199, 200, 4),
(13, 1, 'oi', '<table class=\"table\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Marca</td>\r\n<td>Logitech</td>\r\n</tr>\r\n<tr>\r\n<td>Modelo</td>\r\n<td>G503</td>\r\n</tr>\r\n<tr>\r\n<td>Sensor</td>\r\n<td>&Oacute;ptico</td>\r\n</tr>\r\n<tr>\r\n<td>Tipo</td>\r\n<td>Mouse com fio</td>\r\n</tr>\r\n<tr>\r\n<td>Tipo de Conex&atilde;o</td>\r\n<td>USB</td>\r\n</tr>\r\n<tr>\r\n<td>DPI</td>\r\n<td>12.000</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ea91867e-4925-4847-890b-ff4ead2355ef.jpg', '1c58bd2a-465c-4aa3-b7c3-e110c968e49c.jpg', '72d24636-78bd-4d5a-bdbb-e9a3faae9d18.jpg', 'LOGITECH G403', 'O novo mouse Prodigy G403 é capaz de atender o mais exigente jogador no quesito performance e desempenho.', 100, 2, 4),
(14, 1, 'oioi', '<table class=\"table\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Marca</td>\r\n<td>CORSAIR</td>\r\n</tr>\r\n<tr>\r\n<td>Modelo</td>\r\n<td>K55 RGB</td>\r\n</tr>\r\n<tr>\r\n<td>Tipo de teclado</td>\r\n<td>Membrana</td>\r\n</tr>\r\n<tr>\r\n<td>Tipo de conex&atilde;o</td>\r\n<td>USB 2.0</td>\r\n</tr>\r\n<tr>\r\n<td>Velocidade do USB</td>\r\n<td>Velocidade m&aacute;xima</td>\r\n</tr>\r\n<tr>\r\n<td>Ilumina&ccedil;&atilde;o</td>\r\n<td>RGB</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'a14524cc-2c20-4a98-87ad-90c54e67966e.jpg', '4a67969b-cd93-4a20-a15b-a8b1eab17261.png', 'bc8d1309-86c7-4a30-9984-7b6b601adfff.png', 'CORSAIR K55', 'O K55 RGB é o primeiro passo para melhorar o desempenho. Modos intuitivos de luz de fundo RGB, 6 teclas macro dedicadas, anti-ghosting multi-key e controles de mídia on-the-fly fornecem a personalização e controle essenciais para a vitória.', 300, 3, 3),
(15, 1, 'oioioi', '<table class=\"table\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Modelo</td>\r\n<td>TITAN PRO-202</td>\r\n</tr>\r\n<tr>\r\n<td>Marca</td>\r\n<td>MSI</td>\r\n</tr>\r\n<tr>\r\n<td>Cor</td>\r\n<td>Preto</td>\r\n</tr>\r\n<tr>\r\n<td>Sistema Operacional</td>\r\n<td>Windows 10 Home</td>\r\n</tr>\r\n<tr>\r\n<td>Polegadas da Tela</td>\r\n<td>17.3\"</td>\r\n</tr>\r\n<tr>\r\n<td>Processador</td>\r\n<td>Intel Core i7</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'c585690e-7064-4ac7-afd0-fcb068312fd3.png', '4827a63b-d235-41cf-9ab4-5353651827d3.png', 'b53c03a0-cba5-495c-abea-8e0e5028baeb.png', 'MSI GT75VR TITAN', 'Intel Core i7 - RAM 16GB - NVIDIA GTX 1080 com 4GB - HD 3TB - Tela 17.3\"', 7000, 7, 2),
(16, 1, 'oioiooioi', '<table class=\"table\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Processador</td>\r\n<td>Intel Core i5-7600</td>\r\n</tr>\r\n<tr>\r\n<td>Placa de v&iacute;deo</td>\r\n<td>GeForce GTX 1070 8 GB</td>\r\n</tr>\r\n<tr>\r\n<td>Mem&oacute;ria RAM</td>\r\n<td>16GB DDR4-2400 (2x 8GB)</td>\r\n</tr>\r\n<tr>\r\n<td>SSD</td>\r\n<td>Samsung 860 EVO de 250 GB</td>\r\n</tr>\r\n<tr>\r\n<td>HD</td>\r\n<td>1 TB Seagate BarraCuda</td>\r\n</tr>\r\n<tr>\r\n<td>Fonte de alimenta&ccedil;&atilde;o</td>\r\n<td>500W</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'a789aa9b-2140-437f-b2c8-1f0cd33ebcac.jpg', '0565180d-ce99-4bfd-8053-63bfd31bcc6f.jpg', '5f8016cf-9ccd-4061-b9c1-f3332f693baf.jpg', 'Millenium', 'Intel Core i5-7600 - SSD 250GB + HD 1 TB - RAM 16GB - Nvidia Geforce GTX 1070', 3200, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '200');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID` bigint(20) NOT NULL,
  `ADMIN` tinyint(1) DEFAULT '0',
  `ATIVO` tinyint(1) DEFAULT '0',
  `COMPLEMENTO` varchar(255) DEFAULT NULL,
  `DATANASC` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `NUMERO` varchar(255) DEFAULT NULL,
  `PWS` varchar(255) DEFAULT NULL,
  `ENDERECO_CEP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `ADMIN`, `ATIVO`, `COMPLEMENTO`, `DATANASC`, `EMAIL`, `NOME`, `NUMERO`, `PWS`, `ENDERECO_CEP`) VALUES
(1, 1, 1, 'Casa 1', '2000-09-01', 'joao@joao', 'Joao', '991', '11111111', '23058230'),
(2, 0, 0, 'Casa 1', '2000-09-01', 'leal@leal', 'Leal', '111', '11111111', '23058230'),
(3, 0, 1, 'Casa 1', '2000-09-01', 'teste@teste.com', 'teste', '222', '11111111', '23058250');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`CEP`);

--
-- Indexes for table `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ITEM_PEDIDO_PEDIDO_ID` (`PEDIDO_ID`),
  ADD KEY `FK_ITEM_PEDIDO_PRODUTO_ID` (`PRODUTO_ID`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PEDIDO_CLIENTE_ID` (`CLIENTE_ID`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRODUTO_CATEGORIA_ID` (`CATEGORIA_ID`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD KEY `FK_USUARIO_ENDERECO_CEP` (`ENDERECO_CEP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `FK_ITEM_PEDIDO_PEDIDO_ID` FOREIGN KEY (`PEDIDO_ID`) REFERENCES `pedido` (`ID`),
  ADD CONSTRAINT `FK_ITEM_PEDIDO_PRODUTO_ID` FOREIGN KEY (`PRODUTO_ID`) REFERENCES `produto` (`ID`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PEDIDO_CLIENTE_ID` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `usuario` (`ID`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FK_PRODUTO_CATEGORIA_ID` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `categoria` (`ID`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_ENDERECO_CEP` FOREIGN KEY (`ENDERECO_CEP`) REFERENCES `endereco` (`CEP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
