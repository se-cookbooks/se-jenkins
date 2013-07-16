name             "se-jenkins"
maintainer       "se-jenkins"
maintainer_email "se-jenkins"
license          "All rights reserved"
description      "Installs/Configures se-jenkins"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue "0.1.0"

depends "git"
depends "jenkins"
depends "percona"
depends "se-ruby", "~> 3.0"

# Projects
depends "streeteasy_com"
