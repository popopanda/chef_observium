default['observium']['yum']['epel'] = 'epel-release'
default['observium']['yum']['packages'] = %w( wget.x86_64 httpd.x86_64 php.x86_64 php-mysql.x86_64 php-gd.x86_64 php-posix php-mcrypt.x86_64 php-pear.noarch cronie.x86_64 net-snmp.x86_64 net-snmp-utils.x86_64 fping.x86_64 mariadb-server.x86_64 mariadb.x86_64 MySQL-python.x86_64 rrdtool.x86_64 subversion.x86_64 jwhois.x86_64 ipmitool.x86_64 graphviz.x86_64 ImageMagick.x86_64 libvirt.x86_64 )
default['observium']['apt']['packages'] = %w( libapache2-mod-php5 php5-cli php5-mysql php5-gd php5-mcrypt php5-json php-pear snmp fping mysql-server mysql-client python-mysqldb rrdtool subversion whois mtr-tiny ipmitool graphviz imagemagick libvirt-bin )
default['observium']['directory']['path'] = '/opt'
default['observium']['directory']['install_dir'] = '/opt/observium'
default['observium']['package']['url'] = 'http://www.observium.org/observium-community-latest.tar.gz'

default['observium']['directory']['chmod'] = '0770'

default['observium']['mysql']['service'] = 'default'
default['observium']['mysql']['client'] = 'default'
default['observium']['mysql']['gem'] = 'default'

default['observium']['mysql']['root']['password'] = ''
default['observium']['mysql']['observium']['password'] = ''

default['observium']['database']['mysql']['name'] = 'observium'
default['observium']['database']['user']['name'] = 'observium'

default['observium']['alert']['email'] = ''

default['observium']['rhel']['apache']['dir'] = '/etc/httpd/conf'

default['observium']['logs']['dir'] = '/opt/observium/logs'
default['observium']['html']['dir'] = '/opt/observium/html'

default['observium']['service']['httpd'] = 'httpd'


default['observium']['log']['rhel']['owner'] = 'apache'
default['observium']['log']['rhel']['group'] = 'apache'

default['observium']['rrd']['rhel']['owner'] = 'apache'
default['observium']['rrd']['rhel']['group'] = 'apache'

default['observium']['rrd']['debian']['owner'] = 'www-data'
default['observium']['rrd']['debian']['group'] = 'www-data'

default['observium']['login']['username'] = ''
default['observium']['login']['password'] = ''
