name 'workstation-windows'
maintainer 'Brian Holtkamp'
maintainer_email 'brholtkamp@gmail.com'
license 'all_rights'
description 'Installs and configures Windows workstations'
long_description 'A collection of recipes to setup different Windows environments to handle different tasks'
version '0.1.3'
supports 'windows'
issues_url 'https://github.com/brholtkamp/workstation-windows/issues' if respond_to?(:issues_url)
source_url 'https://github.com/brholtkamp/workstation-windows' if respond_to?(:source_url)

depends 'chocolatey'
depends 'msys2'
depends 'vagrant'
depends 'windows'
depends 'workstation-common'
