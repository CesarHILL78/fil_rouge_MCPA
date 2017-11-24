
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
        delai_max_commande  Date ,
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

INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (1,"27/02/17",9663,"05/03/18",589,343),(2,"02/05/16",4019,"02/02/18",275,464),(3,"20/02/17",2356,"10/06/17",170,59),(4,"23/12/15",1161,"01/10/18",841,527),(5,"03/05/18",782,"26/07/18",530,936),(6,"23/01/17",112,"20/11/16",703,804),(7,"24/05/17",3866,"11/12/16",776,950),(8,"15/11/16",9834,"20/03/17",172,687),(9,"04/12/16",744,"07/04/17",183,132),(10,"23/12/15",7920,"11/05/18",127,53);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (11,"18/03/16",321,"20/12/17",949,233),(12,"28/01/17",5824,"20/10/17",880,676),(13,"22/07/18",784,"15/04/17",639,767),(14,"19/03/18",5790,"04/09/17",14,977),(15,"10/03/16",1701,"20/02/18",963,162),(16,"12/06/16",3151,"21/10/18",493,360),(17,"26/05/17",1782,"16/03/18",542,202),(18,"28/02/17",2737,"01/08/18",803,127),(19,"07/11/17",1718,"17/10/18",837,55),(20,"20/04/17",8420,"17/08/17",238,129);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (21,"27/11/16",5980,"28/11/16",973,688),(22,"14/06/17",5124,"08/06/17",704,590),(23,"24/12/16",4238,"20/03/18",123,456),(24,"09/07/18",5704,"24/09/17",900,205),(25,"15/03/17",5728,"27/10/18",20,165),(26,"25/12/15",5300,"08/03/17",723,908),(27,"26/10/15",647,"13/05/17",685,70),(28,"20/07/18",7987,"25/10/16",117,647),(29,"03/08/16",1306,"18/07/17",402,749),(30,"24/12/16",6756,"25/08/17",963,430);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (31,"19/11/15",4715,"15/12/17",429,784),(32,"17/06/17",1448,"23/08/17",181,907),(33,"13/10/15",2255,"25/07/18",496,881),(34,"06/07/16",1211,"22/11/16",510,614),(35,"15/04/16",3802,"18/05/17",291,58),(36,"12/06/16",2727,"09/12/17",931,945),(37,"22/08/16",3478,"22/05/17",230,422),(38,"27/11/17",4353,"03/05/18",150,730),(39,"19/09/18",8426,"21/08/17",48,811),(40,"22/10/17",5812,"08/04/17",886,247);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (41,"20/01/18",8420,"23/02/17",131,693),(42,"11/08/18",3716,"15/11/18",615,729),(43,"02/06/16",4888,"12/04/18",487,78),(44,"07/02/17",3476,"21/08/18",165,461),(45,"26/01/16",1398,"04/05/18",828,885),(46,"12/10/15",5058,"12/04/18",155,495),(47,"06/04/18",3028,"08/10/18",962,959),(48,"15/02/18",9194,"16/01/17",151,814),(49,"17/05/16",3889,"08/11/17",368,765),(50,"02/01/16",7412,"23/03/18",518,935);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (51,"08/08/16",7721,"28/07/18",884,500),(52,"19/03/17",7327,"23/11/16",47,603),(53,"17/08/16",9750,"12/09/17",524,58),(54,"11/06/16",5053,"25/08/17",361,128),(55,"13/10/15",7967,"15/09/18",544,408),(56,"20/12/16",4507,"21/07/17",276,518),(57,"18/05/17",2543,"07/06/17",552,7),(58,"13/07/17",5109,"25/12/17",894,739),(59,"18/04/17",9511,"18/05/18",87,326),(60,"07/12/17",9943,"12/06/18",887,104);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (61,"07/06/18",4130,"22/06/18",31,918),(62,"20/07/16",5823,"04/01/18",329,641),(63,"16/12/16",900,"10/12/17",721,796),(64,"15/11/18",897,"19/01/18",411,182),(65,"07/06/16",7265,"03/05/17",738,794),(66,"08/09/17",1845,"19/05/18",674,159),(67,"08/11/16",4839,"10/06/17",227,653),(68,"23/06/16",3448,"01/01/18",699,995),(69,"03/02/17",8061,"10/03/18",77,280),(70,"10/01/17",1385,"20/01/18",938,54);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (71,"11/04/18",4529,"25/10/16",80,788),(72,"09/09/16",2316,"29/03/18",939,397),(73,"11/02/18",5722,"15/03/17",764,599),(74,"02/06/18",468,"05/05/17",151,954),(75,"10/01/18",2853,"12/02/18",745,442),(76,"05/03/16",8766,"06/03/17",867,387),(77,"21/04/18",1946,"15/11/17",493,414),(78,"19/07/16",6812,"19/03/17",651,902),(79,"29/09/16",4703,"06/04/17",850,964),(80,"20/09/18",498,"12/07/17",245,546);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (81,"28/02/18",8185,"13/10/17",334,26),(82,"20/06/17",8810,"05/11/16",423,156),(83,"03/06/16",1367,"09/05/17",788,593),(84,"07/09/16",7653,"19/02/18",235,923),(85,"15/08/18",4324,"27/02/18",676,204),(86,"08/07/18",1558,"25/04/17",278,304),(87,"16/12/15",7650,"30/10/18",288,392),(88,"24/09/16",1419,"21/06/18",688,122),(89,"15/03/16",9412,"06/08/17",969,475),(90,"17/04/18",7599,"17/12/16",586,130);
INSERT INTO `commande` (`id_commande`,`date_commande`,`frais_port_commande`,`delai_max_commande`,`id_client`,`id_statut`) VALUES (91,"30/01/16",8934,"05/12/16",173,187),(92,"03/03/18",4707,"11/04/17",900,946),(93,"26/06/18",3321,"16/04/18",233,429),(94,"04/11/17",3169,"19/11/16",872,209),(95,"26/12/15",8226,"07/01/17",376,88),(96,"21/05/16",2712,"16/12/17",264,388),(97,"13/02/17",7982,"05/01/17",719,679),(98,"10/10/17",2607,"06/04/18",237,396),(99,"19/04/17",5820,"04/10/18",697,240),(100,"27/10/18",8133,"01/01/18",400,315);


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
