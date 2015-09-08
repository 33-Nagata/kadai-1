<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<?php
$fp = fopen("data/data.txt", "r");		// ファイルを開く
flock($fp, LOCK_SH);					// ファイルロック
echo "<table border='1'>";				// tableタグを開始
// ここからループ
while ($array = fgetcsv( $fp )) {		// ファイルを読み込む
	$num = count($array);				// 行数カウント
	echo "<tr>";						// trタグで行を作る
	for($i=0;$i<$num;$i++){
		echo "<td>" . $array[$i] . "</td>";
	}
	echo "</tr>";						// trタグを閉じて1行終わり
}
echo "</table>";						// tableタグを終了
flock($fp, LOCK_UN);					//ロック解除
fclose($fp);							//ファイルを閉じる
?>
</body>