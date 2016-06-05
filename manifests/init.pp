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
    file { "/etc/profile.d/autocomplete.sh":
      content => template("bash/autocomplete.sh.erb"),
      mode => '0644',
      owner => root,
      group => root
    }
  } 
  
}