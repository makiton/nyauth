module Nyauth
  class ConfirmationRequestService
    include ActiveModel::Model
    attr_reader :email, :client

    def initialize(confirmation_request_service_params = {})
      @email = confirmation_request_service_params[:email]
    end

    def save(options = {})
      options.reverse_merge!(as: :user)
      klass = options[:as].to_s.classify.constantize
      @client = klass.find_by!(email: @email)
      @client.request_confirmation
    rescue
      errors.add(:base, :invalid_email)
    end
  end
end
