<?php
  session_start();
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
          
          ?>
          <tr id="info">
            <td>1234</td>
            <td>A122</td>
            <td>Valencia</td>
            <td>Despegando</td>
            <td>10/08/2018 15:00</td>
          </tr>
        </table>
      </div>
  </body>
</html>
