# 7-puppet_install_nginx_web_server.pp

# Ensure nginx is installed and running
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}

# Create custom HTML file for root URL "/"
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Create custom redirect location
file_line { 'add_redirect_me_location':
  path  => '/etc/nginx/sites-available/default',
  line  => '    rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  match => '^\s*location / {',
  after => '^\s*location / {',
  require => Package['nginx'],
  notify  => Service['nginx'],
}
