use newschema;

CREATE TABLE IF NOT EXISTS tblcontainer(
cont_id int NOT NULL AUTO_INCREMENT,
cont_cliente varchar(25) NOT NULL,
cont_num VARCHAR(11) NOT NULL,
cont_tipo int NOT NULL,
cont_status varchar(15) NOT NULL,
cont_categoria varchar(15) NOT NULL,
primary key(cont_id)

)auto_increment =1;