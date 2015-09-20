<?php
session_start(); 		// セッションを使うときは宣言
// セッションのキーにステータスがないなら、loginにリダイレクト
// var_dump($_SESSION);
if(!isset($_SESSION["STATUS"])) {
	header("Location: login.php");
	exit;
} 
?>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<ul>
<li><a href="input.php">ニュース新規追加</a></li>
<li><a href="news_list.php">ニュース一覧（更新はここから）</a></li>
<li><a href="search_ps.php">ニュース検索</a></li>
<li><a href="logout.php">ログアウト</a></li>
</ul>
</body>
</html>