require_relative 'spec_helper'

describe LogEntry do
  before :each do
    @log_entry = LogEntry.new 'home/', '127.0.0.1'
  end

describe 'new' do
  it 'should be created with two parameters' do
    expect(@log_entry).to be_a LogEntry
  end

  it 'should have a page url' do
    expect(@log_entry.page_url).to eq('home/')
  end

  it 'should have a visitor IP address' do
    expect(@log_entry.ip_address).to eq('127.0.0.1')
  end

  it('should initialize with num_visits = 1') do
    expect(@log_entry.num_visits).to eq(1)
  end
end

describe 'increment visits' do
  it('should increment visits when called') do
    @log_entry.increment_visits
    expect(@log_entry.num_visits).to eq(2)
  end
end

end
