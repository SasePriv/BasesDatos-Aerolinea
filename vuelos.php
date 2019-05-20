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
            <td>Modelo Avion</td>
            <td>Duracion</td>
            <td>Estado Vuelo</td>
            <td>Destino</td>
            <td>Fecha - Hora</td>
          </tr>
          <?php
            $sql = "SELECT * FROM vuelos;";
            $result = mysqli_query($conn, $sql);

            while ($row = mysqli_fetch_assoc($result)) {
              $numVuelo = $row['cod_vuelos'];
              $aviontemp = $row['avion_id_avion'];
              $rutatemp = $row['ruta_id_ruta'];
              $estadotemp = $row['estadov_id_estadov'];
              $destinotemp = $row['id_ciudad'];
              $fechaHora = $row['fecha_hora'];

              //Tabala modelo
              $sql2 =   "SELECT nom_modelo FROM modelo where id_modelo = $aviontemp;";
              $result2 = mysqli_query($conn, $sql2);
              $row2 = mysqli_fetch_assoc($result2);
              $modelo = $row2['nom_modelo'];
              //Tabala ruta
              $sql2 =   "SELECT valor FROM ruta where cod_ruta = $rutatemp;";
              $result2 = mysqli_query($conn, $sql2);
              $row2 = mysqli_fetch_assoc($result2);
              $duracion = $row2['valor'];
              //Tabla estado_vuelo
              $sql2 =   "SELECT descripcion FROM estado_vuelo where id_Estado_Vuelo = $estadotemp;";
              $result2 = mysqli_query($conn, $sql2);
              $row2 = mysqli_fetch_assoc($result2);
              $estadoVuelo = $row2['descripcion'];
              //Tabla Ciudad
              $sql2 =   "SELECT Ciudad FROM ciudad where id_ciudad = $destinotemp;";
              $result2 = mysqli_query($conn, $sql2);
              $row2 = mysqli_fetch_assoc($result2);
              $ciudad = $row2['Ciudad'];

              echo "<tr class='info'>
                      <td>". $numVuelo . "</td>
                      <td>". $modelo ."</td>
                      <td>". $duracion ."</td>
                      <td>". $estadoVuelo ."</td>
                      <td>". $ciudad ."</td>
                      <td>". $fechaHora ."</td>
                    </tr>";

            }
          ?>
        </table>
      </div>
  </body>
</html>
