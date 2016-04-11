CREATE DEFINER=`root`@`localhost` FUNCTION `generarVacacionesPorDiaTrabajado`(`idE`int) RETURNS int(200)
BEGIN
declare diasGen int;
declare fAlta date;
declare tipoVac varchar(50);
select tipoCalculoVacaciones into tipoVac from empleados WHERE idEmpleado = idE;
select fechaAlta into fAlta from empleados where idEmpleado=idE;
begin
<<<<<<< HEAD
 IF tipoVac ='Laborables' THEN
=======
IF tipoVac ='Laborables' THEN
>>>>>>> origin/master
 
        if fAlta > '2016-01-01' then
        set diasGen = ((((datediff(curdate(),fAlta)+1)-(datediff(curdate(),fAlta)+1)*31.23/100))/30)*1.83;
        else
        set diasGen = ((((datediff(curdate(),'2016-01-01')+1)-(datediff(curdate(),'2016-01-01')+1)*31.23/100))/30)*1.83;
        end if;
 else    
        if fAlta> '2016-01-01' then
        set diasGen=((((datediff(curdate(),'2016-01-01')+1)-(datediff(curdate(),'2016-01-01')+1)*31.23/100))/30)*2.5;
        else
        set diasGen=((((datediff(curdate(),'2016-01-01')+1)-(datediff(curdate(),'2016-01-01')+1)*31.23/100))/30)*2.5;
        end if;
END if;

end;
return diasGen;
end
