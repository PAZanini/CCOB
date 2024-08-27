
-- ex 1
create database game_Store;
use game_Store;

create table jogo 
(
	idJ int primary key auto_increment,
    nome varchar(30),
    diretor varchar(30),
    genero varchar(30),
	dtLanc char(10), 
    nota int,
    qnt int
);

alter table jogo 
add constraint chkNota check (nota in (0,1,2,3,4,5,6,7,8,9,10));

insert into jogo (nome, diretor, genero, dtLAnc, nota, qnt) values 
	('Super mario bros', 'Rocky Morton', 'aventura', '09-18-1985', 10, 935000),
    ('Super mario bros 2', 'Rocky Morton', 'aventura', '05-29-1986', 10, 1200000),
    ('Super mario galaxy', 'Rocky Morton', 'aventura', '09-18-2010', 8, 100500),
    ('Mario kart', 'Rocky Morton', 'aventura', '05-10-2005', 10, 8500000),
    ('Mario galaxy 2', 'Rocky Morton', 'aventura', '02-28-2015', 9, 900000);

alter table jogo
add column midia char(6) constraint chkMidia check (midia in ('fisico', 'digital'));

update jogo
set midia = 'fisico'
where idj = 1;

select * from jogo
	where nome like '%a%' and midia = 'fisico';
    
select * from jogo 
	where diretor not like '%e%';
    
select * from jogo
where genero = 'aventura' and qnt > 0;

delete from jogo
where qnt < 0;

alter table jogo
rename column diretor to criador;

select * from jogo;

-- ex 2 

use ccob;

create table esporte 
(
	idE int primary key auto_increment,
	nome varchar(40),
    categoria varchar(20),
    nJogadores int,
    estreia date,
    pOrigem varchar(40)
);
alter table esporte
add constraint chkCat check (categoria in ('individual', 'coletivo'));

insert into esporte (nome, categoria, nJogadores, estreia, pOrigem) values
	('fotebol', 'coletivo', 22, '2024-04-05', 'brasil'),
    ('basquete', 'coletivo', 10, '2024-06-05', 'brasil'),
    ('volei', 'coletivo', 35, '2024-04-05', 'brasil'),
    ('fotebol', 'coletivo', 22, '2024-04-05', 'brasil'),
    ('fotebol', 'coletivo', 22, '2024-04-05', 'brasil'),

-- ex5
use ccob;
create table herois 
(
   idH int primary key auto_Increment,
   nome varchar(45),
   versao varchar(45),
   habilidade varchar(45),
   altura int
);

insert into herois (nome, versao, habilidade, altura) values 
('Hulk', 'Vingadores Ultimato', 'super força', 320),
('Homem aranha', 'Vingadores Ultimato', 'habilidades de aranha', 175),
('Captão America', 'Vingadores Ultimato', 'reseistencia sobrehumana', 190),
('Homem de ferro', 'Vingadores Ultimato', 'armadura', 180),
('Doc. Strange', 'Vingadores Ultimato', 'magia', 170);

select * from herois;

alter table herois
add column regeneracao boolean;

alter table herois
modify versao varchar(100);

delete from herois
where idH = 3;

insert into herois (nome, versao, habilidade, altura) values 
('Thor', 'vingadores ultimato', 'martelo do trovão', '185');


select * from herois
	where nome like 'h%' or 'c%';
    
select * from herois
	where nome not like '%a%';
    
select nome from herois
	where altura > 190;
    
select * from herois 
	where altura > 180
	order by nome desc;
    
truncate table herois;
    