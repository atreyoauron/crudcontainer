insert into Tblmov (mov_id,cont_id,mov_tipo,mov_dtInicial,mov_dtFinal) 
values(null, (select cont_id from tblcontainer limit 1, 1) , 2, now(), now()),
(null, (select cont_id from tblcontainer limit 1, 1) , 1, now(), now()),
(null, (select cont_id from tblcontainer limit 1, 1) , 5, now(), now())
