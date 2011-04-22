<html>
  <head>
  	<title>Bilgisayar Mühendisliği Bölümü</title> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/>
  </head>
  <body>
    <div id="header">
	  <div id="topnav">
		<div id="left">
			<a href="http://bil.omu.edu.tr/a/en" title="Bilgisayar Mühendisliği Bölümü" rel="home">
				<img src="isim.gif" title="Click to return to Home page"></img>
			</a> 
		</div>
		<div id="right">	
			<a href="http://bil.omu.edu.tr/a/">
				<img src="go-home.png" title="Click to return to Home page"></img>
			</a>
		</div>
	  </div>
	</div>
	<div id="headur">
		<div id="renklen">
			<h1>Döküman Sayfası</h1>
		</div>
	</div>
	<?php
		echo !($connector = mysql_connect('localhost','root','semihsemih'));
		echo '<br>';
		echo !(mysql_select_db('user', $connector));
		echo '<br>';
		$ad = $_POST['ad'];
		$no = $_POST['no'];
		$result = mysql_query("SELECT * from kullanicilar  WHERE adi = '$ad' and ogrno = '$no' ");
		while ($row = mysql_fetch_assoc($result)) {
			echo "ogrenci bilgileri <br>";
			echo $row['adi'] . "<br>";
			echo $row['ogrno'];
		}
?>
  </body>
</html>
