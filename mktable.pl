#!/usr/bin/perl
# Create table test
# Evan Miller, 6/2/16

# libs and modules
use lib "/usr/lib64/perl5/vendor_perl/DBI/";
use warnings;
use DBI;

# DBI CONFIG VARIABLES
$host = "mysql";
$database = "testdb";
$tablename = "items";
$user = "testdbro";
$pw = "heck";


#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:3306";

$dbh = DBI->connect($dsn,$username,$password);

@ddl = 	(
	"CREATE TABLE persons (
	height int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	weight int NOT NULL,
	name TEXT);"
)

for $sql(@ddl){
	$dbh->do($sql);
}

$dbh->disconnect();
