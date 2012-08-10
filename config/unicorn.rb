root = "/home/deployer/apps/apphera/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.apphera.sock"
worker_processes 30
timeout 30
