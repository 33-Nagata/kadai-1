<?php 
session_start(); 		// セッションを使うときは宣言
$name = $_POST["name"];
$password = $_POST["password"];
// var_dump($_POST);
// nameがadminじゃなかったら、loginにリダイレクト
if ("admin" != $name) {
	header("Location: login.php?error=1");
	exit;
}
// passwordがpasswordじゃなかったら、loginにリダイレクト
if ("password" != $password) {
	header("Location: login.php?error=2");
	exit;
}
// ログイン成功時のみ、ここにくる
// セッションにログイン成功をセット
$_SESSION["STATUS"] = "OK";
// index.php にリダイレクト
header("Location: index.php?error=0");
?> 