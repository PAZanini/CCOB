-- ex 3

create database pokemon;
use pokemon;

create table treinador 
(
	idTreinador int primary key auto_increment,
    nome varchar(45),
    dtNasc date,
    constraint chIdade check (dtNasc < '2010-10-08'),
    qntMedalhas int,
    cidade varchar(45),
    fkMentor int,
	constraint fk_mentor foreign key (fkMentor)
	references treinador(idTreinador)
)auto_increment = 1;


insert into treinador (nome, dtNasc, qntMedalhas, cidade, fkMentor) values
	('Ash', '1997-10-03', 4,'São pualo', null),
    ('Leon', '1984-05-20', 20,'Campinas', null),
    ('Cynthia', '1992-12-10', 16,'Jaguariuna', null),
    ('Alain', '2000-11-02', 7,'Americana', null),
    ('Iris', '2009-11-08', 6,'Mogi mirim', null);
    
    
    
update treinador
set fkMentor = 2
where idTreinador = 1;


create table pokemon
(
	idPokemon int primary key auto_increment,
    nome varchar(45),
    peso decimal(6,2),
	altura decimal (6,2),
    lendario tinyint,
    constraint chk_lendario check(lendario in (0,1)),
    tipo varchar(8)
    constraint chk_tipo check(tipo in ('fogo', 'agua', 'fantasma', 'lutador', 'pedra', 'eletrico')),
    fkTreinador int,
    constraint fk_treinador foreign key (fkTreinador)
    references treinador(idTreinador)
)auto_increment = 100 ;

select * from treinador;

insert into pokemon (nome, peso, altura, lendario, tipo, fkTreinador) values
	('Pikachu', 5.00, 0.80, 0, 'eletrico', 1),
    ('Charizard', 80.00, 1.70, 0, 'fogo', 2),
    ('Bulbasaur', 7.90, 0.70, 0, 'pedra', 3),
    ('Jigglypuff', 5.00, 0.80, 0, 'eletrico', null),
    ('Squirtle', 9.00, 0.50, 0, 'agua', 5),
    ('Eevee', 6.50, 0.30, 0, 'lutador', 1),
    ('Gengar', 5.00, 0.80, 0, 'eletrico', 3),
    ('Snorlax', 500.00, 2.10, 0, 'pedra', null),
    ('Mewtwo', 122.00, 2.00, 0, 'fantasma', 1),
    ('Dratini', 3.80, 1.80, 0, 'agua', 2);
    
    
    select * from pokemon;
    
    alter table pokemon
    modify column lendario tinyint not null;
    
    select p.peso as peso_pokemon, p.nome as nome_pokemon, t.nome as nome_treinador
    from pokemon as p
    join treinador as t
    on (p.fkTreinador = t.idTreinador);
    
    select nome, tipo, fkTreinador,
		case 
			when tipo = 'pedra' then concat('fraqueza lutador')
            when tipo = 'fantasma' then concat('fraqueza agua')
            when tipo = 'agua' then concat('fraqueza eletrico')
            when tipo = 'eletrico' then concat('fraqueza pedra')
            when tipo = 'fogo' then concat('fraqueza agua')
            when tipo = 'lutador' then concat('fraqueza pedra')
		end as fraqueza
     from pokemon;
	
     select t.nome as nome_treinador, mentor.nome as mentor, p.nome as nome_pokemon
     from treinador as t
     left join treinador as mentor
     on (t.fkMentor = mentor.IdTreinador)
     join pokemon as p
     on (p.fkTreinador = t.idTreinador)
     where t.dtNasc < '2024-01-01';
     
     select t.nome as nome_treinador, mentor.nome as mentor, p.nome as nome_pokemon
     from treinador as t
     left join treinador as mentor
     on (t.fkMentor = mentor.IdTreinador)
     join pokemon as p
     on ()
     
     
     
     
    