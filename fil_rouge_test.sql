
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
