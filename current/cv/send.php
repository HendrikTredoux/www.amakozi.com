<?php 
$ToEmail = 'chris.steenekamp@amakozi.com'; 
$EmailSubject = 'Nico Resume Contact'; 
$mailheader = "From: ".$_POST["email"]."\r\n"; 
$mailheader .= "Reply-To: ".$_POST["email"]."\r\n"; 
$mailheader .= "Content-type: text/html; charset=iso-8859-1\r\n"; 
$MESSAGE_BODY = "Name: ".$_POST["name"].""; 
$MESSAGE_BODY .= "Email: ".$_POST["email"]."";  
$MESSAGE_BODY .= "Phone: ".$_POST["phone"]."";
$MESSAGE_BODY .= "Message: ".nl2br($_POST["message"]).""; 
mail($ToEmail, $EmailSubject, $MESSAGE_BODY, $mailheader) or die ("Failure"); 
header('Location: index.html');
?>