Sentry.init do |config|
    config.dsn = 'https://ce5d557078994a76abb06829776519f5@o1402496.ingest.sentry.io/6734665'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end
  