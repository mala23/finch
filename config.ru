require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/server.rb')
require 'sass/plugin/rack'
use Sass::Plugin::Rack
require 'haml'

run Finch
