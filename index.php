<?php
$serverName = "127.0.0.1";
$userName = "root";
$password = "";
$dbName = "cs332t13";
$connect = mysqli_connect($serverName, $userName, $password, $dbName) or die("Error " . mysqli_error($connection));

if (isset($_POST['profsubmit'])) {
  $ssn = $_POST['ssn'];
  $coursenum = $_POST['coursenum'];
  $secnum = $_POST['secnum'];
  if ($result = $connect -> query("select ID, title from professor where ssn='".$ssn."'")) {
    if ($result -> num_rows == 0){
      echo "No Professor<br>";
    }
    else {
      $obj = mysqli_fetch_object($result);
      echo($obj->title."<br>");
      $section = $connect -> query("select classroom, days,beggining,ending from section where professor='".$obj->ID."'");
      while($obj = mysqli_fetch_object($section)){
          echo("Room: ".$obj->classroom." Days: ".$obj->days." Time: ".$obj->beggining."-".$obj->ending."<br>");
      }
      $result -> free_result();
      $section -> free_result();
    }
  }
  $Aplus = 0;
  $A = 0;
  $Aminus = 0;
  $Bplus = 0;
  $B = 0;
  $Bminus = 0;
  $Cplus = 0;
  $C = 0;
  $Cminus = 0;
  $Dplus = 0;
  $D = 0;
  $Dminus = 0;
  $F = 0;
  if ($result = $connect -> query("select grade from enrollment where course='".$coursenum."' AND section='".$secnum."'")) {
    if ($result -> num_rows == 0){
      echo "No Course<br>";
    }
    else {
      while($obj = mysqli_fetch_object($result)){
          if ($obj->grade == "A+"){
            $Aplus += 1;
          }
          if ($obj->grade == "A"){
            $A += 1;
          }
          if ($obj->grade == "A-"){
            $Aminus += 1;
          }
          if ($obj->grade == "B+"){
            $Bplus += 1;
          }
          if ($obj->grade == "B"){
            $B += 1;
          }
          if ($obj->grade == "B-"){
            $Bminus += 1;
          }
          if ($obj->grade == "C+"){
            $Cplus += 1;
          }
          if ($obj->grade == "C"){
            $C += 1;
          }
          if ($obj->grade == "C-"){
            $Cminus += 1;
          }
          if ($obj->grade == "D+"){
            $Dplus += 1;
          }
          if ($obj->grade == "D"){
            $D += 1;
          }
          if ($obj->grade == "D-"){
            $Dminus += 1;
          }
          if ($obj->grade == "F"){
            $F += 1;
          }
    }
    echo"A+: ".$Aplus."<br>";
    echo"A: ".$A."<br>";
    echo"A-: ".$Aminus."<br>";
    echo"B+: ".$Bplus."<br>";
    echo"B: ".$B."<br>";
    echo"B-: ".$Bminus."<br>";
    echo"C+: ".$Cplus."<br>";
    echo"C: ".$C."<br>";
    echo"C-: ".$Cminus."<br>";
    echo"D+: ".$Dplus."<br>";
    echo"D: ".$D."<br>";
    echo"D-: ".$Dminus."<br>";
    echo"F: ".$F."<br>";
    }
  }
  $result -> free_result();
}


if (isset($_POST['studsubmit'])) {
  $stucoursenum = $_POST['stucoursenum'];
  $cwid = $_POST['cwid'];
  if ($result = $connect -> query("select ID, title from course where ssn='".$stucoursenum."'")) {
    if ($result -> num_rows == 0){
      echo "No Course<br>";
    }
    else {
      $obj = mysqli_fetch_object($result);
      echo($obj->title."<br>");
      $section = $connect -> query("select classroom, days,beggining,ending from section where course='".$obj->ID."'");
      while($obj = mysqli_fetch_object($section)){
          echo("Room: ".$obj->classroom." Days: ".$obj->days." Time: ".$obj->beggining."-".$obj->ending."<br>");
      }
      $result -> free_result();
      $section -> free_result();
    }
  }
}
mysqli_close($connect);
?>

<html>
<head>
	<title>Project</title>
</head>
<body>
	<div class="container">
    <h1>Professor</h1>
		<form method="post">
			<div class="form-input">
				<input type="text" name="ssn" placeholder="SSN"/>
			</div>
			<div class="form-input">
				<input type="text" name="coursenum" placeholder="Course number"/>
			</div>
      <div class="form-input">
        <input type="text" name="secnum" placeholder="Section number"/>
      </div>
      <input type="submit" id="profsubmit" name="profsubmit" value="Submit" />
		</form>
	</div>
  <div class="container">
    <h1>Student</h1>
		<form method="post">
			<div class="form-input">
				<input type="text" name="stucoursenum" placeholder="Course Number"/>
			</div>
			<div class="form-input">
				<input type="text" name="cwid" placeholder="CWID"/>
			</div>
			<input type="submit" name="studsubmit" value="Submit">
		</form>
	</div>
</body>
</html>
