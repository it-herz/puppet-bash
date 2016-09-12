class bash::backup(){

  file { "/etc/setup/bacula/prepare_backup":
    content => template("bash/prepare.sh.erb"),
    ensure => present,
    mode => '777'
  }
  file { "/etc/setup/bacula/cleanup_backup":
    content => template("bash/cleanup.sh.erb"),
    mode => '777',
    ensure => present
  } 
  file { "/etc/setup/bacula/restore_from_backup":
    content => template("bash/restore.sh.erb"),
    mode => '777',
    ensure => present
  }
}