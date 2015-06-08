#################################################################################################
### This shell script is used to run style guide checkers on code in the acceptance-tests     ###
### folder such as Rubocop.                                                                   ###
#################################################################################################

currentLocation="$(cd "$(dirname "$0")"; pwd)"
gemfile=$currentLocation/Gemfile

### Installs any gems specified in the gemfile.
BUNDLE_GEMFILE=$gemfile bundle install

### Run rubocop gem to check acceptance tests against the Ruby style guide.
### Will fail with exit code if any errors are raised
BUNDLE_GEMFILE=$gemfile bundle exec rubocop -c $currentLocation/rubocop.yml

exit $?
