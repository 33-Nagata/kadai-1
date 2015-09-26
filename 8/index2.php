<?php
$time_start = microtime(true);
// 変数を定義
// データベースから取得したカテゴリーと名前を格納する変数
$category_lists = array();

// カテゴリー毎にhtml表示する変数
$category_news_block = "";

// カテゴリーテーブルからカテゴリー一覧を、とりあえずカテゴリーIDの小さい順から取得
$pdo = new PDO("mysql:host=localhost;dbname=news_app;charset=utf8", "root", "");
$sql = "SELECT * FROM category ORDER BY category_id";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$category_lists = $stmt->fetchAll(PDO::FETCH_ASSOC);
// var_dump($category_lists);

// カテゴリーの件数を取得
$sql = "SELECT * FROM news ";
$sql  .= " WHERE ";
$category_num = count($category_lists);
$category_array = array();
for ($count = 0; $count < $category_num; $count++){
	$category_array[$count] = $category_lists[$count]["category_id"];
	$sql  .= "category_id = ? ";
	if ($count != ($category_num - 1)) {
		$sql  .= " OR ";
	}
}
// var_dump($category_array);
$sql  .= " ORDER BY create_date DESC LIMIT 30 ";
// var_dump($sql);
$stmt = $pdo->prepare($sql);
$stmt->execute($category_array);
$news_lists = $stmt->fetchAll(PDO::FETCH_ASSOC);
// var_dump($news_lists);

foreach($category_lists as $category_row){
	// var_dump($category_row);
	$news_list = array();
	$category_id = $category_row["category_id"];
	$category_name = $category_row["category_name"];
	$category_news_block .= '<h2><a href="category.php">' . $category_name . '</a></h2>';
	$category_news_block .= "<ul>";
	$news_cnt = 0;
	foreach($news_lists as $news){
		// カテゴリーが一致しない場合はスルー（コンテニュー）
		if($category_id != $news["category_id"]) {
			continue;
		}
// 各ニュースのタイトルを表示する
		$news_title = $news["news_title"];
		$category_news_block .= '<li><a href="news.php">' . $news_title . '</li>';
		$news_cnt++;
		if($news_cnt == 3) {
			break;
		}
	}
	$category_news_block .= "</ul>";
}

$pdo = null;
$timelimit = microtime(true) - $time_start;
echo $timelimit . "秒";
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

<!-- 実装完了したので、ダミーはコメントアウト
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
-->
</body>
</html>