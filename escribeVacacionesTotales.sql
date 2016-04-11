CREATE DEFINER=`root`@`localhost` PROCEDURE `EscribeVacasTotales`(idVac int)
BEGIN
declare diasRest int;
declare idEmple  int;

select  diasRestantes from vacaciones where idVacaciones=idVac into diasRest;
select  idEmpleado    from vacaciones where idVacaciones=idVac into idEmple;

if 		diasRest ='0' then
update	vacaciones
set		diasRestantes= (select portalempleado.getVacacionesTotales(2015,idEmple))
where   idVacaciones=idVac;
end if;
END