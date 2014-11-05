require 'bundler'
Bundler.require

Dir.glob("./{helpers,models,controllers}/*.rb").each do |file|
  require file
  puts "required #{file}"
end

map('/'){ run ApplicationController }
