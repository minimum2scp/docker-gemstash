require 'serverspec'

set :backend, :docker
set :docker_image, (ENV['DOCKER_IMAGE'] || "minimum2scp/gemstash:latest")

