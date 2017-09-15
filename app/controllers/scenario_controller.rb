class ScenarioController < ApplicationController
    require 'net/http'
    require 'json'
    require 'securerandom'

  	DIRECKIT_URL 	= "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitjson2/Service.asmx"
  	LOGIN 			= "society"
  	PASSWORD 		= "123456"
  	LANGUAGE 		= "en"
  	IS_SANDBOX		= true

	def index
		# Register a Payer Wallet
		@payerWallet = "Ruby-Payer-" + SecureRandom.uuid
		@reqRegisterPayerWallet = {
			:wallet 			=> @payerWallet,
			:clientMail 		=> @payerWallet + "@lemonway.com",
			:clientFirstName 	=> "Payer",
			:clientLastName 	=> "Payer"
		}
		@rawRegisterPayerWallet 	= registerWallet(@reqRegisterPayerWallet)
		@resultRegisterPayerWallet 	= handleResponse(@rawRegisterPayerWallet, "WALLET").html_safe

		# GetWalletDetails with wallet ID
		@reqGetWalletDetailsPayerWallet = {
			:wallet => @payerWallet
		}
		@rawGetWalletDetailsPayerWallet 	= getWalletDetails(@reqGetWalletDetailsPayerWallet)
		@resultGetWalletDetailsPayerWallet	= handleResponse(@rawGetWalletDetailsPayerWallet, "WALLET").html_safe

		# Register a Receiver Wallet
		@receiverWallet = "Ruby-Receiver-" + SecureRandom.uuid
		@reqRegisterReceiverWallet = {
			:wallet 			=> @receiverWallet,
			:clientMail 		=> @receiverWallet + "@lemonway.com",
			:clientFirstName 	=> "Receiver",
			:clientLastName 	=> "Receiver"
		}
		@rawRegisterReceiverWallet 		= registerWallet(@reqRegisterReceiverWallet)
		@resultRegisterReceiverWallet 	= handleResponse(@rawRegisterReceiverWallet, "WALLET").html_safe

		# GetWalletDetails with email
		@reqGetWalletDetailsReceiverWallet = {
			:email => @receiverWallet + "@lemonway.com"
		}
		@rawGetWalletDetailsReceiverWallet 		= getWalletDetails(@reqGetWalletDetailsReceiverWallet)
		@resultGetWalletDetailsReceiverWallet	= handleResponse(@rawGetWalletDetailsReceiverWallet, "WALLET").html_safe

		# Update email for Receiver Wallet
		@reqUpdateWalletDetails = {
			:wallet 	=> @receiverWallet,
			:newEmail 	=> "new-" + @receiverWallet + "@lemonway.com"
		}
		@rawUpdateWalletDetails 	= updateWalletDetails(@reqUpdateWalletDetails)
		@resultUpdateWalletDetails	= handleResponse(@rawUpdateWalletDetails, "WALLET").html_safe

		# Receiver Wallet with the new email
		@reqGetWalletDetailsUpdated = {
			:wallet => @receiverWallet
		}
		@rawGetWalletDetailsUpdated 	= getWalletDetails(@reqGetWalletDetailsUpdated)
		@resultGetWalletDetailsUpdated	= handleResponse(@rawGetWalletDetailsUpdated, "WALLET").html_safe

		# Register a card for Payer Wallet
		@reqRegisterCard = {
			:wallet 	=> @payerWallet,
			:cardType 	=> "1",
			:cardNumber => "5017670000006700",
			:cardCode 	=> "123",
			:cardDate 	=> "12/2016"
		}
		@rawRegisterCard 	= registerCard(@reqRegisterCard)
		@resultRegisterCard	= handleResponse(@rawRegisterCard, "CARD").html_safe

		@cardId = unwrap(@rawRegisterCard)["CARD"]["ID"]

		# Pay with the registered card into Payer Wallet
		@reqMoneyInWithCardId = {
			:wallet 	=> @payerWallet,
			:cardId 	=> @cardId,
			:amountTot 	=> "100.00",
			:amountCom 	=> "10.00",
			:comment 	=> "(Ruby tuto) MoneyInWithCardId 100.00 to Payer"
		}
		@rawMoneyInWithCardId 		= moneyInWithCardId(@reqMoneyInWithCardId)
		@resultMoneyInWithCardId	= handleResponse(@rawMoneyInWithCardId, "TRANS").html_safe

		# Payer Wallet after the payment with card: 100.00 - 10.00 = 90.00 (€)
		@reqGetWalletDetailsPayerWalletCredited = {
			:wallet => @payerWallet
		}
		@rawGetWalletDetailsPayerWalletCredited 	= getWalletDetails(@reqGetWalletDetailsPayerWalletCredited)
		@resultGetWalletDetailsPayerWalletCredited	= handleResponse(@rawGetWalletDetailsPayerWalletCredited, "WALLET").html_safe

		# Payer send 10.00 to Receiver
		@reqSendPayment = {
			:debitWallet => @payerWallet,
			:creditWallet => @receiverWallet,
			:amount => "10.00",
			:message => "(Ruby tuto) SendPayment 10.00 from Payer to Receiver"
		}
		@rawSendPayment 	= sendPayment(@reqSendPayment)
		@resultSendPayment	= handleResponse(@rawSendPayment, "TRANS_SENDPAYMENT").html_safe

		# Payer Wallet after the transaction: 80.00
		@reqGetWalletDetailsPayerDebited = {
			:wallet => @payerWallet
		}
		@rawGetWalletDetailsPayerDebited 	= getWalletDetails(@reqGetWalletDetailsPayerDebited)
		@resultGetWalletDetailsPayerDebited	= handleResponse(@rawGetWalletDetailsPayerDebited, "WALLET").html_safe

		# Receiver Wallet after the transaction: 10.00
		@reqGetWalletDetailsReceiverCredited = {
			:wallet => @receiverWallet
		}
		@rawGetWalletDetailsReceiverCredited 	= getWalletDetails(@reqGetWalletDetailsReceiverCredited)
		@resultGetWalletDetailsReceiverCredited	= handleResponse(@rawGetWalletDetailsReceiverCredited, "WALLET").html_safe

		# Receiver register an IBAN
		@reqRegisterIban = {
			:wallet 	=> @receiverWallet,
			:holder 	=> "Receiver Receiver",
			:bic 		=> "ABCDEFGHIJK",
			:iban 		=> "FR1420041010050500013M02606",
			:dom1 		=> "UNEBANQUE MONTREUIL",
			:dom2 		=> "56 rue de Lays",
			:comment 	=> "(Ruby tuto) Register IBAN"
		}
		@rawRegisterIban 	= registerIban(@reqRegisterIban)
		@resultRegisterIban	= handleResponse(@rawRegisterIban, "IBAN_REGISTER").html_safe

		@ibanId = unwrap(@rawRegisterIban)["IBAN_REGISTER"]["ID"]

		# Receiver Wallet with an IBAN registered
		@reqGetWalletDetailsReceiverIban = {
			:wallet => @receiverWallet
		}
		@rawGetWalletDetailsReceiverIban 	= getWalletDetails(@reqGetWalletDetailsReceiverIban)
		@resultGetWalletDetailsReceiverIban	= handleResponse(@rawGetWalletDetailsReceiverIban, "WALLET").html_safe

		# Receiver do a Money Out with the registered IBAN
		@reqMoneyOut = {
			:wallet 		=> @receiverWallet,
			:amountTot 		=> "10.00",
			:message 		=> "(Ruby tuto) Money Out 10.00",
			:ibanId 		=> @ibanId,
			:autoCommission => "1"
		}
		@rawMoneyOut 	= moneyOut(@reqMoneyOut)
		@resultMoneyOut	= handleResponse(@rawMoneyOut, "TRANS").html_safe

		# Receiver Wallet after the Money Out: 0.00
		@reqGetWalletDetailsReceiverDebited = {
			:wallet => @receiverWallet
		}
		@rawGetWalletDetailsReceiverDebited 	= getWalletDetails(@reqGetWalletDetailsReceiverDebited)
		@resultGetWalletDetailsReceiverDebited	= handleResponse(@rawGetWalletDetailsReceiverDebited, "WALLET").html_safe
	end

	private
		def printResult(hash, error=false)
			html = "<ul"
			html += " style='color: red'" if error
			html += ">"
			hash.each do |k, v|
				html += "<li><strong>#{k}</strong>: "
				if v.is_a?(Hash)
					html += printResult(v)
				elsif v.is_a?(Array) && v[0] != nil
					html += printResult(v[0])
				else
					html += "<em>#{v}</em>"
				end
				html += "</li>"
			end
			html += "</ul>"
		end

		def unwrap(response)
			response["d"]
		end

		def handleResponse(response, key)
			response = unwrap(response)
			response["E"] ? printResult(response["E"], true) : printResult(response[key])
		end

		def sendRequest(method, version, params)
			uri = URI.parse(DIRECKIT_URL + "/" + method)
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			if IS_SANDBOX
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			req = Net::HTTP::Post.new(uri)
			req.add_field('Content-Type', 'application/json; charset=utf-8')
			common_params = {
				:wlLogin 	=> LOGIN,
				:wlPass 	=> PASSWORD,
				:language 	=> LANGUAGE,
				:version 	=> version,
				:walletIp 	=> request.remote_ip,
				:walletUa 	=> request.user_agent
			}
			params = common_params.merge(params)
			req.body = { :p => params }.to_json
			JSON.parse(http.request(req).body)
		end

		# API Methods
		def registerWallet(params)
			sendRequest("RegisterWallet", "1.1", params)
		end

		def getWalletDetails(params)
			sendRequest("GetWalletDetails", "1.9", params)
		end

		def updateWalletDetails(params)
			sendRequest("UpdateWalletDetails", "1.0", params)
		end

		def registerCard(params)
			sendRequest("RegisterCard", "1.2", params)
		end

		def moneyInWithCardId(params)
			sendRequest("MoneyInWithCardId", "1.1", params)
		end

		def sendPayment(params)
			sendRequest("SendPayment", "1.0", params)
		end

		def registerIban(params)
			sendRequest("RegisterIBAN", "1.1", params)
		end

		def moneyOut(params)
			sendRequest("MoneyOut", "1.3", params)
		end
end
