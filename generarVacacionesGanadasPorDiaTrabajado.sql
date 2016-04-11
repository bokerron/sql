CREATE DEFINER=`root`@`localhost` FUNCTION `generarVacacionesGanadasPorDiaTrabajado`(`idE`int) RETURNS int(200)
BEGIN
declare diasGen int;
declare tipoVac varchar(50);
select tipoCalculoVacaciones into tipoVac from empleados WHERE idEmpleado = idE;
begin
 IF tipoVac ='Laborables' THEN
        set diasGen = ((((datediff(curdate(),'2016-01-01')+1)-(datediff(curdate(),'2016-01-01')+1)*31.23/100))/30)*1.83;
 else
        set diasGen=((((datediff(curdate(),'2016-01-01')+1)-(datediff(curdate(),'2016-01-01')+1)*31.23/100))/30)*2.5;
END if;
end;
return diasGen;
end