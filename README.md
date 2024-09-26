# PaymentEngine
## Description

# PaymentEngine

## Description
#### PaymentEngine
PaymentEngine is a robust and flexible payment processing engine designed to be integrated into Ruby on Rails applications. 
This engine is part of demonstrates using Rails with an engine to provide comprehensive features to handle various payment operations,
ensuring secure and efficient transactions. By using a separate repository for the engine and  gain several benefits as:

**Isolation:** The engine's codebase is kept isolated from the main application, making it easier to manage and maintain.
**Reusability:** The engine can be reused in other projects without duplicating code.
**Versioning:** The engine can be versioned independently from the main application, which can be useful for managing dependencies and updates.

An example of a payment engine that can be integrated into a Ruby on Rails application to handle payment processing. 
The engine provides a comprehensive set of features to manage payment operations, including transaction management, payment gateway integration, and secure handling of payment data. 
By using the engine, developers can easily add payment functionalities to their Rails applications without having to 
build them from scratch.
In this [repository](https://github.com/nirbelelti/PaymentsDemoApp), you will find examples of how to integrate the payment engine into a Rails application and 
use its features to process payments.

PaymentEngine is a robust and flexible payment processing engine designed to be integrated into Ruby on Rails applications.
It provides a comprehensive set of features to handle various payment operations, ensuring secure and efficient transactions.

## Features

- **PaymentInitiator:** Initiate a payment/refund for transaction with the specified amount sender receiver and vendor.
- **PaymentProcessor:** Create a transaction of payments between organisations (assuming that the actual transaction made by a vendor).
- **PaymentQuery:** Query for a specific transaction by its id, all transactions of a specific sender or receiver, or all transactions.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "payment_engine" , git: "https://github.com/nirbelelti/payment_engine.git"
```

And then execute:
```bash
$ bundle
```
mount the engine in your routes.rb file
```ruby
mount PaymentEngine::Engine => "/payment_engine"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
