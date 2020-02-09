<?php
  $host="db4free.net:3306"; //replace with your hostname
  $username="towerofbricks"; //replace with your username
  $password="Micificchio"; //replace with your password
  $db_name="giannadb"; //replace with your database
  $con=mysql_connect("$host", "$username", "$password")or die("cannot connect");
  mysql_select_db("$db_name")or die("cannot select DB");
  $sql = "SELECT * FROM Scores"; //replace BestMovies with your table name
  $result = mysql_query($sql);
  $json = array();
  $count=0;

  if(mysql_num_rows($result)){
     while($row=mysql_fetch_row($result)){
        $count = $count+1;
        $json[$count]=$row;
     }
  }
  mysql_close($db_name);
  echo json_encode($json);

?>