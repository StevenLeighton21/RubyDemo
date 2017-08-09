require_relative 'spec_helper'
require_relative '../log_entry'

describe LogWriter do
  before :each do
    @log_writer  = LogWriter.new
    @log_entries = {
      '/about/1 2222' => LogEntry.new('/about/1', '2222'),
      '/about 3333'   => LogEntry.new('/about', '3333'),
      '/home 1234'    => LogEntry.new('/home', '1234'),
      '/home 2345'    => LogEntry.new('/home', '2345'),
    }
    @log_entries['/home 1234'].increment_visits
  end

 describe 'new' do
   it 'is created with zero parameters' do
     expect(@log_writer).to be_a LogWriter
   end
 end

 describe 'sort and print the log entry objects' do
   it 'should print unique visitors in descending order' do
     expect{@log_writer.print_unique_visits(@log_entries)}.to output(
     "/home 2 unique visitors\n/about 1 unique visitors\n/about/1 1 unique visitors\n"
     ).to_stdout
   end
   it 'should print total visis per page in descending order' do
     expect{@log_writer.print_hits_per_page(@log_entries)}.to output(
     "/home 3 visits\n/about 1 visits\n/about/1 1 visits\n"
     ).to_stdout
   end
 end

end
