<html>
<head>
<title>Exercitiul 6.03b</title>
<style>
table{ font-size:20;
	   background-color:  #DACBA9}
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
<h2 style="font-size:20px;">Detaliile contractelor de muncă pentru funcțiile ce încep cu litera ‘a’ în ordine descrescătoare a salariului de bază și crescătoare după funcție</h2>
</div>

<?php
$functie_a=$_POST["functie_a"];
$functie_a=trim($functie_a);

$user='root';
$pass='';
$host='localhost';
$db_name='colocviu s06';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "SELECT *
FROM Contract_m
WHERE functie LIKE '%$functie_a%'
ORDER BY salar_baza DESC, functie ASC";

if($result = mysqli_query($conn,$query))

{
$num_results=mysqli_num_rows($result);

if($num_results <=0 )
{
echo "Not found!<br>";
exit;
}
else
{
	/*id_cm,data,functie,salar_baza,comision,id_angajat */

	echo '<br><br><table border = "2" ><tr align="center"><td></td><td>Id cm</td><td>Data</td><td>Functie</td><td>Salar</td><td>Comision</td><td>Id angajat</td></tr>';
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);
	
	  echo '<tr align="center">';
      echo '<td>' . ($i + 1) . '.</td><td>';
      echo htmlspecialchars(stripslashes($row['id_cm'])) . '</td>';
      echo '<td>';
      echo stripslashes($row['data']).'</td>';
      echo '<td>';
      echo stripslashes($row['functie']).'</td>';
	  echo '<td>';
      echo stripslashes($row['salar_baza']).'</td>';
	  echo '<td>';
      echo stripslashes($row['comision']).'</td>';
	  echo '<td>';
      echo stripslashes($row['id_angajat']).'</td>';
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