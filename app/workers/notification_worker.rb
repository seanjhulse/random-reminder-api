class NotificationWorker
  include Sidekiq::Worker

  def perform(id)

    # Do something
    @job = Job.find(id)

    Rails.logger.info "Alert, you have a notification, #{@job.message}"
  end

  def cancelled?
    Sidekiq.redis {|c| c.exists("cancelled-#{jid}") }
  end

  def self.cancel!(jid)
    Sidekiq.redis {|c| c.setex("cancelled-#{jid}", 86400, 1) }
  end
end
