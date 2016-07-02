class bash (
  $aliases = {},
  $autocomplete = true
) {
  validate_hash($aliases);
  
  file { "/etc/profile.d/alias.sh":
    content => template("bash/alias.sh.erb"),
    mode => '0644',
    owner => root,
    group => root
  }
  
  if ($autocomplete) {
  
    package { "bash-completion":
      ensure => installed,
    }
  
    file { "/etc/profile.d/autocomplete.sh":
      require => Package["bash-completion"],
      content => template("bash/autocomplete.sh.erb"),
      mode => '0644',
      owner => root,
      group => root
    }
  } 
  
}