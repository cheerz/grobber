Grobber
=======
[![Gem Version](https://badge.fury.io/rb/grobber.svg)](http://badge.fury.io/rb/grobber)
[![Maintainability](https://api.codeclimate.com/v1/badges/6a6284f9262f82a565b0/maintainability)](https://codeclimate.com/repos/5cb0bfe29f67f402c2002ab5/maintainability)
[![CircleCI](https://circleci.com/gh/cheerz/grobber.svg?style=svg)](https://circleci.com/gh/cheerz/grobber)

Image generator based on a string value

# Install

    gem install grobber
    
or in your Gemfile:

    gem 'grobber'

## How to use

    grobber = Grobber::Image.new('some text string')
    grobber.write('foo.jpg')

Grobber will always render the same image for the same string. 

![Example0](examples/0.jpg)
![Example1](examples/1.jpg)
![Example2](examples/2.jpg)
![Example3](examples/3.jpg)
![Example4](examples/4.jpg)
![Example5](examples/5.jpg)
![Example6](examples/6.jpg)
![Example7](examples/7.jpg)
![Example8](examples/8.jpg)
![Example9](examples/9.jpg)
![Example10](examples/10.jpg)
