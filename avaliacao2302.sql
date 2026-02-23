create database provatechstore;
use provatechstore;
show tables;


-- questão 1: create tabela categorias
create table tabcategoria(
codcategoria int not null auto_increment,
nomecategoria varchar(40),

constraint pkcodcategoria primary key (codcategoria));

describe tabcategoria;

-- questão 2: create tabela clientes
create table tabcliente(
codcliente int not null auto_increment,
nomecliente varchar(40),
emailcliente varchar(60),
cidadecliente varchar(40),
datacadastro date,

constraint pkcodcliente primary key (codcliente));

describe tabcliente;

-- questão 3: create tabela produtos
create table tabproduto(
codproduto int not null auto_increment,
nomeproduto varchar(60),
precoproduto decimal(10,2),
estoqueproduto int,
codcategoria int,

constraint pkcodproduto primary key (codproduto),
constraint fkcodcategoriaprod foreign key (codcategoria)
references tabcategoria (codcategoria));

describe tabproduto;

-- questão 4: create tabela vendedores
create table tabvendedor(
codvendedor int not null auto_increment,
nomevendedor varchar(40),
comissao decimal(5,2),
dataadmissao date,

constraint pkcodvendedor primary key (codvendedor));

describe tabvendedor;

-- questão 5: create tabela pedidos
create table tabpedido(
codpedido int not null auto_increment,
datapedido date,
codcliente int,
codvendedor int,
totalpedido decimal(10,2),

constraint pkcodpedido primary key (codpedido),
constraint fkcodclienteped foreign key (codcliente)
references tabcliente (codcliente),
constraint fkcodvendedorped foreign key (codvendedor)
references tabvendedor (codvendedor));

describe tabpedido;

-- questão 6: adiciona telefone na tabela cliente
alter table tabcliente add telefonecliente varchar(20);

-- questão 7: renomeia coluna comissao para percentualganho
alter table tabvendedor rename column comissao to percentualganho;

-- questão 8: insere categorias
insert into tabcategoria (nomecategoria) values ('hardware');
insert into tabcategoria (nomecategoria) values ('software');
insert into tabcategoria (nomecategoria) values ('perifericos');
insert into tabcategoria (nomecategoria) values ('redes');
insert into tabcategoria (nomecategoria) values ('acessorios');

-- questão 9: insere clientes
insert into tabcliente (nomecliente,emailcliente,cidadecliente,datacadastro) values ('maria silva','maria@gmail.com','muriae','2026-01-10');
insert into tabcliente (nomecliente,emailcliente,cidadecliente,datacadastro) values ('joao souza','joao@gmail.com','cataguases','2026-01-11');
insert into tabcliente (nomecliente,emailcliente,cidadecliente,datacadastro) values ('empresa s/a','empresa@outlook.com','uba','2026-01-12');

-- questão 10: insere produtos
insert into tabproduto (nomeproduto,precoproduto,estoqueproduto,codcategoria)values ('notebook gamer',4500,10,1);
insert into tabproduto (nomeproduto,precoproduto,estoqueproduto,codcategoria) values ('roteador',400,15,4);

-- questão 11: insere vendedores
insert into tabvendedor (nomevendedor,percentualganho,dataadmissao) values ('ana silva',0.10,'2023-01-10');
insert into tabvendedor (nomevendedor,percentualganho,dataadmissao) values ('bruno costa',0.15,'2022-05-20');

-- questão 12: insere pedido
insert into tabpedido (datapedido,codcliente,codvendedor,totalpedido) values ('2026-02-10',1,1,4500);

-- questão 13: aumenta preço em 10% da categoria 1
update tabproduto set precoproduto = precoproduto * 1.10 where codcategoria = 1;

-- questão 14: altera email do cliente 1
update tabcliente set emailcliente = 'novoemail@gmail.com' where codcliente = 1;

-- questão 15: zera estoque do produto 1
update tabproduto set estoqueproduto = 0 where codproduto = 1;

-- questão 16: exclui pedido 1
delete from tabpedido where codpedido = 1;

-- questão 17: remove produtos com preço menor que 1 real
delete from tabproduto where precoproduto < 1.00;

-- questão 18: adiciona cpf único no vendedor
alter table tabvendedor add cpfvendedor varchar(14) unique;

-- questão 19: altera cidade muriae para muriae mg
update tabcliente set cidadecliente = 'muriae mg' where cidadecliente = 'muriae';

-- questão 20: adiciona produto caro
insert into tabproduto (nomeproduto,precoproduto,estoqueproduto,codcategoria) values ('servidor premium',5000,5,1);

-- questão 21: remove vendedor 2
delete from tabvendedor where codvendedor = 2;

-- questão 22: adiciona coluna observacao na tabela pedido
alter table tabpedido add observacao varchar(200);

-- questão 23: cria tabela temporária
create table tabfornecedorteste(
codfornecedor int not null auto_increment,
nomefornecedor varchar(40),

constraint pkcodfornecedor primary key (codfornecedor));

-- questão 24: exclui tabela temporária
drop table tabfornecedorteste;

-- questão 25: altera nome da categoria hardware usando chave primaria
update tabcategoria set nomecategoria = 'componentes internos' where codcategoria = 1;

-- questão 26: adiciona cliente com data atual
insert into tabcliente (nomecliente,datacadastro) values ('ana tech',curdate());

-- questão 27: define comissão fixa de 15%
update tabvendedor set percentualganho = 0.15 where codvendedor > 0;

-- questão 28: remove clientes com email nulo
delete from tabcliente where codcliente > 0 and emailcliente is null;

-- questão 29: altera tipo da coluna totalpedido
alter table tabpedido modify totalpedido decimal(15,2);

-- questão 30: adiciona novo pedido
insert into tabpedido (datapedido,codcliente,codvendedor,totalpedido) values (curdate(),1,1,3000);

-- questão 31: seleciona o nome e o preço de todos os produtos da tabela tabproduto
select nomeproduto, precoproduto from tabproduto;

-- questão 32: seleciona todos os dados dos produtos cujo preço é maior que 2000
select * from tabproduto where precoproduto > 2000;

-- questão 33: seleciona todos os clientes cujo nome começa com a letra 'm'
select * from tabcliente where nomecliente like 'm%';

-- questão 34: seleciona todos os pedidos feitos entre 1º de janeiro de 2026 e 15 de fevereiro de 2026
select *  from tabpedido where datapedido between '2026-01-01' and '2026-02-15';

-- questão 35: seleciona todos os produtos e ordena pelo preço em ordem crescente
select * from tabproduto order by precoproduto asc;

-- questão 38: conta quantos clientes existem na tabela tabcliente
select count(*)  from tabcliente;

-- questão 39: soma o valor total de todos os pedidos da tabela tabpedido
select sum(totalpedido)  from tabpedido;

-- questão 43: seleciona o nome do produto e o nome da categoria, fazendo um join entre tabproduto e tabcategoria
select tp.nomeproduto, tc.nomecategoria from tabproduto tp inner join tabcategoria tc on tp.codcategoria = tc.codcategoria;

-- questão 48: mostra o nome do vendedor e a soma dos pedidos que ele realizou, agrupando por vendedor
select tv.nomevendedor, sum(tp.totalpedido) from tabpedido tp inner join tabvendedor tv on tp.codvendedor = tv.codvendedor group by tv.nomevendedor;

-- questão 60 adaptada para o seu banco atual
select tc.nomecliente,
       tv.nomevendedor,
       tpd.totalpedido
from tabpedido tpd
inner join tabcliente tc
on tpd.codcliente = tc.codcliente
inner join tabvendedor tv
on tpd.codvendedor = tv.codvendedor;