name             'cook_rails'
maintainer       'Mercicc'
maintainer_email 'chouandy625@gmail.com'
license          'All rights reserved'
description      'Installs/Configures rails environment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends 'apt'
depends 'curl'
depends 'git'
depends 'nodejs'
depends 'nginx'
depends 'postgresql'
depends 'database'
depends 'sqlite'
depends 'rbenv'
depends 'unicorn-ng'
