#!/usr/bin/env ruby
require_relative 'log_entry'
require_relative 'log_writer'
require 'pathname'

class Parser
  attr_accessor :log_entries, :log_writer

  def initialize
    @log_entries = Hash.new
    @log_writer  = LogWriter.new
  end

  def parse_args args
    file_path = Pathname.new(args.first.to_s)

    if file_path.exist? && file_path.extname == '.log'
      parse_file file_path
    else
      raise ArgumentError, 'File must exist and have extention .log'
    end
  end

  def parse_file file_path
    File.open( file_path ).each do |line|
      page_url   = line.split[0]
      ip_address = line.split[1]

      # this reads line by line and gives a map of
      # each unique visit to the page (and how many times that
      # visitor has visited the page)
      if @log_entries.has_key?(line)
        # update num hits
        @log_entries[line].increment_visits
      else
        # unique visitor
        @log_entries.store(
          line,
          LogEntry.new(page_url, ip_address)
        )
      end
    end

    @log_writer.print_hits_per_page(@log_entries)
    @log_writer.print_unique_visits(@log_entries)
  end
end

if __FILE__ == $0
  parser = Parser.new
  raise ArgumentError, 'Usage: ./parser.rb <file_path>' unless ARGV.length == 1
  parser.parse_args ARGV
end
