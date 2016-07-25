# ruby-client-direckit-json2
Examples in Ruby on Rails calling DirectKit JSON2

* Register a Payer Wallet (RegisterWallet)
* Register a Receiver Wallet (RegisterWallet)
* Update email for Receiver Wallet (UpdateWalletDetails)
* Register a credit card for Payer Wallet (RegisterCard)
* Pay 100.00€ to Payer Wallet with the registered card (MoneyInWithCardId)
* Send 10.00€ from Payer Wallet to Receiver Wallet (SendPayment)
* Register an IBAN for Receiver Wallet (RegisterIBAN)
* Take 10.00€ from Receiver Wallet to the registered IBAN (MoneyOut)

## Configuration

* Controller: _scenario_controller.rb_
```ruby
DIRECKIT_URL 	= "https://sandbox-api.lemonway.fr/mb/{#yourCompany}/dev/directkitjson2/Service.asmx"
LOGIN 			= "society"
PASSWORD 		= "123456"
LANGUAGE 		= "en"
IS_SANDBOX		= true
```
* View: _index.html.erb_
