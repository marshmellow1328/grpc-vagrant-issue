# Install node, npx, and run npm install
class {'nodejs':
    version         => 'v10.13.0',
    make_install    => false
}
package {'npx':
    provider    => npm,
    require     => Class['nodejs']
}
# exec {'npm-install':
#     command => '/usr/local/node/node-default/bin/npm install',
#     cwd     => '/vagrant',
#     require => Class['nodejs']
# }

# default shell to /vagrant
file {'/home/vagrant/.profile':
    ensure  => present,
}
file_line {'Add to .profile':
    path    => '/home/vagrant/.profile',
    line    => 'cd /vagrant',
    require => File['/home/vagrant/.profile']
}
