require "payment_engine/version"
require "payment_engine/railtie"
require "payment_engine/payment_initiator"
require "payment_engine/payment_processor"
require "payment_engine/payment_query"

module PaymentEngine
  class Engine < ::Rails::Engine
    isolate_namespace PaymentEngine
  end
end
