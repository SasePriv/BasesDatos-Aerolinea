<?php
  session_start();
?>
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Buscar</title>
    <link rel="stylesheet" href="css_files/buscar.css" type="text/css"/>
  </head>
  <body id="body1">
      <?php
          include "menu-lateral.html"
      ?>
      <h1 class="h1">Buscar</h1>

      <div class="flexsearch">
      		<div class="flexsearch--wrapper">
      			<form class="flexsearch--form" action="buscar.php" method="post">
      				<div class="flexsearch--input-wrapper">
      					<input class="flexsearch--input" name="buscar" type="search" placeholder="Buscar">
      				</div>
      				<input class="flexsearch--submit" type="submit" name="submit-buscar" value="&#10140;"/>
      			</form>
      		</div>

      </div>
          <?php

          if (isset($_POST['submit-buscar'])) {
            $buscar = $_POST['buscar'];
            if (empty($buscar)) {
              echo "<p class='not'>Not Found</p>";
            }else{
              require 'include/conexion.php';

              $sql = "SELECT * FROM personas WHERE ci_persona = $buscar;";
              $result = mysqli_query($conn, $sql);
              if($row = mysqli_fetch_assoc($result)){
                $cedula = $row['ci_persona'];
                $nombre = $row['nom_persona'];
                $apellido = $row['apellidos_persona'];
                $edad = $row['edad_persona'];
                $tempFuncio = $row['id_funcionario'];
                $tempCargo = $row['id_cargo'];
                $tempProfe = $row['id_profesion'];

                //Tabala funcionarios
                $sql2 =   "SELECT tipo_funcionario FROM funcionarios WHERE id_funcionarios = $tempFuncio;";
                $result2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($result2);
                $funcionario = $row2['tipo_funcionario'];

                //Tabala cargo
                $sql2 =   "SELECT nom_cargo FROM cargo WHERE id_cargo = $tempCargo;";
                $result2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($result2);
                $cargo = $row2['nom_cargo'];

                //Tabala profesion
                $sql2 =   "SELECT descripcion FROM profesion WHERE id_profesion = $tempProfe;";
                $result2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($result2);
                $profesion = $row2['descripcion'];

                echo "
                  <div id='informacion'>
                    <table border='0' id='tabla-info'>
                      <tr id='titulo-row'>
                        <td>Cedula</td>
                        <td>Nombre</td>
                        <td>Edad</td>
                        <td>Profesion</td>
                        <td>Funcionario</td>
                        <td>Cargo</td>
                      </tr>
                    <tr class='info'>
                      <td>".$cedula."</td>
                      <td>".$nombre." ".$apellido."</td>
                      <td>".$edad."</td>
                      <td>".$profesion."</td>
                      <td>".$funcionario."</td>
                      <td>".$cargo."</td>
                    </tr>
                    </table>
                  </div>";
              }else{
                echo "<p class='not'>Not Found</p>";
              }
            }
          }

          ?>

  </body>
</html>
