################################################################################
### This file contains the global variables for the various endpoints used   ###
### in acceptance tests, this abstracts the urls so that you will not        ###
### need to change every test when switching environments for example.       ###
################################################################################

$HELLOWORLD_DOMAIN = (ENV['HELLOWORLD_DOMAIN'] || 'http://localhost:5000')
$CHARGES_URL = (ENV['CHARGES_SIGN_DEED_URL'] || 'http://localhost:')
