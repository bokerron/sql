CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaVacacionesXIdVacacion`( vacacionesId int,empleadoid int)
BEGIN
declare dRest  int;
declare idPais int;

select 	diasRestantes
from  	vacaciones
where 	idVacaciones=vacacionesId
into 	dRest;

select  idCalendario
from    calendarios
limit   1
into    idPais;

update   		vacaciones 
	SET      	diasRestantes=dRest-(select datediff( fechaFin,fechaInicio )+1)+(select portalempleado.countNumFestivosRango2(idPais, fechaInicio, fechaFin))                                   
	where    	idEmpleado=empleadoId;



END