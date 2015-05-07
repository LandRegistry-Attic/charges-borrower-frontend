# Install and configure the Charges Borrower Frontend
class borrower_frontend {
  vcsrepo { '/opt/borrower-frontend':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/LandRegistry/charges-borrower-frontend',
    revision => 'master'
  }
}
