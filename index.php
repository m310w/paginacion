<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
	<title>Paginaci&oacute;n de resultados</title>
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
</head>
<body>
<?php
include_once("config.php");

$url = "";

$consulta_noticias = "SELECT * FROM jugador";
$rs_noticias = mysql_query($consulta_noticias, $con);
//Obtener el número de filas de un conjunto de resultados
$num_total_registros = mysql_num_rows($rs_noticias);
//Si hay registros
if ($num_total_registros > 0) {
	//Limito la busqueda
	$TAMANO_PAGINA = 10;
        $pagina = false;

	//examino la pagina a mostrar y el inicio del registro a mostrar
	//isset = si la variable es null o ono
        if (isset($_GET["pagina"]))
            $pagina = $_GET["pagina"];
        
	if (!$pagina) {
		$inicio = 0;
		$pagina = 1;
	}
	else {
		$inicio = ($pagina - 1) * $TAMANO_PAGINA;
	}
	//calculo el total de paginas
	//ceil = redonde los valores decimales a enteros
	$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

	echo '<p>Esto es un ejemplo de paginacion con PHP recogiendo los datos de los articulos publicados en mi pagina principal.</p>';

	//pongo el n�mero de registros total, el tama�o de p�gina y la p�gina que se muestra
	echo '<h3>Numero de articulos: '.$num_total_registros .'</h3>';
	echo '<h3>En cada pagina se muestra '.$TAMANO_PAGINA.' articulos ordenados por fecha de forma descendente.</h3>';
	echo '<h3>Mostrando la pagina '.$pagina.' de ' .$total_paginas.' paginas.</h3>';
	// ordenar asendente ASC y descendente DESC
	$consulta = "SELECT id_jugador, nombre, apellido FROM jugador ORDER BY id_jugador ASC LIMIT ".$inicio."," . $TAMANO_PAGINA;
	$rs = mysql_query($consulta, $con);
	while ($row = mysql_fetch_array($rs)) {
		echo 'El id: '.$row['id_jugador'].'  Nombre de usuario: '.$row['nombre'].'  Apellido: '.$row['apellido'].'</a><br>';
	}

	echo '<p>';

	if ($total_paginas > 1) {
		if ($pagina != 1)
			echo '<a href="'.$url.'?pagina='.($pagina-1).'"><img src="images/izq.gif" border="0"></a>';
		for ($i=1;$i<=$total_paginas;$i++) {
			if ($pagina == $i)
				//si muestro el �ndice de la p�gina actual, no coloco enlace
				echo $pagina;
			else
				//si el �ndice no corresponde con la p�gina mostrada actualmente,
				//coloco el enlace para ir a esa p�gina
				echo '  <a href="'.$url.'?pagina='.$i.'">'.$i.'</a>  ';
		}
		if ($pagina != $total_paginas)
			echo '<a href="'.$url.'?pagina='.($pagina+1).'"><img src="images/der.gif" border="0"></a>';
	}
	echo '</p>';
}
?>
</body>
</html>