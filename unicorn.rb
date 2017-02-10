# frozen_string_literal: true
APP_PATH = File.expand_path File.dirname __FILE__
def tmp(name); File.join APP_PATH, 'tmp', name end

worker_processes 2
working_directory APP_PATH
timeout 30

listen tmp('socket'), backlog: 64
pid tmp('pid')
stdout_path tmp('stdout.log')
stderr_path tmp('stderr.log')
