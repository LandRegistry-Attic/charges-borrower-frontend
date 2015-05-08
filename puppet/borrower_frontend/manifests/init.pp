# Install and configure the Charges Borrower Frontend
class borrower_frontend {
  vcsrepo { '/opt/borrower-frontend':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/LandRegistry/charges-borrower-frontend',
    revision => 'puppet-module',
    notify   => Service['borrower_frontend'],
  }
  file { '/etc/systemd/system/borrower_frontend.service':
    ensure => 'file',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/borrower_frontend.service",
    notify => Service['borrower_frontend'],
  }
  service { 'borrower_frontend':
    ensure   => 'running',
    enable   => true,
    provider => 'systemd',
  }
  File['/etc/systemd/system/borrower_frontend.service']
    ~> Service['borrower_frontend']
}
