<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<!-- 今回は「データを登録する」なので、 post を使う -->
<form action="input_finish.php" method="post">
	名前: <input type="text" name="name" />
	E-mail: <input type="text" name="email" />
	年齢: <input type="text" name="age" />
	性別: <input type="radio" name="sex" value="1" />男性
	<input type="radio" name="sex" value="2" />女性
	<input type="submit" />
</form>
</body>
</html>