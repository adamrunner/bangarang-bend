class InstagramTask
  # repeating job that triggers InstagramDataJob in order to keep instagram data up to date
  include Delayed::RecurringJob
  run_every 5.minutes
  run_at Time.now.strftime("%-l:%M%p")
  timezone 'US/Pacific'
  def perform
    Delayed::Job.enqueue(InstagramDataJob.new)
  end
end

if ActiveRecord::Base.connection.table_exists? 'delayed_jobs'
  InstagramTask.schedule!
end
