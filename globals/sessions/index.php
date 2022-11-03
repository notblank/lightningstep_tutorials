<?php
    # start a session
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <ul>
        <li><a href='contact.php'>Contact</a></li>
        <li><a href='index.php'>Home</a></li>
    </ul>
    <?php

          $_SESSION['name'] = 'federico';
          echo($_SESSION['name']);
    ?>
</body>
</html>
    
