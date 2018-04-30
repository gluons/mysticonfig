# mysticonfig
[![license](https://img.shields.io/github/license/gluons/mysticonfig.svg?style=flat-square)](./LICENSE)
[![Gem](https://img.shields.io/gem/v/mysticonfig.svg?style=flat-square)](https://rubygems.org/gems/mysticonfig)
[![Gem](https://img.shields.io/gem/dt/mysticonfig.svg?style=flat-square)](https://rubygems.org/gems/mysticonfig)
[![Libraries.io for GitHub](https://img.shields.io/librariesio/github/gluons/mysticonfig.svg?style=flat-square)](https://libraries.io/github/gluons/mysticonfig)
[![Travis](https://img.shields.io/travis/gluons/mysticonfig.svg?style=flat-square)](https://travis-ci.org/gluons/mysticonfig)
<br><br>
<p align="center">
	<strong>🔮 The configuration loader for wizard.</strong>
</p>
<br>

A library to load `.appnamerc`, `.appnamerc.json` or `.appnamerc.yaml` config file easily.

`mysticonfig` will lookup for your config file.  
It keeps traversing up until it **finds the config file** or **reaches your home directory**.

> Gem's name inspired by [cosmiconfig](https://github.com/davidtheclark/cosmiconfig)

## Installation

```bash
gem install mysticonfig
```

## Usage

### Normal

```ruby
require 'mysticonfig'

loader = Mysticonfig::Loader.new 'appname'
config = loader.load # Automatically detect and load config
json_config = loader.load_json # Only load config from JSON file
yaml_config = loader.load_yaml # Only load config from YAML file (.yaml or .yml)
```

### With default config fallback

```ruby
require 'mysticonfig'

DEFAULT_CONFIG = {
	'a' => 'A',
	'b' => 'B',
	'c' => 'C'
}

loader = Mysticonfig::Loader.new('appname', DEFAULT_CONFIG)
config = loader.load # Automatically detect and load config
json_config = loader.load_json # Only load config from JSON file
yaml_config = loader.load_yaml # Only load config from YAML file (.yaml or .yml)
```

## Documentation

See https://gluons.github.io/mysticonfig/
