function install_git() {
    which git > /dev/null
    GIT_FOUND=$?
    if [ "$GIT_FOUND" -eq '0' ]; then
        echo 'Git found'
    else
        echo 'Installing Git'
        apt-get -q -y install git
        echo 'Git installed'
    fi
}

function install_librarian_puppet() {
    if [ `gem search -i librarian-puppet` != true ]; then
        echo 'Installing librarian-puppet'
        mkdir -p /etc/puppet
        gem install librarian-puppet -v 3.0.0
    fi
}

# execute script
apt-get -q -y update
apt-get -q -y install ruby-dev=1:2.3.0+1 puppet=3.8.5-2ubuntu0.1
install_git
install_librarian_puppet
cp /vagrant/puppet/Puppetfile /usr/share/puppet/
cd /usr/share/puppet && librarian-puppet install --clean
