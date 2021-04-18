# tcfdg 

[![CI](https://github.com/frsnic/tcfdg/actions/workflows/ci.yml/badge.svg)](https://github.com/frsnic/tcfdg/actions/workflows/ci.yml)

### Requirements

* Mysql
* Redis (Ubuntu: sudo apt-get install redis-server)

### Usage

*Start Resque*
```ruby
$ QUEUE=* rake resque:work
```

### Erd
![tcfdg](https://raw.githubusercontent.com/frsnic/tcfdg/master/erd.jpg)

### Todo

* post author introduction
* dragonfly auto resize image
* sub category
* post parent_id
* seo

--------------------------
Copyright © 2016 frsnic.
