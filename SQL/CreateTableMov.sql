use newschema;

CREATE TABLE IF NOT EXISTS Tblmov(
mov_id int NOT NULL AUTO_INCREMENT,
cont_id int NOT NULL,
mov_tipo enum ('Embarque', 'Descarga', 'Gate In', 'Gate Out', 'Reposicionamento', 'Pesagem', 'Scanner'),
mov_dtInicial datetime not null,
mov_dtFinal datetime not null,
primary key(mov_id),
foreign key (cont_id) references tblcontainer(cont_id) ON DELETE CASCADE
)auto_increment =1;