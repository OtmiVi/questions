module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found(exception)
      logger.warn exception.message
      render file: "public/404.html", status: :not_found, layout: false
    end
  end
end
