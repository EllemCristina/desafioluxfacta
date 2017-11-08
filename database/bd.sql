-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Nov-2017 às 22:21
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd`
--
CREATE DATABASE IF NOT EXISTS `bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aux_votos`
--

CREATE TABLE `aux_votos` (
  `id_enq` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `opcao` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `aux_votos`
--
DELIMITER $$
CREATE TRIGGER `trg_alt_votos` AFTER INSERT ON `aux_votos` FOR EACH ROW begin 

Set @ID =(SELECT id_enq from aux_votos ORDER BY id DESC LIMIT 1);
Set @op =(SELECT opcao FROM aux_votos ORDER BY id DESC LIMIT 1); 
Set @qtd =(SELECT qtde FROM votos WHERE id_enq = @ID and opcao = @op); 

set @qtd = (@qtd + 1);

DELETE FROM votos WHERE id_enq = @ID AND opcao = @OP;
insert INTO votos (id_enq,qtde,opcao) values (@ID,@QTD,@OP);


end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enquete`
--

CREATE TABLE `enquete` (
  `id_enq` int(11) NOT NULL,
  `desc_enq` varchar(100) DEFAULT NULL,
  `opcao1` varchar(50) DEFAULT NULL,
  `opcao2` varchar(50) DEFAULT NULL,
  `opcao3` varchar(50) DEFAULT NULL,
  `votos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `enquete`
--
DELIMITER $$
CREATE TRIGGER `trg_votos` AFTER INSERT ON `enquete` FOR EACH ROW begin 

Set @ID =(SELECT max(id_enq) from enquete); 
insert into votos (id_enq, qtde, opcao)
values 
(@ID,  0 ,  1);

insert into votos (id_enq, qtde, opcao)
values 
(@ID,  0 ,  2);

insert into votos (id_enq, qtde, opcao)
values 
(@ID,  0 ,  3);

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `views`
--

CREATE TABLE `views` (
  `id_enq_v` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `votos`
--

CREATE TABLE `votos` (
  `id_enq` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `opcao` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aux_votos`
--
ALTER TABLE `aux_votos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquete`
--
ALTER TABLE `enquete`
  ADD PRIMARY KEY (`id_enq`),
  ADD KEY `id_enq` (`id_enq`),
  ADD KEY `id_enq_2` (`id_enq`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD KEY `views` (`views`),
  ADD KEY `id_enq_v` (`id_enq_v`);

--
-- Indexes for table `votos`
--
ALTER TABLE `votos`
  ADD KEY `id_enq` (`id_enq`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aux_votos`
--
ALTER TABLE `aux_votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `enquete`
--
ALTER TABLE `enquete`
  MODIFY `id_enq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`id_enq_v`) REFERENCES `enquete` (`id_enq`);

--
-- Limitadores para a tabela `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_enq`) REFERENCES `enquete` (`id_enq`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
