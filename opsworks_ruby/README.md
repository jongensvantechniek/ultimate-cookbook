# opsworks_ruby Cookbook

[![Chef cookbook](https://img.shields.io/cookbook/v/opsworks_ruby.svg)](https://supermarket.chef.io/cookbooks/opsworks_ruby)
[![Build Status](https://travis-ci.org/ajgon/opsworks_ruby.svg?branch=master)](https://travis-ci.org/ajgon/opsworks_ruby)
[![Coverage Status](https://coveralls.io/repos/github/ajgon/opsworks_ruby/badge.svg?branch=master)](https://coveralls.io/github/ajgon/opsworks_ruby?branch=master)
[![Documentation Status](https://readthedocs.org/projects/opsworks-ruby/badge/?version=latest)](http://opsworks-ruby.readthedocs.io/en/latest/?badge=latest)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![license](https://img.shields.io/github/license/ajgon/opsworks_ruby.svg?maxAge=2592000)](https://opsworks-ruby.mit-license.org/)

A [chef](https://www.chef.io/) cookbook to deploy Ruby applications to Amazon OpsWorks.

## Quick Start

Refer to [Getting Started](http://opsworks-ruby.readthedocs.io/en/latest/getting_started.html)
guide in [documentation](http://opsworks-ruby.readthedocs.io/en/latest/index.html).

## Development

You can either install eveyrthing locally using [rvm](https://rvm.io/) and [pip](https://pypi.python.org/pypi/pip)
or use the Docker container which includes all necessary dependencies inside it.

### Unit Testing and Linting

```
docker-compose run -e SKIP="AuthorName AuthorEmail" cookbook \
bash -c "overcommit --sign && overcommit -r && rspec"
```

### Integration Testing

To run integration tests you need [Chef Development Kit](https://downloads.chef.io/chefdk).
After installing it, invoke:

```
chef exec bundle install -j 4 --path vendor
sudo chef exec bundle exec rake integration:docker
```

### Build documentation

```
docker-compose run cookbook bash -c "cd docs && make html"
```

## Contributing

Please see [CONTRIBUTING](https://github.com/ajgon/opsworks_ruby/blob/master/CONTRIBUTING.md)
for details.

## Author and Contributors

Author: [Igor Rzegocki](https://www.rzegocki.pl/) ([@ajgon](https://github.com/ajgon))

### Contributors

* Phong Si ([@phongsi](https://github.com/phongsi))
* Nathan Flood ([@npflood](https://github.com/npflood))
* Marcos Beirigo ([@marcosbeirigo](https://github.com/marcosbeirigo))
* Kevin Pheasey ([@kpheasey](https://github.com/kpheasey))
* Teruo Adachi ([@interu](https://github.com/interu))

## License

License: [MIT](http://opsworks-ruby.mit-license.org/)
