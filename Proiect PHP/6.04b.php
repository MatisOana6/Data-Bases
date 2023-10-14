<html>
<head>
<title>Exercitiul 6.04b</title>
<style>
table{ font-size:20;
	   background-color:  #DACBA9
	}
td{padding: 5px}
* {
  box-sizing: border-box;
}

body {
  margin: 20px;
 background-color:#E9E4D4;
  background-repeat:no-repeat;
}

.h1{
    background: linear-gradient(to bottom, white, #3D2B1F);
        color: white;
border: 1px solid #A67B5B;
text-align:center;
image-align:left;
}

.h2{
  background-color: #C3B091;
border: 1px solid #A67B5B;
text-align:center;
}

/* Style the header */
.header {
         
        height:200px;
        background-position: center;
        border: 2px solid #A67B5B;
    } 


</style>
</head>
<body>
<div class="h1">
<h2 style="font-size:30px;">Cabinet de avocatură</h2>
</div>

<br>
<div class="h2">
<h2 style="font-size:20px;">Perechi de contracte juridice (id_cj1, id_cj2) pentru clienți diferiți dar același avocat:</h2>
</div>

<?php
$user='root';
$pass='';
$host='localhost';
$db_name='colocviu s06';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "SELECT cj1.id_cj, cj2.id_cj 
FROM (Contract_j cj1 INNER JOIN Contract_j cj2 ON cj1.id_cj < cj2.id_cj)
WHERE (cj1.id_client != cj2.id_client) AND (cj1.id_avocat=cj2.id_avocat);"; 

if($result = mysqli_query($conn,$query))

{
$num_results=mysqli_num_rows($result);

if($num_results <=0 )
{
echo "Not found!";
exit;
}
else
{
	echo '<table border = "2" ><tr align="center"><td></td><td>Pereche</td></tr>';
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_array($result);

      echo '<tr align="center"><td>' . ($i + 1) . '.</td><td>( ';
      echo htmlspecialchars(stripslashes($row[0]));
      echo ',&nbsp';
      echo stripslashes($row[1]);
      echo '&nbsp ';
      echo ' )</td></tr>';
    }
	echo '</table><br><br>';
}
}

mysqli_close($conn);
?>
<a href="file:///E:/Proiect%20PHP/S06.html" onclick="history.back(1);">Revenire la pagina principală</a>


</body>
</html>