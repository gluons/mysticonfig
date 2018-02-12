# mysticonfig
[![license](https://img.shields.io/github/license/gluons/mysticonfig.svg?style=flat-square)](./LICENSE)
[![Gem](https://img.shields.io/gem/v/mysticonfig.svg?style=flat-square)](https://rubygems.org/gems/mysticonfig)
[![Gem](https://img.shields.io/gem/dt/mysticonfig.svg?style=flat-square)](https://rubygems.org/gems/mysticonfig)
[![Gemnasium](https://img.shields.io/gemnasium/gluons/mysticonfig.svg?style=flat-square)](https://gemnasium.com/github.com/gluons/mysticonfig)
[![Travis](https://img.shields.io/travis/gluons/mysticonfig.svg?style=flat-square)](https://travis-ci.org/gluons/mysticonfig)
<br><br>
<p align="center">
	<strong>🔮 The configuration loader for wizard.</strong>
</p>
<br>

A library to load `.appnamerc`, `.appnamerc.json` or `.appnamerc.yaml` config file easily.

> Gem's name inspired by [cosmiconfig](https://github.com/davidtheclark/cosmiconfig)

## Installation

```bash
gem install mysticonfig
```

## Usage

```ruby
require 'mysticonfig'

loader = Mysticonfig::Loader.new 'appname'
config = loader.load # Automatically detect and load config
json_config = loader.load_json # Only load config from JSON file
yaml_config = loader.load_yaml # Only load config from YAML file (.yaml or .yml)
```