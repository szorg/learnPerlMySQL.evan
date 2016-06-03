#!/usr/bin/perl

use warnings;
use mysql;

print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
$host = "mysql";
$database = "testdb";
$tablename = "things";
$user = "testdbro";
$pw = "heck";

# PERL MYSQL CONNECT()
$connect = mysql->connect($host, $database, $user, $pw);

# SELECT DB
$connect->selectdb($database);

# DEFINE A MySQL QUERY
$myquery = "INSERT INTO;
$tablename (id, product, quantity)
VALUES (DEFAULT,'pineapples','15')";

# EXECUTE QUERY FUNCTION
$execute = $connect->query($myquery);

# GET AFFECTED ROWS
$affectedrows = $execute->affectedrows($myquery);

# ID OF LAST INSERT
$lastid = $execute->insertid($myquery);

print $affectedrows."<br />";
print $lastid."<br />";
