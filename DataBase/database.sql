-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: feb. 05, 2021 la 07:10 AM
-- Versiune server: 10.4.17-MariaDB
-- Versiune PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `database`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `line` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `addresses`
--

INSERT INTO `addresses` (`id`, `line`, `city`, `state`, `country`, `phone`, `user_id`) VALUES
(1, 'Test Address', 'Paris', 'Paris', 'France', '110045', 11);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Boy-Groups'),
(2, 'Girl-Groups'),
(3, 'Boy-Solo'),
(4, 'Girl-Solo');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 1, 14, 2),
(3, 1, 6, 1),
(4, 2, 11, 3),
(6, 4, 18, 1),
(7, 4, 2, 2),
(8, 4, 9, 1),
(9, 4, 10, 2),
(197, 120, 1, 3),
(198, 120, 3, 1),
(199, 121, 6, 1),
(200, 121, 1, 2),
(201, 121, 2, 2),
(202, 122, 8, 2),
(203, 122, 1, 1),
(204, 122, 4, 1),
(205, 122, 9, 1),
(206, 122, 2, 1),
(207, 122, 3, 2),
(208, 123, 1, 1),
(209, 124, 6, 1),
(210, 124, 8, 1),
(211, 124, 9, 1),
(212, 124, 7, 2),
(213, 125, 8, 4),
(214, 125, 9, 1),
(215, 125, 3, 2),
(216, 126, 1, 3),
(217, 126, 6, 1),
(218, 126, 3, 1),
(219, 126, 2, 1),
(220, 126, 4, 1),
(221, 126, 7, 1),
(222, 127, 7, 1),
(223, 127, 8, 1),
(224, 127, 9, 1),
(225, 128, 21, 1),
(226, 128, 23, 48),
(227, 129, 25, 1),
(228, 129, 4, 2),
(229, 129, 17, 2),
(230, 129, 14, 1),
(231, 130, 7, 1),
(232, 130, 3, 1),
(233, 130, 6, 1),
(234, 130, 8, 1),
(235, 130, 9, 1),
(236, 130, 10, 2),
(237, 131, 10, 2),
(238, 131, 14, 5),
(239, 132, 2, 2),
(240, 133, 4, 1),
(241, 133, 6, 1),
(242, 133, 11, 2),
(243, 133, 7, 1),
(244, 133, 8, 1),
(245, 134, 25, 1),
(246, 135, 6, 1),
(247, 136, 14, 6),
(248, 136, 13, 1),
(249, 137, 6, 1),
(250, 137, 8, 2),
(251, 137, 7, 1),
(252, 137, 14, 8),
(253, 138, 22, 32);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) NOT NULL,
  `cat_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `images`, `description`, `price`, `quantity`, `cat_id`) VALUES
(1, 'Map of the Soul: 7 - BTS', 'https://upload.wikimedia.org/wikipedia/en/2/21/BTS_-_Map_of_the_Soul_7.png', 'https://images-na.ssl-images-amazon.com/images/I/61dMr8RTFvL._SL1469_.jpg;https://i.ebayimg.com/images/g/EhQAAOSwoBFeROVh/s-l400.jpg;https://www.kpopusaonline.com/wp-content/uploads/2020/01/926.1.png;https://cdn.shopify.com/s/files/1/0001/9650/9713/products/bts_7_1_1200x1200.jpg?v=1582317376;https://cdn2.newsok.biz/cache/large960_blur-632a59cfa91fcf0ebc8c1e3034e91a5d.jpg', 'Map of the Soul: 7 is the fourth Korean-language (seventh overall) studio album by South Korean boy band BTS. The album was released on February 21, 2020, by Big Hit Entertainment. It is the follow-up to their 2019 extended play Map of the Soul: Persona, with five of its songs appearing on the album. Described by BTS as \"deeply personal\", the album is influenced by their journey and growth of seven years since their debut. Map of the Soul: 7 has been described as a pop, R&B and hip-hop record that contains influences from urban contemporary genres like rock, trap and EDM. Lyrically, it touches upon themes of reflection, introspection, and self-acceptance.For the album, BTS worked with Halsey, Ed Sheeran, Troye Sivan and Sia. The record was primarily produced by Pdogg, also in the producing credits were Suga, Jimin, Fred Gibson, Hiss Noise, El Capitxn, Supreme Boi, and Arcades, among others. Upon release, Map of the Soul: 7 received critical acclaim, with praise towards the records reflective narrative and cohesive production that experiments with various styles.', 50.2, 90, 1),
(2, 'D-2 - Agust D', 'https://upload.wikimedia.org/wikipedia/en/6/61/Cover_of_Agust_D%27s_2020_mixtape_%27D-2%27.jpg', 'https://upload.wikimedia.org/wikipedia/en/6/61/Cover_of_Agust_D%27s_2020_mixtape_%27D-2%27.jpg', 'D-2 is the second mixtape released by South Korean rapper Agust D, better known as Suga of boy band BTS, following his eponymous debut mixtape released in 2016. The mixtape was released on May 22, 2020, through Big Hit Entertainment along with the lead single. The album consists of ten tracks, with songs sung and rapped in both Korean and English. Its lyrics share the rapper\'s viewpoint on the current world. The album peaked at 11 on the Billboard 200, at 7 on the Official UK Chart and at 2 on the ARIA chart, setting 3 new records for the highest-ranking album in the US, UK and Australia by a Korean solo artist. ', 47, 114, 3),
(3, 'Woman - BoA', 'https://upload.wikimedia.org/wikipedia/en/5/59/BoA_%E2%80%93_Woman.png', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dcq8lx8-94ab9091-232f-4b8e-bcb0-7a7009c49a44.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kY3E4bHg4LTk0YWI5MDkxLTIzMmYtNGI4ZS1iY2IwLTdhNzAwOWM0OWE0NC5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.tsMNMsvqSkNXj86urucUFvBnoZr6ulDuZ3fRolncH6c;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dcq8lzy-4c6dca7f-5a72-45ee-b973-441add91c77a.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kY3E4bHp5LTRjNmRjYTdmLTVhNzItNDVlZS1iOTczLTQ0MWFkZDkxYzc3YS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.cHen9x0Hu7H_sLuDTZlbYtGzp0M3dVR3zgsWhS3pmLQ', 'Woman is the ninth Korean-language studio album (nineteenth overall) by South Korean singer-songwriter BoA. It was released on October 24, 2018, by SM Entertainment, with distribution by IRIVER. The album features ten tracks in total, including the lead single, which shares the same name as the title of the album. The album is BoA\'s first Korean full-length release since Kiss My Lips (2015).', 52.15, 93, 4),
(4, 'The Album - Blackpink', 'https://upload.wikimedia.org/wikipedia/en/f/f2/BLACKPINK-_The_Album.png', 'https://images-na.ssl-images-amazon.com/images/I/61WoACTdeqL._SL1500_.jpg;https://target.scene7.com/is/image/Target/GUEST_086a10b9-e530-444b-9d18-23a8a0557abd;https://images.genius.com/55c6afdcb4f929b236772327776dad0a.1000x1000x1.jpg', 'The Album (stylized in all caps) is the debut Korean-language studio album by South Korean girl group Blackpink, released on October 2, 2020, by YG Entertainment and Interscope. It is the group\'s first full-length work since their debut in 2016.For the album, Blackpink recorded over ten new songs and worked with a variety of producers, including Teddy, Tommy Brown, R. Tee, Steven Franks and 24. Eight songs made the final track list, including two collaborations: \"Ice Cream\" with Selena Gomez, and \"Bet You Wanna\" featuring Cardi B. The album explores the group\'s mature side through the themes of love and the complexities of growing up. Musically, The Album utilizes pop, R&B, hip hop, EDM and trap elements.', 59.99, 94, 2),
(5, 'The Dream Chapter: Magic - Tomorrow X Together (TXT)', 'https://upload.wikimedia.org/wikipedia/en/7/79/TXT_-_The_Dream_Chapter_-_Magic.png', 'https://i.ytimg.com/vi/a4T10rbGQNI/maxresdefault.jpg;https://pm1.narvii.com/7609/9fe1fed11b27e70bc589e89a74615301dd9ed05ar1-2048-2048v2_uhq.jpg;https://i.ytimg.com/vi/2CIY6jZ4jNk/maxresdefault.jpg;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f1c31a81-4afe-49b1-a6b4-5eb06b074adb/ddlwcfh-998ba246-fa11-47f0-bdec-13a608f302df.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZjFjMzFhODEtNGFmZS00OWIxLWE2YjQtNWViMDZiMDc0YWRiXC9kZGx3Y2ZoLTk5OGJhMjQ2LWZhMTEtNDdmMC1iZGVjLTEzYTYwOGYzMDJkZi5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.zzTtTvcp9Ekw9oHf4M12pVtq7lj3fZdzN7rGOZmQdTY', 'The Dream Chapter: Magic is the debut studio album by South Korean boy band TXT. It was released on October 21, 2019 by Big Hit Entertainment. It serves as a follow-up to the bands debut extended play The Dream Chapter: Star (2019). The album contains eight songs, including the lead single, \"9 and Three Quarters (Run Away)\". Musically, the album incorporates different genres including R&B, tropical house, acoustic pop and hip hop.', 34.78, 0, 1),
(6, 'Dystopia: The Tree of Language - Dreamcatcher', 'https://i.pinimg.com/originals/64/c6/84/64c68485ccbd99f9fab57537dcc32b07.jpg', 'https://i.pinimg.com/originals/64/c6/84/64c68485ccbd99f9fab57537dcc32b07.jpg', 'This first studio album—Dystopia: The Tree of Language—was released on February 18, together with the music video for \"Scream\", an uptempo EDM-rock song. The album featured eight new original songs, packaged with Dreamcatcher\'s previous two fan songs \"Full Moon\" and \"Over the Sky\", as well as Siyeon\'s solo debut song \"Paradise\".', 43.5, 56, 2),
(7, 'Reality in Black - MAMAMOO', 'https://upload.wikimedia.org/wikipedia/en/f/f3/Mamamoo_-_Reality_in_Black.png', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/ddmjcdp-ab0d10ad-ea81-46ed-9954-cdbdf71bd3d9.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kZG1qY2RwLWFiMGQxMGFkLWVhODEtNDZlZC05OTU0LWNkYmRmNzFiZDNkOS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.2KS2HboSsPQJbtSQw2KP9ztDKCN6otu_9eTplX_B7vA', 'Reality in Black (stylized as reality in BLACK) is the second studio album and the third overall by South Korean girl group Mamamoo. It was released by RBW on November 14, 2019, and distributed by Kakao M. The album topped the weekly charts in South Korea, becoming Mamamoo\'s third number-one album, and entered the top 20 of the US Billboard World Albums chart. It contains eleven songs, including the singles \"Destiny\" and \"Hip\", with the latter reaching the top five of the Gaon Digital Chart.', 62.15, 113, 2),
(8, 'Super One - SuperM', 'https://upload.wikimedia.org/wikipedia/en/6/6a/SuperM_-_Super_One.png', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/de3cf8d-343fe8f8-f9df-4d1d-af2d-688ba3ff8af9.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kZTNjZjhkLTM0M2ZlOGY4LWY5ZGYtNGQxZC1hZjJkLTY4OGJhM2ZmOGFmOS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.guqoOZ9B_mJ3e1TPuEVFZSIlB30bqOl2Wd4vo4TPa5Q;https://static.wikia.nocookie.net/kpop/images/f/ff/SuperM_100_album_cover.png/revision/latest?cb=20200814041926;https://i.pinimg.com/736x/74/78/14/747814348b1edb1171e586e8195be9f1.jpg', 'Super One is the first studio album by South Korean supergroup SuperM. It was released on September 25, 2020 by SM Entertainment and Capitol Records. The album was preceded by the singles \"With You\", \"100\" and \"Tiger Inside\" and was released alongside the lead single, \"One (Monster & Infinity)\".', 60, 177, 1),
(9, 'Don\'t Mess Up My Tempo - EXO', 'https://upload.wikimedia.org/wikipedia/en/5/58/Exo_%E2%80%93_Don%27t_Mess_Up_My_Tempo.png', 'https://cdn.shopify.com/s/files/1/2420/2037/products/EXO_AND_1024x1024.jpg?v=1538675549;https://cdn.shopify.com/s/files/1/0001/9650/9713/products/EOX_1200x1200.jpg?v=1556361350', 'Don\'t Mess Up My Tempo (stylized in all caps) is the fifth studio album by South Korean–Chinese boy band Exo. It was released on November 2, 2018 by SM Entertainment.Member Lay is featured in the Chinese version of lead track, marking his first appearance with the group since Winter EP, For Life (2016).It is available in four versions: Allegro, Moderato, Andante and Vivace, named after types of tempo.The album debuted at number one on the Gaon Album Chart. The album was repackaged as Love Shot on December 13, 2018.', 53.47, 195, 1),
(10, 'Never Gonna Dance Again - Taemin', 'https://images.genius.com/ab6372c93b513f38eb7dbef5c4eaaf96.344x344x1.png', 'https://cdn.shopify.com/s/files/1/0069/4203/1983/products/pre-order-taemin-the-3rd-album-never-gonna-dance-again-act-1-albums-shinee-799619_2400x.jpg?v=1599015623;https://riffmagazine.com/wp-content/uploads/2020/11/taemin-e1604932912399.png;https://upload.wikimedia.org/wikipedia/en/8/8d/Never_Gonna_Dance_Again_album_cover.jpg;https://www.allkpop.com/upload/2020/10/content/291131/1603985462-image.png;https://i.redd.it/j5zo7773bkj51.jpg', 'Never Gonna Dance Again is the third Korean studio album by South Korean singer Taemin. It consists of two parts, Act 1 and Act 2, that were later collected together in the repackage album, Never Gonna Dance Again (Extended Ver.).', 43.25, 73, 3),
(11, 'Eyes Wide Open - TWICE', 'https://upload.wikimedia.org/wikipedia/en/3/33/Twice_-_Eyes_Wide_Open.jpg', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b1166279-c327-4014-a262-7e17476d0bf0/de74ox3-fafbaa92-b289-45ed-9ef9-30ecef7766fe.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvYjExNjYyNzktYzMyNy00MDE0LWEyNjItN2UxNzQ3NmQwYmYwXC9kZTc0b3gzLWZhZmJhYTkyLWIyODktNDVlZC05ZWY5LTMwZWNlZjc3NjZmZS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.kZ6czpEjQ58K6HRW3ujKSWybAlNcQjYuFZFK75GuruM;https://preview.redd.it/52usgrnychs51.jpg?width=2000&format=pjpg&auto=webp&s=abb6691de4513413f78eb10fbb3eada0fae7c46c', 'Eyes Wide Open (stylized in sentence case) is the second Korean-language studio album (fourth overall) by South Korean girl group Twice. It was released on October 26, 2020, by JYP Entertainment and Republic Records. The album features thirteen songs including the lead single, \"I Can\'t Stop Me\", and was released on the week of their fifth anniversary.Twice member Momo said of the album, \"We tried a retro concept for the first time with this album...our title song, especially manifests the retro concept with the synth notes that you can hear throughout the song.\"', 60, 98, 2),
(12, 'Nuna - Jessi', 'https://upload.wikimedia.org/wikipedia/en/f/f5/Jessi_Nuna_EP_Cover.jpg', 'https://images.genius.com/2d0a1ea04c6657aa9a65eaabf2907917.1000x1000x1.jpg;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7bf8709e-c066-4e76-939f-bc66715cbc7f/de73id9-666f6c70-c39b-4659-80a3-7ca609ae0c6a.jpg/v1/fill/w_1280,h_1280,q_75,strp/jessi___nuna__3rd_mini_album__by_platinumcovers_de73id9-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMjgwIiwicGF0aCI6IlwvZlwvN2JmODcwOWUtYzA2Ni00ZTc2LTkzOWYtYmM2NjcxNWNiYzdmXC9kZTczaWQ5LTY2NmY2YzcwLWMzOWItNDY1OS04MGEzLTdjYTYwOWFlMGM2YS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.E93d6y9cv-zJkjRF6gg-ysazTKpbwdPTcgP3UaQS-o4', 'Nuna is the second extended play (promoted as her third) by American-South Korean rapper and singer Jessi. It was released on July 30, 2020 by P Nation and distributed by Kakao M. It consists of six songs, including the previously released singles \"Who Dat B\" and \"Drip\", and the title track \"Nunu Nana\".', 50.2, 0, 4),
(13, 'Namanana - Lay', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/86/Lay-namanana-album-cover.webp/300px-Lay-namanana-album-cover.webp.png', 'https://0.soompi.io/wp-content/uploads/2018/09/16185927/Lay-31.jpg', 'Namanana (stylized in all caps) is the second studio album by Chinese singer-songwriter Lay. It was released on October 19, 2018 by SM Entertainment. The album features 22 tracks in total, 11 of which are in Chinese language with English counterparts for each, including the two singles \"Give Me a Chance\" and \"Namanana\". The album marks the singer\'s US debut under the name Lay Zhang.', 49.99, 55, 3),
(14, 'Lit - Lay', 'https://i.pinimg.com/originals/dc/8d/a6/dc8da6b7aafe56bf2f33c96bbde1d669.jpg', 'https://images.genius.com/4ef603ca10e9701b4958fe2b6ddecc50.600x600x1.jpg;https://www.hellokpop.com/wp-content/uploads/2020/07/Studio-post-on-Weibo-106131078_3090409371043976_1643347838174573452_o.jpg;https://i.redd.it/n00ggw1nrdb51.jpg;https://pbs.twimg.com/media/EXnz2L0XYAgj-BZ?format=jpg&name=medium;https://i.pinimg.com/originals/e2/e6/42/e2e642f9587b398330933d5c4e189227.jpg;https://pbs.twimg.com/media/EXpqZcFUMAATz6j?format=jpg&name=medium;https://www.kcrush.com/wp-content/uploads/2020/07/qoCSzYbg.jpeg', 'Lit (莲; stylized in all caps) is the third studio album by Lay. It was released in two parts: Part 1 on June 1, 2020 followed by the rest of the album being on July 21, 2020. \"Lit\" served as the albums title track for both parts.It includes the previously released track \"Jade\" and \"Boom\".', 50.2, 103, 3),
(15, 'María - Hwasa', 'https://upload.wikimedia.org/wikipedia/en/7/73/Hwasa_-_Mar%C3%ADa.jpg', 'https://upload.wikimedia.org/wikipedia/en/7/73/Hwasa_-_Mar%C3%ADa.jpg', 'María is the debut extended play by South Korean singer and Mamamoo member Hwasa. It was released on June 25, 2020, through RBW. The EP was supported by two singles: the lead single \"Twit\", which reached number one in South Korea, and the title track. Hwasa stated that the album \"is like a diary that contains the emotions she felt as a 24-year-old\".', 48.88, 60, 4),
(16, 'Mirrors - Jackson Wang', 'https://upload.wikimedia.org/wikipedia/en/6/6e/Mirrors_album.jpg', 'https://upload.wikimedia.org/wikipedia/en/6/6e/Mirrors_album.jpg', 'Mirrors (stylized in all caps) is the debut full-length studio album by Hong Kong singer and rapper Jackson Wang. It was released by his own label, Team Wang and Western and 6th, on 25 October 2019. In an interview with i-D, Wang stated \"For this album I actually found my true identity. I\'ve released a lot of rap songs in the past; In China I release many ballads and R&B songs, so it just came to a conclusion where I felt like the fusion of it all was me.\" Through Mirrors, he shares his truest and deepest feelings, talking about love, running out of time, his achievements and where he is in life. Although the songs\' main theme looks like romantic love, the counterpart he sings about is himself, his demons, fears, or his passions.', 55.5, 0, 3),
(17, 'Go Live - Stray Kids', 'https://upload.wikimedia.org/wikipedia/en/2/2b/Stray_Kids_-_Go_Live.png', 'https://upload.wikimedia.org/wikipedia/en/2/2b/Stray_Kids_-_Go_Live.png;https://upload.wikimedia.org/wikipedia/en/a/a3/In_Life_2020.jpg', 'Go Live is the first Korean-language studio album by South Korean boy group Stray Kids. It was released by JYP Entertainment on June 17, 2020, and distributed through Dreamus. The lead single, \"God\'s Menu\" (Korean: 神메뉴; RR: Shinme-nyu), was released the same day.The English title of the album references the group\'s desire to continue moving forward and living without inhibition.Members of the group stated that this project involved experimentation with a variety of genres ranging from trap, hip hop, acoustic rock, and EDM.', 45.89, 71, 1),
(18, 'Awaken the World - WayV', 'https://upload.wikimedia.org/wikipedia/en/9/9c/Awaken_the_World_digital_cover.jpg', 'https://cf.shopee.ph/file/371157b265103638af32cdf461747eb8;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7bf8709e-c066-4e76-939f-bc66715cbc7f/de04gxo-8d00f90c-aa71-4fb2-9f88-b4118df32190.jpg/v1/fill/w_894,h_894,q_70,strp/wayv___awaken_the_world__the_1st_album__by_platinumcovers_de04gxo-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMDAwIiwicGF0aCI6IlwvZlwvN2JmODcwOWUtYzA2Ni00ZTc2LTkzOWYtYmM2NjcxNWNiYzdmXC9kZTA0Z3hvLThkMDBmOTBjLWFhNzEtNGZiMi05Zjg4LWI0MTE4ZGYzMjE5MC5qcGciLCJ3aWR0aCI6Ijw9MTAwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.tuiTS3dc2CTvJmWXPs9E8KJ5nAm66Qlh3ienZ1qauUI', 'Awaken the World is the first studio album by Chinese boy group WayV. It was released digitally on June 9, 2020, and physically on June 18, 2020, by Label V and SM Entertainment, with Dreamus as the South Korean distributor and Owhat as the distributor for China. A full-length release which consists of ten songs that fall mostly in the hip-hop and R&B genres with influences from synth-pop, Awaken the World saw the participation of various songwriters and production teams that have worked with SM previously, namely Moonshine, Tay Jasper, Adrian McKinnon, Mike Daley, Mitchell Owens, Deez, Dsign Music, Cazzi Opeia, Ryan S. Jhun', 48.26, 27, 1),
(19, 'Warning - Sunmi', 'https://upload.wikimedia.org/wikipedia/en/f/ff/Warning_Sunmi.png', 'https://i.pinimg.com/originals/c0/20/1f/c0201f21834f3c7939d311c0001e69b8.jpg;https://i.pinimg.com/originals/a9/88/ab/a988ab7f64ffffd1cfc73360ca58731d.jpg', 'Warning (stylized in all caps) is the second extended play by South Korean singer Sunmi. It was released on September 4, 2018, by Makeus Entertainment. It is her first solo Korean material since the release of Full Moon in February 2014.', 49.99, 124, 4),
(20, 'Wings - BTS', 'https://upload.wikimedia.org/wikipedia/en/3/3f/BTS%2C_Wings.jpg', 'https://upload.wikimedia.org/wikipedia/en/0/0d/BTS_Wings_versions.jpg;https://upload.wikimedia.org/wikipedia/en/a/a2/BTS_You_Never_Walk_Alone.png;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dbeoi7u-ae04238f-2d22-4e63-bbb4-342249c09f76.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kYmVvaTd1LWFlMDQyMzhmLTJkMjItNGU2My1iYmI0LTM0MjI0OWMwOWY3Ni5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.oWPJxPw3Qq2KfLgoAp_uaso20NyV-OI6s6r4iagGTwA;https://i.pinimg.com/originals/19/9c/31/199c31be376c4c703076f02ae14f597e.jpg', 'Wings is the second Korean studio album (fourth overall) by South Korean boy band BTS. The album was released on October 10, 2016, by Big Hit Entertainment. It is available in four versions and contains fifteen tracks, with \"Blood Sweat & Tears\" serving as its lead single. Heavily influenced by Hermann Hesse\'s coming of age novel, Demian, the concept album thematically deals with temptation and growth. It was later reissued as a repackage album, titled You Never Walk Alone, on February 13, 2017, a continuation of the canon for Wings. Three new songs were added to the track listing, with \"Spring Day\" and \"Not Today\" promoted as the lead singles.', 58.33, 0, 1),
(21, 'I Trust - (G)I-dle', 'https://cf.shopee.com.my/file/6f02606590b6267e2e621d23b3a89181', 'https://cf.shopee.com.my/file/6f02606590b6267e2e621d23b3a89181;https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f1c31a81-4afe-49b1-a6b4-5eb06b074adb/ddyfmcr-993c3afd-3e6c-41c6-b68e-e60961d57848.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZjFjMzFhODEtNGFmZS00OWIxLWE2YjQtNWViMDZiMDc0YWRiXC9kZHlmbWNyLTk5M2MzYWZkLTNlNmMtNDFjNi1iNjhlLWU2MDk2MWQ1Nzg0OC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.HdPTKxIOSG3GdWaG6k3fcp8txigyGGSq-98BhVPbJaU', 'I Trust (stylized in sentence case) is the third Korean extended play by South Korean girl group (G)I-dle. It was released digitally on April 6, 2020 and physically on April 7, 2020 by Cube Entertainment. I Trust features 5 tracks including the pre-released single \"Lion\" and the lead single \"Oh My God\", which was produced and written by Jeon Soyeon and Yummy Tone. The physical version is available in two versions: \"True\" and \"Lie\". I Trust is the followup to their second EP I Made, released in 2019. \"The goal of the album was to epitomize all emotions that one person can feel, and I wanted to put together both good and gloomy feelings in one album.\" — Soyeon talking about I Trust.', 50, 73, 2),
(22, 'Hope World - j-hope', 'https://i.pinimg.com/originals/48/5c/5e/485c5e129ce7a51366daf3dfe537b608.jpg', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99c08eac-1777-4459-81b0-341be2da5190/dc5i6uo-d0b0b98e-f369-4ae2-a126-dd57e3df5803.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTljMDhlYWMtMTc3Ny00NDU5LTgxYjAtMzQxYmUyZGE1MTkwXC9kYzVpNnVvLWQwYjBiOThlLWYzNjktNGFlMi1hMTI2LWRkNTdlM2RmNTgwMy5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.kKegkkgwJMCQrzZ7Dqwxevq8p5ifgc1hpvLEEmI5hwU', 'Hope World is the debut mixtape of South Korean rapper J-Hope. It was released on March 2, 2018 through label Big Hit Entertainment, along with the lead single \"Daydream\". A second single titled \"Airplane\" was released a week later. The album\'s peak at 38 on the Billboard 200 caused J-Hope to become the highest charting Korean soloist at the time of release.', 49.87, 0, 3),
(23, 'Vivid - Ailee', 'https://images-na.ssl-images-amazon.com/images/I/61RXZ3JV3VL._SL1000_.jpg', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/083bbf10-4b8c-474e-8b2b-bc4169faf93d/d9hsy2b-0fac77d4-9a1f-4f41-9b31-e2f3a0947b5c.jpg/v1/fill/w_600,h_600,q_75,strp/ailee_vivid_album_cover__fan_made__by_misscatievipbekah_d9hsy2b-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD02MDAiLCJwYXRoIjoiXC9mXC8wODNiYmYxMC00YjhjLTQ3NGUtOGIyYi1iYzQxNjlmYWY5M2RcL2Q5aHN5MmItMGZhYzc3ZDQtOWExZi00ZjQxLTliMzEtZTJmM2EwOTQ3YjVjLmpwZyIsIndpZHRoIjoiPD02MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.ex--mE1IrvgPxcbZ7cVtUxaRHddR0uMqnIxdK5i71KA;https://images-na.ssl-images-amazon.com/images/I/61RXZ3JV3VL._SL1000_.jpg', 'Vivid is the debut Korean-language studio album by South Korean singer Ailee. It was released on September 30, 2015 by YMC Entertainment and distributed by LOEN Entertainment.The title track of the album was revealed to be \"Mind Your Own Business\". On September 22, the first music video teaser for \"Mind Your Own Business\" was released.', 39.99, 0, 4),
(24, 'Goodbye Rania - Blackswan', 'https://images.genius.com/57375cee900336c4c3aa32b5e1debcf8.1000x1000x1.jpg', 'https://images.genius.com/d692b0a07dbab5bd4b04f4f4183870d4.840x840x1.png', 'Goodbye Rania (stylized as Goodbye RANIA) is the second studio album by South Korean girl group, Blackswan. The album was released on October 16, 2020, through DR Music, 3 years after their previous release, Refresh 7th. The album marked the first release under the Blackswan name, as well as the debut of members Leia, Youngheun, Judy, and Fatou. It was also the last album to feature longtime member Hyeme, who left the group on November 9, 2020.The group originally had their debut scheduled in the early half of 2020, but it was postponed due to the COVID-19 pandemic that occurred earlier in the year.On October 14, the band released a teaser for lead single, \"Tonight,\" said to be written and produced by Melanie Fontana.', 61.11, 0, 2),
(25, 'Treasure EP.Fin: All to Action - ATEEZ', 'https://daddykool.com/Photo/418461694222', 'https://pbs.twimg.com/media/EFHgtSZU8AALMXm.jpg;https://pbs.twimg.com/media/EGYng6dXUAAnsmo.jpg:large', 'Treasure EP.Fin: All to Action is the first studio album by South Korean boy band Ateez. It was released through KQ Entertainment on October 8, 2019, alongside the single \"Wonderland\" and its music video.It also serves as the final part of the Treasure series.The album was produced by Eden, who has produced much of the band\'s material. He also co-wrote most of the tracks with Buddy,Leez and Ollounder, the latter two of whom contributed to Treasure EP.3: One to All.The song \"Thank U\" was also written about the feelings of gratitude the members of the group feel toward one another.', 48.87, 64, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT 'not set',
  `lname` varchar(255) DEFAULT 'not set',
  `age` int(10) DEFAULT 18,
  `role` int(10) DEFAULT 555,
  `type` varchar(255) NOT NULL DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`, `age`, `role`, `type`) VALUES
(1, 'john', '$2b$10$iLEz3tkVKeOCwuagcqhDUOV.Iswjc.I41unbnnFGiqK/gmstDCC3i', 'john@gmail.com', 'Indranil', 'Mukherjee', 31, 777, 'local'),
(11, 'mike', '$2b$10$vIS0W3LKhbx2tFh1GMYWhul7GWtIg4jnKU2C/NGux1pUG3QKMdNzO', 'mike-doe@excellent.com', 'Mike', 'Leming', 40, 555, 'local');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addresses_users1_idx` (`user_id`);

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users1_idx` (`user_id`);

--
-- Indexuri pentru tabele `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_has_products_products1_idx` (`product_id`),
  ADD KEY `fk_orders_has_products_orders1_idx` (`order_id`);

--
-- Indexuri pentru tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`cat_id`);
ALTER TABLE `products` ADD FULLTEXT KEY `description` (`description`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT pentru tabele `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT pentru tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;