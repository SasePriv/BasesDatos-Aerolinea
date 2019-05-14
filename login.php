<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Aerolinea Login</title>
    <link rel="stylesheet" href="css_files/login.css" type="text/css" />
  </head>
  <body>
      <div class="body">
          <div class="grad">
              <div class="header">
                  <div>Aerolinea<br><span>ARGENTI</span></div>
              </div>
              <form class="login-main" action="include/login.inc.php" method="post">
                  <div class="login">
                      <input type="text" name="cedid" placeholder="Cedula"><br>
                      <input type="password" name="pwd" placeholder="Contraseña"><br>
                      <button type="submit" name="login-submit">Login</button>
                      <?php
                        if (isset($_GET['error'])) {
                          if ($_GET['error'] == "emptyfields") {
                            echo '<p class="error">Rellene todo los espacios</p>';
                          }
                          else if($_GET['error'] == "sqlerror"){
                            echo '<p class="error">Error con la base de datos</p>';
                          }
                          else if($_GET['error'] == "wrongpwd"){
                            echo '<p class="error">Contraseña incorrecta</p>';
                          }
                          else if($_GET['error'] == "accesodenegado"){
                            echo '<p class="error">No tienes acceso para acceder</p>';
                          }
                          else if($_GET['error'] == "nouser"){
                            echo '<p class="error">Usuario incorrecto</p>';
                          }
                        }
                      ?>
                  </div>
              </form>
          </div>
      </div>
  </body>
</html>
