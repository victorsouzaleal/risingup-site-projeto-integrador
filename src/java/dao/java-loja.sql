-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Set-2018 às 01:11
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 7.1.7

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
(1, 1, 'Você é aficionado por games e precisa de uma máquina que te acompanhe, certo? Conheça o Raptor, um computador desenvolvido pela Rising UP!', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es do Produto</p>', '8f7906d0-c66e-47af-a156-c1773aa51ab1.jpg', 'bf5722c9-92d2-4945-ba8e-24fdc3047c14.jpg', 'f773308e-a79e-43b0-95c6-a31c1c3f5d03.jpg', 'Neuron', 'Intel Core i5-7600 - SSD 250GB + HD 1 TB - RAM 16GB -  Nvidia Geforce  GTX 1070', 3500, 200, 1),
(2, 1, 'Texto para galeriaO Firestorm chega a sua 4ª edição! Agora ainda mais moderno, mais rápido e mais impressionante! No seu coração pulsa o poderoso e novíssimo i5.', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es :</p>', '54e7852a-ecdd-4d5c-812f-2fed0e7334eb.jpg', 'a56adea1-9b13-4c24-b895-0674166f9c10.jpg', '341c93db-c71c-47ae-a627-edb83845ac1f.jpg', 'Chronos', 'Intel Core i7-8700K, SSD 250 GB, HD 2 TB - RAM 16GB - AMD Radeon RX Vega 64 HBM2 de 8 GB', 3000, 300, 1),
(3, 1, 'Aguce seus instintos, é hora da caça! Que tal conhecer de perto o poder dessa super-máquina? Equipada com Intel Core i7 e reunindo tudo o que há de melhor.', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es :</p>', 'af5502a9-8569-4239-9e4e-9da1bd9da066.jpg', '1f62ea5e-16c4-4742-9a83-3739cdbd71f9.jpg', 'bd9c5c6b-efef-41c7-8e59-2eca25a58e58.jpg', 'Genesis', 'AMD Ryzen 7 2700 - SSD 250 GB - HD 2 TB - GDDR6 NVIDIA GeForce RTX 2080 Ti de 11 GB', 4500, 200, 1),
(4, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es :</p>', '9644dab4-535c-4bff-a194-a69dfbdf2354.jpg', '0064026b-f7a7-44d2-92a9-f056e372440b.jpg', '55f5cbcd-65dc-4df0-aae2-637fa92258ca.jpg', 'Samsung Odyssey', 'Intel Core i7 8GB - GeForce GTX 1050 de 4GB - 1TB Tela LED Full HD 15,6\" Windows 10', 3500, 200, 2),
(5, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es :</p>', '63a683c6-d13f-4e80-809b-11cca5eb140c.jpg', '070902d2-92b9-4f29-9355-79b4b5279918.jpg', '1506fd91-cd65-4743-8d0c-035248bcdd33.jpg', 'Dell Inspiron 15', 'Intel Core i7 - RAM 8GB - GeForce GTX 1050TI com 4GB - HD 1TB - Tela 15,6\" TN Full HD', 4000, 222, 2),
(6, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es :</p>', 'eed58e5c-d6b2-456f-9b78-20479f473285.png', 'c78d8119-94f7-4385-9278-5dec7d5e84db.jpg', 'bbaf4bc1-6bab-47c1-9bf0-0f5a292c67e1.jpg', 'Lenovo Legion', 'I7-7700HQ - RAM 16GB - HD 1TB - GTX1060 6GB -  Windows 10 - Tela 15,6\"', 5000, 222, 2),
(7, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es</p>', '0ae1aedb-6230-4949-bbb7-efde4448dd2a.jpg', '5fcfbe5c-10de-4f00-aabf-f5c970f0da58.jpg', '2375aceb-a88c-4a97-8a71-6483668f7b48.jpg', 'HyperX Mars', ' O teclado mecânico para jogos HyperX™ Mars RGB™ apresenta backlighting RGB que você pode personalizar com a facilidade de uso do software Genesis', 300, 300, 3),
(8, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especificacoes</p>', 'b9ce0047-1a9b-46e2-a7f3-de118e013e9c.jpg', '9b6f5de6-d8f2-4c95-be66-a6e0bad2aec9.jpg', '', 'Logitech G910', ' Conheça o G910 com seus exclusivos Romer-G-Switches, iluminação RGB inteligente e toneladas de opções para personalizar cores e perfis', 699, 222, 3),
(9, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es</p>', '3efbc35d-7a23-4c7d-84f4-f5d572f4dcd2.jpg', '0228967e-a4f0-4d93-9e0e-b05cd8a43c7c.jpg', '2234da51-08eb-4c24-b201-e40ba93309a0.jpg', 'Masterkeys PRO', 'Um ótimo teclado custo benefício, com um ótimo visual, o Masterkeys PRO L RGB oferece uma das melhores experiências gamer no mercado.', 249, 222, 3),
(10, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especificacoes</p>', '63de1836-2cfc-425b-a4af-9ffeaed380d0.jpg', '7f06f567-f317-4f48-be18-589c520809cd.jpg', 'd0bbccb7-27e4-4024-9afd-709fc73ad89e.jpg', 'Razer Epic Chroma', 'Em qualquer MMO, quanto mais feitiços você tiver à disposição, maior torna-se sua vantagem. Agora permitindo que você mapeie e acesse mais habilidades.', 699, 222, 4),
(11, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es</p>', '1da76932-c566-4252-81f1-c56015835561.jpg', 'd547c68a-bf8d-4914-bce2-8f7f3d3c3cb0.jpg', 'edb558c7-5666-4fbb-9b97-beedc1b71dab.jpeg', 'Overwatch Elite', 'Para comemorar o aniversário de Overwatch, o mouse de jogo preferido dos agentes Overwatch vem não só com uma nova pele, mas características melhoradas.', 349, 200, 4),
(12, 1, 'Texto para galeria', '<p style=\"text-align: center;\">Especifica&ccedil;&otilde;es</p>', 'f00d7caa-7838-4467-a03b-b98149c4a427.jpg', 'ee0d8e9c-388c-424f-9135-6c0e08f54683.jpg', '3ba994e6-529f-4a5f-933b-cbe06ce1aa1f.jpg', 'Logitech Spectrum', ' CALIBRADO. AFINADO. DESTRUIDOR!** Proteus Core – a solução para qualquer desafio. FPS, MMO, RTS, seja qual for o estilo de jogo, superfície ou competição.', 199, 200, 4);

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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
