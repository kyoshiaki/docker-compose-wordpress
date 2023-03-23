#!/usr/bin/env ruby

#
# 2021/11/23(Tue) 00:03:54 初期バージョン
# 2023/03/21(Tue) 18:52:42 WP-CLI を追加
#

module Kind
	NONE = -1
	DOCKER = 1
	DOCKER_COMPOSE = 2
	DOCKER_COMPOSE_CLI = 3
	DOCKER_COMPOSE_CLI_COMMAND = 4
	OPEN = 5
	CODE = 6
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
	Kind::DOCKER_COMPOSE_CLI => "docker-compose run --rm cli",
	Kind::DOCKER_COMPOSE_CLI_COMMAND => "docker-compose run --rm cli",
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
	Execute.new(Kind::DOCKER_COMPOSE_CLI, "db search 'Hello world'", "wp db search 'Hello world'"),
	Execute.new(Kind::DOCKER_COMPOSE_CLI, "--help", "wp --help : 'q' to quit"),
	Execute.new(Kind::DOCKER_COMPOSE_CLI_COMMAND, "<COMMAND>", "wp <COMMAND>"),
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

  if (executes[i].kind == Kind::DOCKER_COMPOSE_CLI_COMMAND)
	# COMMAND
	puts <<-EOS
wp <COMMAND>
ex. 
  COMMAND:
    --info 
    --help 
    db search 'WordPress'
    search-replace 'https://example.com' 'https://example.net' --skip-columns=guid
    search-replace 'https://example.com' https://example.net' 
    search-replace 'Hello world' 'Welcome WordPress' 

EOS
	puts "COMMAND ?"
	arguments = gets

	exec = commands[executes[i].kind] + " " + arguments
  else	
  	exec = commands[executes[i].kind] + executes[i].to_s
  end

  print "❯ " + exec + "\n\n"

  # exec
  Kernel.exec(exec)
else
  STDERR.puts "Error"
end
