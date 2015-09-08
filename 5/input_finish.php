<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
書き込みを行います
</body>
<?php 
// まずはpost されてくるデータを取得して、変数に格納する
$name = $_POST["name"]; 
$email = $_POST["email"];
$age = $_POST["age"];
$sex = $_POST["sex"];
// 各変数を . と ",(カンマ)"で文字列連結して、書き込む文字列を作る
$str = $name . "," . $email . "," . $age . "," . $sex;
?>
<?php
$file = fopen("data/data.txt","a");	// ファイル読み込み
flock($file, LOCK_EX);				// ファイルロック
fputs($file, $str . PHP_EOL);		// 上で準備した書き込み文字列変数を渡す
flock($file, LOCK_UN);				// ファイルロック解除
fclose($file);
?>