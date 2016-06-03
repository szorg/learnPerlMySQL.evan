#!/usr/bin/perl
#Testing MYSQL insert functions
#Evan Miller, 6/2/16

# libs
use lib "/usr/lib64/perl5/vendor_perl/DBI/";

#Perl Modules
use warnings;
use DBD;
use DBD::mysql;

# DBI CONFIG VARIABLES
$host = "mysql";
$database = "testdb";
$tablename = "items";
$user = "testdbro";
$pw = "heck";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:3306";

#Perl DBI CONNECT
$connect = DBI->connect($dsn, $user, $pw) or die "Unable to connect: $DBI::errstr\n";

#Prepare Query
$query = "SELECT * FROM items ORDER BY itemid";
$query_handle = $connect->prepare($query);

##$query = "INSERT INTO items (itemid, name, quantity) VALUES (DEFAULT, 'tomato', 4)";
##$query_handle = $connect->prepare($query);

#Execute Query
$query_handle->execute();

#BIND TABLE COLUMNS TO VARIABLES
$query_handle->bind_columns(undef, \$itemid, \$name, \$quantity);

#LOOP THROUGH RESULTS
while($query_handle->fetch()) {
	print "$itemid, $name, $quantity <br />";
}
