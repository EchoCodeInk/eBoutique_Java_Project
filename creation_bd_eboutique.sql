

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`);


DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);




LOCK TABLES `order_details` WRITE;

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `service_category` varchar(255) NOT NULL,
  `service_description` text NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `service_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`);


INSERT INTO `services` VALUES (1,'Develop Responsive Website With HTML, CSS And JS','websiteDevelopment','Le service de développement de sites web réactifs avec HTML, CSS et JS est une solution idéale pour les entreprises et les particuliers souhaitant avoir un site web moderne et adaptatif. En utilisant ces technologies de pointe, il est possible de créer des sites web qui offrent une expérience utilisateur optimale sur tous les types d\'appareils. Grâce à une conception intelligente et à une mise en page flexible, les sites web réactifs permettent de maintenir l\'engagement des visiteurs, d\'améliorer le référencement naturel et de générer des conversions.',113.61,'develop-responsive-website-with-html-css-and-js.jpg'),(2,'Fix Bugs, Errors In PHP, Laravel, Codeigniter','webProgramming','Le service de correction des erreurs et des bugs dans PHP, Laravel et Codeigniter est essentiel pour garantir le bon fonctionnement de votre site web. Si vous rencontrez des problèmes techniques ou des bugs qui affectent les performances de votre site, mon service professionnel peut vous aider à les résoudre rapidement et efficacement. En utilisant mes compétences techniques et mon expérience dans le domaine, je suis en mesure de diagnostiquer et de résoudre tout type de bug ou d\'erreur, qu\'il s\'agisse d\'un problème de code, de configuration ou de compatibilité. Vous pouvez être assuré que votre site sera opérationnel à nouveau en peu de temps.',7.10,'fix-bugs-errors-in-php-laravel-codeigniter.jpg'),(3,'Write, Modify, Optimize Sql, Store Procedures, Functions','databases','L\'écriture, la modification et l\'optimisation de SQL, de procédures stockées et de fonctions sont des tâches essentielles pour garantir le bon fonctionnement de votre base de données. Si vous recherchez un service professionnel pour améliorer les performances de votre base de données et améliorer l\'efficacité de vos requêtes SQL, je peux vous aider. En utilisant mes compétences et mon expérience dans le domaine, je suis en mesure d\'optimiser les requêtes SQL existantes, de créer de nouvelles procédures stockées et fonctions, et de corriger tout problème de performance ou de compatibilité. Vous pouvez être assuré que votre base de données fonctionnera de manière optimale et efficace.',49.70,'write-modify-optimize-sql-store-procedures-functions.jpg'),(4,'Fully Secure Your Wordpress Website','websiteMaintenance','La sécurité de votre site web WordPress est une priorité absolue pour protéger vos données, votre réputation et vos clients. Si vous recherchez un service professionnel pour sécuriser entièrement votre site web WordPress, je peux vous aider. Je suis en mesure de mettre en place des mesures de sécurité avancées, telles que la configuration de pare-feu, l\'installation de plugins de sécurité, la mise à jour régulière de WordPress et des thèmes et plugins, la sécurisation des formulaires de contact et des commentaires, et la surveillance constante de votre site pour détecter toute activité suspecte. Avec mon service, vous pouvez être assuré que votre site web WordPress est protégé contre les attaques et les vulnérabilités.',142.01,'fully-secure-your-wordpress-website.jpg'),(5,'Speed Up Website For Google Pagespeed Insights','websiteMaintenance','La vitesse de chargement de votre site web est un facteur crucial pour garantir une bonne expérience utilisateur et pour améliorer votre classement sur les moteurs de recherche, notamment sur Google. Si vous recherchez un service professionnel pour accélérer la vitesse de votre site web et améliorer votre score sur Google Pagespeed Insights, je peux vous aider. En utilisant des techniques d\'optimisation avancées, telles que la compression d\'images, la mise en cache, la minimisation du code et l\'optimisation du contenu, je suis en mesure de réduire le temps de chargement de votre site web et d\'améliorer son temps de réponse. Vous pouvez être assuré que votre site web sera plus rapide et plus performant, ce qui améliorera votre classement sur les moteurs de recherche et augmentera l\'engagement des visiteurs.',35.50,'speed-up-website-for-google-pagespeed-insights.jpg'),(6,'Wordpress Security, Malware Removal...','websiteMaintenance','La sécurité de votre site web WordPress est une priorité absolue pour protéger vos données, votre réputation et vos clients. Si votre site web WordPress a été compromis par des logiciels malveillants ou des attaques de pirates informatiques, je peux vous aider à éliminer ces menaces et à sécuriser entièrement votre site web. En utilisant des outils de détection de malwares et des techniques d\'analyse approfondie, je suis en mesure d\'identifier et de supprimer tout logiciel malveillant ou code malicieux qui pourrait affecter la sécurité de votre site web. Ensuite, je peux mettre en place des mesures de sécurité avancées, telles que la configuration de pare-feu, l\'installation de plugins de sécurité, la mise à jour régulière de WordPress et des thèmes et plugins, la sécurisation des formulaires de contact et des commentaires, et la surveillance constante de votre site pour détecter toute activité suspecte. Avec mon service, vous pouvez être assuré que votre site web WordPress est protégé contre les attaques et les vulnérabilités.',28.40,'wordpress-security-malware-removal.jpg'),(7,'Sql Database Design, Erds, Normalization, Class Diagram','databases','La conception de base de données est une étape cruciale dans le développement de toute application. Si vous cherchez un service professionnel pour concevoir une base de données SQL robuste et efficace, je peux vous aider. Je suis expert en conception de base de données SQL, en modélisation conceptuelle et en normalisation de données. Je peux concevoir des diagrammes E-RD et des diagrammes de classes pour représenter les relations entre les différentes entités et les attributs associés. Ensuite, je peux appliquer des techniques de normalisation pour optimiser la structure de la base de données, éliminer les redondances et améliorer les performances. Mon objectif est de fournir une base de données SQL qui répond à vos besoins spécifiques et qui est facile à maintenir et à mettre à jour. Avec mon service, vous pouvez être assuré que votre base de données SQL est conçue de manière professionnelle et efficace.',28.40,'sql-database-design-erds-normalization-class-diagram.jpg'),(8,'Build Or Edit Your Ms Access Database','databases','Microsoft Access est une application de gestion de base de données populaire qui peut être utilisée pour stocker et gérer une grande quantité de données. Si vous cherchez un service professionnel pour créer ou modifier votre base de données Microsoft Access, je peux vous aider. Je suis expert en développement de bases de données Access et je peux travailler avec vous pour comprendre vos besoins et concevoir une base de données qui répond à vos exigences. Je peux créer des tables, des formulaires, des requêtes et des rapports pour organiser et afficher les données de manière efficace. Si vous avez déjà une base de données Access, je peux la modifier pour ajouter des fonctionnalités, corriger les erreurs ou améliorer la performance. Mon objectif est de fournir une base de données Microsoft Access qui est facile à utiliser et qui répond à vos besoins spécifiques. Avec mon service, vous pouvez être assuré que votre base de données Microsoft Access est professionnelle et efficace.',92.31,'build-or-edit-your-ms-access-database.jpg'),(9,'Edit Or Fix Any Html, Css, Javascript Code','webProgramming','Si vous cherchez un service professionnel pour éditer ou corriger n\'importe quel code HTML, CSS ou JavaScript, je peux vous aider. Je suis expert en développement web et je peux travailler avec vous pour comprendre les problèmes avec votre code et trouver des solutions rapides et efficaces. Je peux éditer le code pour corriger les erreurs, améliorer la performance et rendre votre site web plus rapide et plus convivial. Je peux également optimiser le code pour améliorer la compatibilité avec différents navigateurs et dispositifs. Mon objectif est de fournir un code HTML, CSS ou JavaScript qui répond à vos besoins spécifiques et qui fonctionne parfaitement. Avec mon service, vous pouvez être assuré que votre code est professionnel et efficace.',7.10,'edit-or-fix-any-html-css-javascript-code.jpg'),(10,'Do Django, Python, React Js Websites As A Full Stack Dev','websiteDevelopment','Si vous cherchez un service professionnel pour créer des sites web en utilisant Django, Python et React JS, je peux vous aider en tant que développeur Full Stack. Je suis expert en développement web et j\'ai une expérience avancée avec ces technologies. Je peux travailler avec vous pour comprendre vos besoins et concevoir un site web qui répond à vos exigences spécifiques. Je peux créer des sites web réactifs et interactifs en utilisant Django, Python et React JS pour créer des expériences utilisateur hautement personnalisées et conviviales. Je peux créer des fonctionnalités de back-end pour stocker et gérer des données, ainsi que des fonctionnalités de front-end pour afficher les données de manière efficace. Mon objectif est de fournir un site web Django, Python et React JS qui est facile à utiliser et qui répond à vos besoins professionnels. Avec mon service, vous pouvez être assuré que votre site web est professionnel et efficace.',113.61,'do-django-python-react-js-websites-as-a-full-stack-dev.jpg'),(11,'Edit Html, Css And Bootstrap Code','webProgramming','Si vous cherchez un service professionnel pour éditer le code HTML, CSS et Bootstrap de votre site web, je peux vous aider. Je suis un expert en développement web et je peux travailler avec vous pour comprendre les problèmes avec votre code et trouver des solutions rapides et efficaces. Je peux éditer le code pour corriger les erreurs, améliorer la performance et rendre votre site web plus rapide et plus convivial. Je peux également optimiser le code pour améliorer la compatibilité avec différents navigateurs et dispositifs. Mon objectif est de fournir un code HTML, CSS et Bootstrap qui répond à vos besoins spécifiques et qui fonctionne parfaitement. Avec mon service, vous pouvez être assuré que votre code est professionnel et efficace.',12.10,'edit-html-css-and-bootstrap-code.jpg'),(12,'Design Website Responsive Using Html Css Bootstrap','websiteDevelopment','Si vous recherchez un service professionnel pour concevoir un site web responsive, je peux vous aider. En tant qu\'expert en développement web, j\'ai une solide expérience dans la conception de sites web responsive en utilisant les dernières technologies telles que HTML, CSS et Bootstrap. Je peux travailler avec vous pour comprendre vos besoins et vos préférences en matière de design, et créer un site web responsive qui reflète votre marque et attire vos utilisateurs. Je suis également capable d\'optimiser le code pour améliorer la performance et la compatibilité avec différents navigateurs et dispositifs. Avec mon service, vous pouvez être assuré que votre site web sera conçu avec professionnalisme et sera accessible à tous vos utilisateurs, peu importe l\'appareil qu\'ils utilisent.',127.81,'design-website-responsive-using-html-css-bootstrap.jpg');;


-- Dump completed on 2023-04-14 13:35:23
