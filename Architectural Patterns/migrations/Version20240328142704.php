<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240328142704 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TEMPORARY TABLE __temp__category AS SELECT id, name FROM category');
        $this->addSql('DROP TABLE category');
        $this->addSql('CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name VARCHAR(255) NOT NULL)');
        $this->addSql('INSERT INTO category (id, name) SELECT id, name FROM __temp__category');
        $this->addSql('DROP TABLE __temp__category');
        $this->addSql('CREATE TEMPORARY TABLE __temp__user AS SELECT id, name, email FROM user');
        $this->addSql('DROP TABLE user');
        $this->addSql('CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL)');
        $this->addSql('INSERT INTO user (id, name, email) SELECT id, name, email FROM __temp__user');
        $this->addSql('DROP TABLE __temp__user');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TEMPORARY TABLE __temp__category AS SELECT id, name FROM category');
        $this->addSql('DROP TABLE category');
        $this->addSql('CREATE TABLE category (id INTEGER DEFAULT NULL, name VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('INSERT INTO category (id, name) SELECT id, name FROM __temp__category');
        $this->addSql('DROP TABLE __temp__category');
        $this->addSql('CREATE TEMPORARY TABLE __temp__user AS SELECT id, name, email FROM user');
        $this->addSql('DROP TABLE user');
        $this->addSql('CREATE TABLE user (id INTEGER DEFAULT NULL, name VARCHAR(255) DEFAULT NULL, email VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('INSERT INTO user (id, name, email) SELECT id, name, email FROM __temp__user');
        $this->addSql('DROP TABLE __temp__user');
    }
}
