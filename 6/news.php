<?php
$news_id = $_GET["news_id"];

// 表示用の変数を定義
$view_date = "";
$view_title = "";
$view_detail = "";
// DB接続
$pdo = new PDO("mysql:host=localhost;dbname=cs_academy;charset=utf8", "root", "");
$sql = "SELECT news_title,  news_detail, DATE_FORMAT(create_date , '%Y.%m.%d') AS create_date FROM news WHERE news_id = :news_id";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':news_id', $news_id, PDO::PARAM_INT);
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
var_dump($results);
$pdo = null;

foreach($results as $row){
	$view_date = $row["create_date"];
	$view_title = $row["news_title"];
	$view_detail = $row["news_detail"];
}
?>

<?php include("header.php") ?>
    
    <section class="news contents-box">
        <h2 class="section-title text-center">
            <span class="section-title__yellow">News</span>
            <span class="section-title-ja text-center"><?php echo $view_date ?></span>
        </h2>
        <article class="news-detail">
            <dl class="clearfix">
                <dd class="news-title"><?php echo $view_title ?></dd>
                <dd><?php echo $view_detail ?></dd>
            </dl>
            
        </article>
    </section>

    <!--#information-->
    <footer class="footer contents-box">
    <h2 class="section-title text-center"><span class="section-title__white">Information</span><span class="section-title-ja section-title__white text-center">基本情報</span></h2>

<? include("footer.php") ?>