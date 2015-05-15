# Install and configure the Charges Borrower Frontend
class borrower_frontend {
  include ::standard_env

  vcsrepo { '/opt/borrower-frontend':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/LandRegistry/charges-borrower-frontend',
    revision => 'puppet-module',
    owner    => 'vagrant',
    group    => 'vagrant',
  }
  file { '/etc/init.d/borrower_frontend':
    ensure => 'file',
    mode   => '0755',
    owner  => 'vagrant',
    group  => 'vagrant',
    source => "puppet:///modules/${module_name}/borrower_frontend.initd",
  }
  file { '/etc/systemd/system/borrower_frontend.service':
    ensure => 'file',
    mode   => '0755',
    owner  => 'vagrant',
    group  => 'vagrant',
    source => "puppet:///modules/${module_name}/borrower_frontend.service",
    notify => Exec['systemctl-daemon-reload'],
  }
  service { 'borrower_frontend':
    ensure   => 'running',
    enable   => true,
    provider => 'systemd',
    require  => [
      Vcsrepo['/opt/borrower-frontend'],
      File['/etc/init.d/borrower_frontend'],
      File['/etc/systemd/system/borrower_frontend.service']
    ],
  }
}
