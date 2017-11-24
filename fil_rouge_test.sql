
#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP DATABASE IF EXISTS fil_rouge;
CREATE DATABASE fil_rouge CHARACTER SET 'utf8';
USE fil_rouge;

#------------------------------------------------------------
# Table: article
#------------------------------------------------------------

CREATE TABLE article(
        ref_article             int (11) Auto_increment  NOT NULL ,
        nom_article             Varchar (100) ,
        poids_article           Int ,
        stock_article           Int ,
        delai_livraison_article Varchar (255) ,
        prix_article            Decimal (25,2) ,
        id_taxe                 Int NOT NULL ,
        PRIMARY KEY (ref_article )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: client
#------------------------------------------------------------

CREATE TABLE client(
        id_client      int (11) Auto_increment  NOT NULL ,
        nom_client     Varchar (100) ,
        prenom_client  Varchar (100) ,
        adresse_client Varchar (255) ,
        id_ville       Int ,
        PRIMARY KEY (id_client )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#------------------------------------------------------------
# Table: ville
#------------------------------------------------------------

CREATE TABLE ville(
        id_ville          int (11) Auto_increment  NOT NULL ,
        nom_ville         Varchar (255) ,
        code_postal_ville Varchar (55) ,
        PRIMARY KEY (id_ville )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: commande
#------------------------------------------------------------

CREATE TABLE commande(
        id_commande         int (11) Auto_increment  NOT NULL ,
        date_commande       Date ,
        frais_port_commande Decimal (25,2) ,
        delai_max_commande  Varchar (255) ,
        id_client           Int NOT NULL ,
        id_statut           Int NOT NULL ,
        PRIMARY KEY (id_commande )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: ligne_cmd
#------------------------------------------------------------

CREATE TABLE ligne_cmd(
        id_sous_cmd        int (11) Auto_increment  NOT NULL ,
        quantite_cmd       Int ,
        prix_uht_ligne_cmd Decimal (25,2) ,
        taxe_art_cmd       Decimal (25,2) ,
        montant_taxe_cmd   Decimal (25,2) ,
        id_commande        Int NOT NULL ,
        PRIMARY KEY (id_sous_cmd )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: taxes
#------------------------------------------------------------

CREATE TABLE taxes(
        id_taxe   int (11) Auto_increment  NOT NULL ,
        nom_taxe  Varchar (50) ,
        taux_taxe Decimal (25,2) ,
        PRIMARY KEY (id_taxe )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: statut
#------------------------------------------------------------

CREATE TABLE statut(
        id_statut      int (11) Auto_increment  NOT NULL ,
        libelle_statut Varchar (50) ,
        PRIMARY KEY (id_statut )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: correspondre
#------------------------------------------------------------

CREATE TABLE correspondre(
        id_sous_cmd Int NOT NULL ,
        ref_article Int NOT NULL ,
        PRIMARY KEY (id_sous_cmd ,ref_article )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE article ADD CONSTRAINT FK_article_id_taxe FOREIGN KEY (id_taxe) REFERENCES taxes(id_taxe);
ALTER TABLE client ADD CONSTRAINT FK_client_id_ville FOREIGN KEY (id_ville) REFERENCES ville(id_ville);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_client FOREIGN KEY (id_client) REFERENCES client(id_client);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_statut FOREIGN KEY (id_statut) REFERENCES statut(id_statut);
ALTER TABLE ligne_cmd ADD CONSTRAINT FK_ligne_cmd_id_commande FOREIGN KEY (id_commande) REFERENCES commande(id_commande);
ALTER TABLE correspondre ADD CONSTRAINT FK_correspondre_id_sous_cmd FOREIGN KEY (id_sous_cmd) REFERENCES ligne_cmd(id_sous_cmd);
ALTER TABLE correspondre ADD CONSTRAINT FK_correspondre_ref_article FOREIGN KEY (ref_article) REFERENCES article(ref_article);


INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (1,"Llandrindod Wells","464614"),(2,"Bedford","75298"),(3,"Cholet","24564"),(4,"Rovereto","57746"),(5,"Delmenhorst","WQ7E 7SG"),(6,"Castel Ritaldi","39105"),(7,"Raymond","7831"),(8,"Mascalucia","17422"),(9,"Merksem","U9L 2GM"),(10,"Fort Laird","55427");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (11,"FerriŽres","101814"),(12,"Premeno","26655"),(13,"Murdochville","287535"),(14,"Kearny","14073"),(15,"Rangiora","529792"),(16,"Oxford County","82437"),(17,"Houdemont","22-348"),(18,"Canmore","45240"),(19,"Glenrothes","0651"),(20,"Roxburgh","40211");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (21,"San Fele","43163"),(22,"Alto del Carmen","89558"),(23,"Banff","663836"),(24,"North Las Vegas","02-672"),(25,"Richmond Hill","851369"),(26,"Horsham","40108"),(27,"Brechin","11914"),(28,"Mildura","5591"),(29,"Kitchener","76459"),(30,"Monte San Pietrangeli","55533");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (31,"Vilcún","NF2 9GU"),(32,"Damme","11124"),(33,"Krishnanagar","1658"),(34,"Staßfurt","03833"),(35,"Biloxi","J51 1MC"),(36,"Fahler","70309"),(37,"Las Condes","2324"),(38,"Montone","4895"),(39,"Villamassargia","43183-422"),(40,"Lehrte","41990-732");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (41,"Adria","21219"),(42,"Köflach","5820"),(43,"Louisville","V7E 6E6"),(44,"Savannah","03-475"),(45,"Colorado Springs","336615"),(46,"Kalisz","9298"),(47,"Wernigerode","692655"),(48,"Pincher Creek","5887"),(49,"Mobile","87082"),(50,"Loppem","8633 YU");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (51,"Des Moines","01580-612"),(52,"WanfercŽe-Baulet","550320"),(53,"Namur","304398"),(54,"San Pietro Avellana","1932"),(55,"Brecon","0762"),(56,"Lac La Biche County","08166"),(57,"Newton Abbot","09466"),(58,"Montbliart","95989"),(59,"Barrhead","00344"),(60,"Eberswalde-Finow","43294-695");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (61,"Charleville-Mézières","P5J 5CI"),(62,"Rampur","50398-751"),(63,"Masullas","61809"),(64,"Delmenhorst","86505"),(65,"Daman","P4T 0Z9"),(66,"Saint-LŽger","7628"),(67,"Lustenau","B9N 7Z8"),(68,"Krishnanagar","034296"),(69,"New Quay","51121-919"),(70,"Heusden-Zolder","4755 BJ");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (71,"Palmiano","09746"),(72,"Waterloo","740865"),(73,"İmamoğlu","564300"),(74,"Grand-RosiŽre-Hottomont","6939"),(75,"Rycroft","6057 AQ"),(76,"Córdoba","8295"),(77,"Pietrarubbia","5519"),(78,"Trento","720147"),(79,"Ipswich","79693-806"),(80,"Munich","47246");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (81,"Cervinara","26352"),(82,"Rishra","59052"),(83,"Traralgon","196729"),(84,"Timon","905872"),(85,"Itter","51216"),(86,"Kaduna","3528"),(87,"Buxton","662475"),(88,"Villarrica","48-994"),(89,"Lichtaart","34407"),(90,"Seilles","51218");
INSERT INTO `ville` (`id_ville`,`nom_ville`,`code_postal_ville`) VALUES (91,"Siedlce","16024"),(92,"Westkerke","440987"),(93,"Rycroft","313422"),(94,"Monfumo","21788"),(95,"Poole","115521"),(96,"Meerhout","9968"),(97,"Manisa","60593"),(98,"Watermaal-Bosvoorde","19742"),(99,"Beaufays","34094"),(100,"Igboho","1899");
