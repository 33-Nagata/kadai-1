<?php
// 変数を定義
// データベースから取得したカテゴリーと名前を格納する変数
$category_lists = array();

// カテゴリー毎にhtml表示する変数
$category_news_block = "";

// カテゴリーテーブルからカテゴリー一覧を、とりあえずカテゴリーIDの小さい順から取得
$pdo = new PDO("mysql:host=localhost;dbname=news_app;charset=utf8", "root", "");
$sql = "SELECT * FROM category ORDER BY category_id DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$category_lists = $stmt->fetchAll(PDO::FETCH_ASSOC);

// var_dump($category_lists);
// 各カテゴリーごとに、for文で、ブロックを作る
foreach($category_lists as $category_row){
	// var_dump($category_row);
	$news_list = array();
	$category_id = $category_row["category_id"];
	$category_name = $category_row["category_name"];
	$category_news_block = '<h2><a href="category.php">' . $category_name . '</a></h2>';
// 各カテゴリー毎に、ニューステーブルから3件ずつニュースを取得するSQLを発行する
	$sql = "SELECT * FROM news WHERE category_id = :category_id ORDER BY create_date DESC LIMIT 3";
	$stmt = $pdo->prepare($sql);
	$stmt->bindValue(":category_id", $category_id, PDO::PARAM_INT);
	$stmt->execute();
	$news_list = $stmt->fetchAll(PDO::FETCH_ASSOC);
	// var_dump($news_list);
	foreach($news_list as $news){
// 各ニュースのタイトルを表示する
		$news_title = $news["news_title"];
		echo $news_title . "<br>";
	}
}
$pdo = null;
?>
<html>
<head>
<meta charset="utf-8">
<title>Topページ</title>
</head>
<body>
	
<!-- PHPはここで出力開始 -->
<?php echo $category_news_block ?>
<!-- PHPはここで出力終了 -->

<h2><a href="category.php">カテゴリー1</a></h2>
<ul>
<li><a href="news.php">カテゴリ1-ニュース1タイトル</a></li>
<li><a href="news.php">カテゴリ1-ニュース2タイトル</a></li>
<li><a href="news.php">カテゴリ1-ニュース3タイトル</a></li>
</ul>
<h2><a href="category.php">カテゴリー2</a></h2>
<ul>
<li><a href="news.php">カテゴリ2-ニュース1タイトル</a></li>
<li><a href="news.php">カテゴリ2-ニュース2タイトル</a></li>
<li><a href="news.php">カテゴリ2-ニュース3タイトル</a></li>
</ul>
<h2><a href="category.php">カテゴリー3</a></h2>
<ul>
<li><a href="news.php">カテゴリ3-ニュース1タイトル</a></li>
<li><a href="news.php">カテゴリ3-ニュース2タイトル</a></li>
<li><a href="news.php">カテゴリ3-ニュース3タイトル</a></li>
</ul>
</body>
</html>