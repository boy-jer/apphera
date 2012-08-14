require_relative './scraper'

@scraper = Scraper.new

loop do
  begin
    @scraper.set_job Job.new
    @scraper.run
  rescue => e #Job::EmptyQueue => e
    puts 'The queue is empty.' + e.inspect

  end
  sleep 5
end