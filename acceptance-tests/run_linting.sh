#################################################################################################
### This shell script is used to run style guide checkers on code in the acceptance-tests     ###
### folder such as Rubocop.                                                                   ###
#################################################################################################

### Installs any gems specified in the gemfile.
bundle install

### Run rubocop gem to check acceptance tests against the Ruby style guide.
### Will fail with exit code if any errors are raised
bundle exec rubocop -c rubocop.yml

exit $?
