<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <?php
    $servername = 'localhost';
    $username = 'fz';
    $password = '';
    // Create connection
    $conn = mysqli_connect($servername, $username, $password);

    // Check connection
    //if ($conn->connect_error) {
    //  die("Connection failed: " . $conn->connect_error);
    //} 
    //echo "Connected successfully";

    $conn -> select_db("test");
    $names_query = "select * from names;";
    $result = mysqli_query($conn, $names_query);
    $result_check = mysqli_num_rows($result);

    if ($result_check > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo $row['name'] . "<br>";
        }
    }
    ?>
</body>
</html>
