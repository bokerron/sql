CREATE DEFINER=`root`@`localhost` PROCEDURE `vacacionesAntiguasSimpleMejorada`(anio int,empleadoId int)
BEGIN     
declare idPais int;

SET			  SQL_SAFE_UPDATES = 0;
UPDATE 		vacaciones
SET       diasExcedidos=NULL,
          diasRestantes=NULL WHERE estado
          IN ('Rechazadas','Canceladas');
 
select   	idCalendario from calendarios limit 1 into idPais;
update   	vacaciones  
SET      	diasRestantes=(getVacacionesTotales(anio, empleadoId)-datediff(fechaFin,fechaInicio))+ (select portalempleado.countNumFestivosRango2(idPais, fechaInicio, fechaFin))-1                                       
where    	idEmpleado=empleadoId;

end
