# Configures Nginx to add a custom X-Served-By header with the hostname

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
}

# Create Nginx configuration file to add custom header
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => file,
  content => "add_header X-Served-By \$hostname;\n",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  require => Package['nginx'],
  notify  => Service['nginx'],
}
