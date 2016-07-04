name 'workstationwindows'
maintainer 'Brian Holtkamp'
maintainer_email 'brholtkamp@gmail.com'
license 'all_rights'
description 'Installs and configures Windows workstations'
long_description 'A collection of recipes to setup different Windows environments to handle different tasks'
version '0.1.1'

depends 'windows'
depends 'chocolatey'
depends 'mingw'

issues_url 'https://github.com/brholtkamp/workstation-windows/issues' if respond_to?(:issues_url)
source_url 'https://github.com/brholtkamp/workstation-windows' if respond_to?(:source_url)
