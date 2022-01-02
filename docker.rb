#!/usr/bin/env ruby

#
# 2021/11/23(Tue) 00:03:54
#

module Kind
	NONE = -1
	DOCKER = 1
	DOCKER_COMPOSE = 2
	OPEN = 3
	CODE = 4
end

Execute = Struct.new(:kind,  :options, :description) do
	def to_s
		" #{options}"
	end

	def usage
		 ("%-42s:" % options)  + "#{description}"
	end
end

commands = { Kind::DOCKER => "docker",
	Kind::DOCKER_COMPOSE => "docker-compose",
	Kind::OPEN => "open",
	Kind::CODE => "code" }

executes = [ Execute.new(Kind::DOCKER, "container ls --all", "List containers"),
	Execute.new(Kind::DOCKER, "container --help", "help"),
	Execute.new(Kind::DOCKER, "image ls --all", "List images"),
	Execute.new(Kind::DOCKER, "image --help", "help"),
	Execute.new(Kind::DOCKER, "volume ls", "List volumes"),
	Execute.new(Kind::DOCKER, "volume --help", "help"),
	Execute.new(Kind::DOCKER, "volume rm docker-compose-wordpress_db_data", "Remove one or more volumes"),
	Execute.new(Kind::DOCKER_COMPOSE, "up -d", "Create and start containers"),
	Execute.new(Kind::DOCKER_COMPOSE, "restart", "Restart services"),
	Execute.new(Kind::DOCKER_COMPOSE, "start", "Start services"),
	Execute.new(Kind::DOCKER_COMPOSE, "stop",  "Stop services"),
	Execute.new(Kind::DOCKER_COMPOSE, "down", "Stop and remove containers, networks, images, and volumes"),
	Execute.new(Kind::DOCKER_COMPOSE, "ps --all", "List containers"),
	Execute.new(Kind::OPEN, "http://localhost:8000", "WordPress"),
	Execute.new(Kind::OPEN, "http://localhost:8000/wp-admin/", "WordPress admin"),
	Execute.new(Kind::OPEN, "http://localhost:8000/phpinfo.php", "WordPress: phpinfo.php"),
	Execute.new(Kind::OPEN, "http://localhost:8080", "phpMyAdmin"),
	Execute.new(Kind::OPEN, "http://localhost:8080/phpinfo.php", "phpMyAdmin: phpinfo.php"),
	Execute.new(Kind::OPEN, ".", "Finder"),
	Execute.new(Kind::CODE, ".", "Visual Studio Code")
]

com = Kind::NONE
executes.each_with_index do |value,i| 
	if com != value.kind 
		puts "#{commands[value.kind]}"
		com = value.kind
	end
		
	puts(" " * 2 + ("%3s" % i.to_s) + ": " + value.usage)
end

# input
puts "?"
inp = gets

i = inp.to_i

if ((i>=0) && (i<executes.length)) 
  exec = commands[executes[i].kind] + executes[i].to_s
  print "❯ " + exec + "\n\n"

  # exec
  Kernel.exec(exec)
else
  STDERR.puts "Error"
end
