require_relative 'spec_helper'

describe Parser do
  before :each do
    @parser = Parser.new
  end

 describe 'new' do
   it 'is created with zero parameters' do
     expect(@parser).to be_a Parser
   end
 end

 describe 'parse args' do
   it 'raises an error if the file does not exist' do
     expect{@parser.parse_args(['not_a_file'])}.to raise_error(ArgumentError)
   end

   it 'raises an error if the file is not a .log file' do
     expect{@parser.parse_args(['parser.rb'])}.to raise_error(ArgumentError)
   end
 end

 describe 'run' do
   it 'parses the file line by line' do
     # the log writer spec tests the output, this test is
     # only concerned that the file lines were parsed into objects
     @parser.parse_file './testdata/testdata.log'
     expect(@parser.log_entries.length).to eq(4)
     # check ordering - should be unsorted
     # first entry in the test data was only visited once overall
     expect(@parser.log_entries.values.first.num_visits).to eq(1)
   end
 end
end
