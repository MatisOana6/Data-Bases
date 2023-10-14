<html>
<head>
<title>Exercitiul 6.03a</title>
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
<h2 style="font-size:20px;">Contractele juridice care nu au fost achitate în întregime:</h2>
</div>

<?php
$user='root';
$pass='';
$host='localhost';
$db_name='colocviu s06';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = 'SELECT id_cj, data, obiect, onorar, nr_pagini, id_client, id_avocat
FROM
(SELECT id_cj AS ID, SUM(suma) AS Platit
 FROM Rata
 GROUP BY id_cj
)t1
JOIN Contract_j ON ID=Contract_j.id_cj
WHERE (Contract_j.onorar-Platit) > 0 

UNION 
SELECT *
FROM Contract_j
WHERE id_cj NOT IN (SELECT id_cj
                    FROM Rata);';
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
	echo '<br><br><table border = "2"><tr><td></td><td>Id cj</td><td>Data</td><td>Obiect</td><td>Onorar</td><td>Nr pagini</td><td>Id client</td><td>Id avocat</td></tr>';
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);
	
	  echo '<tr>';
      echo '<td>' . ($i + 1) . '.</td><td>';
      echo htmlspecialchars(stripslashes($row['id_cj'])) . '</td>';
      echo '<td>';
      echo stripslashes($row['data']).'</td>';
	  echo '<td>';
	  echo htmlspecialchars(stripslashes($row['obiect'])) . '</td>';
	  echo '<td>';
	  echo htmlspecialchars(stripslashes($row['onorar'])) . '</td>';
	  echo '<td>';
	  echo htmlspecialchars(stripslashes($row['nr_pagini'])) . '</td>';
	  echo '<td>';
	  echo htmlspecialchars(stripslashes($row['id_client'])) . '</td>';
	  echo '<td>';
	  echo htmlspecialchars(stripslashes($row['id_avocat'])) . '</td>';
      echo '</tr>';
    }
      echo '</table><br><br>';
}
}

mysqli_close($conn);
?>
<a href="file:///E:/Proiect%20PHP/S06.html" onclick="history.back(1);">Revenire la pagina principală</a>


</body>
</html>