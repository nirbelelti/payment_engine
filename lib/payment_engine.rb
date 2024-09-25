require "payment_engine/version"
require "payment_engine/railtie"
require "payment_engine/payment_initiator" # Add this line
require "payment_engine/payment_processor" # Add this line
module PaymentEngine
  class Engine < ::Rails::Engine
    isolate_namespace PaymentEngine
  end
end
