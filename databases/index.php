<!DOCTYPE html>
<?php
    include_once './includes/dbh-inc.php';
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <?php
        $query = 'select * from names;';
        $result = mysqli_query($conn, $query);
        $resutl_check = mysqli_numrows($result);
        if ($result_check > 0){
            while($row = mysqli_fetch_assoc($result)){
                echo $row['name'];
            }
        }
    ?>
</body>
</html>
