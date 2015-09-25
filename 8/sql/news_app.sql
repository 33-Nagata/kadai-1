-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- ホスト: 127.0.0.1
-- 生成日時: 2015 年 9 月 25 日 09:28
-- サーバのバージョン: 5.5.32-log
-- PHP のバージョン: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `news_app`
--
CREATE DATABASE IF NOT EXISTS `news_app` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `news_app`;

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(16) NOT NULL,
  `category_order` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_order`, `create_date`, `update_date`) VALUES
(1, '国内', 1, '2015-09-25 15:45:58', '2015-09-25 15:45:58'),
(2, '国際', 2, '2015-09-25 15:45:58', '2015-09-25 15:45:58'),
(3, '経済', 3, '2015-09-25 15:46:36', '2015-09-25 15:46:36'),
(4, 'エンタメ', 4, '2015-09-25 15:46:36', '2015-09-25 15:46:36');

-- --------------------------------------------------------

--
-- テーブルの構造 `count`
--

CREATE TABLE IF NOT EXISTS `count` (
  `news_id` int(11) NOT NULL,
  `news_count` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(64) NOT NULL,
  `news_detail` varchar(1024) NOT NULL,
  `news_show_flg` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- テーブルのデータのダンプ `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_detail`, `news_show_flg`, `category_id`, `create_date`, `update_date`) VALUES
(1, '文科相が辞意 説明責任どこへ', '下村博文文部科学相が２５日、新国立競技場問題で、安倍晋三首相に辞任を申し出ていたことを明らかにした。硬い表情でやや顔を紅潮させながらの「遅すぎるけじめ表明」だった。首相から慰留され、給与を自主返納するというが、関係者からは「遅きに失した」「説明責任はどうなった」などと厳しい声が相次いだ。', 1, 1, '2015-09-25 15:43:17', '2015-09-25 15:43:17'),
(2, '中間貯蔵 用地交渉進まぬ理由', '福島県が、東京電力福島第1原子力発電所事故の影響で出た汚染土などを保管する中間貯蔵施設の県内建設を正式に容認してから9月で1年となる。だが、建設予定地の双葉、大熊2町の地権者の農家と、一刻も早く用地交渉を進めたい政府側との隔たりはあまりにも大きい。農家は「農地を手放す悔しさを政府は理解していない」とやりきれない思いを募らせる。一方、仮置き場は増えるばかりで、地権者は苦渋の選択を迫られている。', 1, 1, '2015-09-25 15:43:17', '2015-09-25 15:43:17'),
(3, '難民「留学」で受け入れ検討', '　シリアなどから欧州に難民が押し寄せている問題を受け、日本政府はシリアから留学生として難民を受け入れる方向で検討に入った。欧州連合（ＥＵ）はギリシャなどに着いた１２万人の難民受け入れで合意。米国も人数を年々増やし、２０１７会計年度には１０万人を受け入れる方針を表明した。２８日からニューヨークの国連総会で行われる各国首脳らの一般討論演説では、難民問題も議題になる見通しで、日本としてシリア問題に貢献する姿勢を国際社会に表明する狙いがある。', 1, 1, '2015-09-25 15:44:55', '2015-09-25 15:44:55'),
(4, '逮捕の係長 数百万円もらった写真', '羽田空港内の土地の使用を巡る汚職事件で、国土交通省の係長の男が「役員就任の準備金として数百万円を受け取った」と周囲に話していたことが分かりました。', 1, 1, '2015-09-25 15:44:55', '2015-09-25 15:44:55'),
(5, '巡礼者事故 死者717人に', '【カイロ時事】サウジアラビア当局によると、24日に起きた聖地メッカ近郊での巡礼者圧死事故の死者数は717人に達した。', 1, 2, '2015-09-25 15:48:03', '2015-09-25 15:48:03'),
(6, '米でバス衝突 邦人複数けが', '米シアトルで２４日昼、水陸両用の観光バスと大型バスが衝突する事故が起きた。ＡＰ通信によると、この事故で４人が死亡、多数がけがをしており、少なくとも８人が重体という。大型バスには、近くのノース・シアトル・カレッジの留学生ら４５人が乗っていたという。在シアトル日本総領事館によると、日本人も複数けがをして病院に搬送されており、けがの程度などの確認を急いでいるという。', 1, 2, '2015-09-25 15:48:03', '2015-09-25 15:48:03'),
(7, '習主席 訪米で4.5兆円爆買い', '【ワシントン清水憲司】中国の習近平国家主席は２３日、米西部ワシントン州の米航空機大手ボーイングの工場を訪問し、旅客機３００機の発注で合意するなど「爆買い」を展開している。中国との商談や投資が米経済を潤す構図を示すことで、サイバー攻撃などをめぐる米政府の強硬姿勢を和らげる狙いがあるとみられる。', 1, 2, '2015-09-25 15:49:13', '2015-09-25 15:49:13'),
(8, 'EU 難民支援に1300億円拠出', '押し寄せる難民に対応するため、ＥＵは緊急の首脳会議で、国連の難民を支援する機関に１３００億円を支援することなどを決めました。しかし、根本的な解決からはほど遠い状況です。ＥＵ本部前からの報告です。', 1, 2, '2015-09-25 15:49:13', '2015-09-25 15:49:13'),
(9, 'TPP 首相「最後の会合に」', '政府は25日午前、環太平洋連携協定（TPP）交渉に関する主要閣僚会議を首相官邸で開いた。', 1, 3, '2015-09-25 15:50:23', '2015-09-25 15:50:23'),
(10, 'FRB議長 年内利上げを想定', '［アマースト（米マサチューセッツ州）　２４日　ロイター］ - イエレン米連邦準備理事会（ＦＲＢ）議長は２４日、同地の大学で講演し、インフレが引き続き安定的に推移し、米経済が雇用拡大に向け力強い状態であれば、ＦＲＢは年内に利上げを開始するとの見方を示した。', 1, 3, '2015-09-25 15:50:23', '2015-09-25 15:50:23');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
