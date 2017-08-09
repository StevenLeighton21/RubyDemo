
class LogEntry
  attr_accessor :page_url, :ip_address, :num_visits

  def initialize page_url, ip_address
    @page_url   = page_url
    @ip_address = ip_address
    @num_visits = 1
  end

  def increment_visits
    @num_visits = @num_visits + 1
  end
end
