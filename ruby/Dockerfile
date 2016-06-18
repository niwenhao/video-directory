from debian

run apt-get update
run apt-get install -y aptitude
run aptitude install -y build-essential
run aptitude install -y libsqlite3-dev
run aptitude install -y mysql-client
run aptitude install -y libmysqlclient-dev
run aptitude install -y vim
run aptitude install -y imagemagick
run aptitude install -y libmagick-dev
run aptitude install -y libmagickcore-dev
run aptitude install -y libmagickwand-dev
run aptitude install -y pkg-config
run aptitude install -y curl
run aptitude install -y net-tools
run aptitude install -y locales
run aptitude install -y locales-all
run aptitude install -y git
run aptitude install -y procps
run aptitude install -y libssl-dev
run aptitude install -y libreadline-dev
run aptitude install -y zlib1g-dev
run aptitude install -y ncurses-dev
run localedef -i ja_JP -f UTF-8 ja_JP.UTF8
env LANG ja_JP.UTF8

workdir /opt
run curl https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz | tar -xzf -
workdir /opt/ruby-2.3.1
run ./configure && make install
run cd .. && rm -rf ruby-2.3.1
workdir /root

