<!DOCTYPE html>
<?php
    # start a session
    session_start();
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>


<?php
    echo $_SESSION['name'];    
?>

</body>
</html>
