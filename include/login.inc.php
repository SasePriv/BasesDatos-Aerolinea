<?php

require 'conexion.php';

$cedulaid = $_POST['cedid'];
$password = $_POST['pwd'];

if (empty($cedulaid) || empty($password)) {
  header("Location: ../login.php?error=emptyfields");
  exit();
}
else{
  $sql = "SELECT * FROM personas WHERE ci_persona=?";
  $stmt = mysqli_stmt_init($conn);
  if (!mysqli_stmt_prepare($stmt, $sql)) {
    header("Location: ../login.php?error=sqlerror");
    exit();
  }
  else{

    mysqli_stmt_bind_param($stmt, "s", $cedulaid);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {

      if ($password !== $row['password']){
        header("Location: ../login.php?error=wrongpwd");
        exit();
      }
      else{
        if ($row['id_cargo'] < 6) {
          session_start();
          $_SESSION['cedula'] = $row['ci_persona'];
          $_SESSION['nombre'] = $row['nom_persona'];
          $_SESSION['apellido'] = $row['apellidos_persona'];

          $numeroCargo = $row['id_cargo'];

          $sql = "SELECT * FROM cargo WHERE id_cargo=?";
          $stmt = mysqli_stmt_init($conn);
          if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("Location: ../login.php?error=sqlerror");
            exit();
          }
          else{
            mysqli_stmt_bind_param($stmt, "i", $numeroCargo);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            $row = mysqli_fetch_assoc($result);

            $_SESSION['cargo'] = $row['nom_cargo'];
          }
          header("Location: ../admin-main.php?login=succes");
          exit();

        }else{
          header("Location: ../login.php?error=accesodenegado");
          exit();
        }


      }

    }
    else{
      header("Location: ../login.php?error=nouser");
      exit();
    }

  }
}
