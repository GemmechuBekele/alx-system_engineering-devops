# 2-puppet_custom_http_response_header.pp

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => file,
  content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    add_header X-Served-By \$hostname;

    root /var/www/html;
    index index.html index.htm;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
",
  notify  => Service['nginx'],
  require => Package['nginx'],
}
