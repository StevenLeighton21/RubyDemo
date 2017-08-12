class LogWriter
  def print_hits_per_page log_entries
    total_visits = Hash.new
    log_entries.each do |key, value|
      if total_visits.has_key?(value.page_url)
        # add the running visit total for this page
        total_visits[value.page_url] =
          total_visits[value.page_url] + value.num_visits
      else
        total_visits.store(value.page_url, value.num_visits)
      end
    end

    sort_and_print_log_entries(total_visits, "visits")
  end

  def print_unique_visits log_entries
    unique_visits = Hash.new

    # convert each duplicate key to a count of unique visitors
    log_entries.each do |key, value|
      if unique_visits.has_key?(key.split[0])
        unique_visits[key.split[0]] = unique_visits[key.split[0]] += 1
      else
        unique_visits.store(key.split[0], 1)
      end
    end

    sort_and_print_log_entries(unique_visits, "unique visitors")
  end

  private
    def sort_and_print_log_entries(log_entries, additional_string = '')
      log_entries.sort_by{|key, value| value}.reverse.to_h.each do |key, value|
        puts "#{key} #{value} #{additional_string}"
      end
    end
end
