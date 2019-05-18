<?php
  session_start();
  include 'include/conexion.php';
?>
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Vuelos</title>
    <link rel="stylesheet" href="css_files/vuelos.css" type="text/css">
  </head>
  <body id="body1">
      <?php
          include "menu-lateral.html"
      ?>
      <h1 id="h1-titulo">Vuelos</h1>

      <div id="informacion">
        <table border="0" id="tabla-info">
          <tr id="titulo-row">
            <td>Numero Vuelo</td>
            <td>Codigo Avion</td>
            <td>Ruta</td>
            <td>Estado Vuelo</td>
            <td>Fecha - Hora</td>
          </tr>
          <?php
            $sql = "SELECT * FROM vuelos;";
            $result = mysqli_query($conn, $sql);
            /*$resultCheck = mysqli_num_rows($result);*/


            /*if($resultCheck > 0){*/
              while ($row = mysqli_fetch_assoc($result)) {
                $numVuelo = $row['cod_vuelos'];
                $codigoAvion = $row['cod_avion'];
                $rutatemp = $row['cod_ruta'];
                $estadotemp = $row['id_Estado_Vuelo'];
                $fechaHora = $row['fecha_hora'];

                $sql2 = "SELECT id_Ciudad FROM ruta WHERE cod_ruta = $rutatemp;";
                $result2 = mysqli_query($conn, $sql2);
                /*$resultCheck = mysqli_num_rows($result);*/

                /*if ($resultCheck > 0) {*/
                  $row2 = mysqli_fetch_assoc($result2);
                  $ruta = $row2['id_Ciudad'];

                  $sql2 = "SELECT Ciudad FROM ciudad WHERE id_ciudad = $ruta;";
                  $result2 = mysqli_query($conn, $sql2);
                  $row2 = mysqli_fetch_assoc($result2);

                  $ciudad = $row2['Ciudad'];

                  $sql2 = "SELECT descripcion FROM estado_vuelo WHERE id_Estado_Vuelo = $estadotemp;";
                  $result2 = mysqli_query($conn, $sql2);
                  /*$resultCheck = mysqli_num_rows($result);*/

                  /*if ($resultCheck > 0) {*/
                    $row2 = mysqli_fetch_assoc($result2);
                    $estadoVuelo = $row2['descripcion'];


                    echo "<tr class='info'>
                            <td>". $numVuelo . "</td>
                            <td>". $codigoAvion ."</td>
                            <td>". $ciudad ."</td>
                            <td>". $estadoVuelo ."</td>
                            <td>". $fechaHora ."</td>
                          </tr>";
                  /*}*/


                /*}*/


              }
            /*}*/

          ?>
        </table>
      </div>
  </body>
</html>
