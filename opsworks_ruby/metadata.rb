# frozen_string_literal: true

name 'opsworks_ruby'
maintainer 'Igor Rzegocki'
maintainer_email 'igor@rzegocki.pl'
license 'MIT'
description 'Set of chef recipes for OpsWorks based Ruby projects'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.6.0'
chef_version '~> 12.0' if respond_to?(:chef_version)

depends 'deployer'
depends 'chef_nginx'
depends 'logrotate'
depends 'ruby-ng'

supports 'amazon', '>= 2017.03'
supports 'ubuntu', '>= 16.04'

source_url 'https://github.com/ajgon/opsworks_ruby'
issues_url 'https://github.com/ajgon/opsworks_ruby/issues'
