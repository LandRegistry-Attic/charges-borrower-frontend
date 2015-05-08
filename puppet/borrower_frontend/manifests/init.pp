# Install and configure the Charges Borrower Frontend
class borrower_frontend {
  vcsrepo { '/opt/borrower-frontend':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/LandRegistry/charges-borrower-frontend',
    revision => 'master'
  }
  file { '/etc/init.d/borrower_frontend':
    ensure => 'file',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/borrower_frontend_service.sh",
    notify => Service['borrower_frontend'],
  }
  service { 'borrower_frontend':
    ensure => 'running',
    enable => true,
  }
}
