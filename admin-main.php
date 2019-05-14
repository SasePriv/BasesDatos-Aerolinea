<?php
  session_start();
?>
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Inicio</title>
    <link rel="stylesheet" href="css_files/admin-main.css" type="text/css"/>
  </head>
  <body id="body1">
      <div id="avion">
      </div>
      <?php
          include "menu-lateral.html"
      ?>
      <div id="titulo">
          <h1 id="titulo">Aerolinea Argenti</h1>
      </div>

      <div id="informacion">
          <div id="texto-titulo-contenedor">
              <h3 id="texto-titulo">INFORMACION</h2>
          </div>
          <div id="texto-informacion">

              <table border="0" id="tabla-info">
                  <tr>
                    <td class="tabla-titulo">Cedula: </td>
                    <td class="tabla-resul"><?php echo $_SESSION['cedula']; ?></td>
                  </tr>
                  <tr>
                    <td class="tabla-titulo">Nombre: </td>
                    <td class="tabla-resul"><?php echo $_SESSION['nombre'] ." ". $_SESSION['apellido']; ?></td>
                  </tr>
                  <tr>
                    <td class="tabla-titulo">Cargo: </td>
                    <td class="tabla-resul"><?php echo $_SESSION['cargo']; ?></td>
                  </tr>
              </table>
          </div>
      </div>
  </body>
</html>
