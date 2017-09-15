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

# Ruby on Rails + Lemon Way API (JSON2)

## Common Scenario

### Register a Payer Wallet (RegisterWallet)

#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
  :clientMail => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com",
  :clientFirstName => "Payer",
  :clientLastName => "Payer"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.RegisterWalletResult",
    "WALLET" => {
      "ID" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
      "LWID" => "39271"
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
*   **LWID**: _39271_


### Get the details of Payer Wallet by ID (GetWalletDetails)

#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
      "BAL" => "0.00",
      "NAME" => "Payer PAYER",
      "EMAIL" => "ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com",
      "DOCS" => [],
      "IBANS" => [],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39271",
      "CARDS" => [],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
     "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
*   **BAL**: _0.00_
*   **NAME**: _Payer PAYER_
*   **EMAIL**: _ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39271_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Register a Receiver Wallet (RegisterWallet)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
  :clientMail => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
  :clientFirstName => "Receiver",
  :clientLastName => "Receiver"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.RegisterWalletResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "LWID" => "39272"
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **LWID**: _39272_



### Get the details of Receiver Wallet by email (GetWalletDetails)


#### Request

```ruby
{
  :email => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "BAL" => "0.00",
      "NAME" => "Receiver RECEIVER",
      "EMAIL" => "ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
      "DOCS" => [],
      "IBANS" => [],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39272",
      "CARDS" => [],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **BAL**: _0.00_
*   **NAME**: _Receiver RECEIVER_
*   **EMAIL**: _ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39272_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Update email for Receiver Wallet (UpdateWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
  :newEmail => "new-Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.UpdateWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "LWID" => "39272"
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **LWID**: _39272_



### Receiver Wallet with the new email (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
    "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
    "BAL" => "0.00",
    "NAME" => "Receiver RECEIVER",
    "EMAIL" => "new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
    "DOCS" => [],
    "IBANS" => [],
    "STATUS" => "5",
    "BLOCKED" => "0",
    "SDDMANDATES" => [],
    "LWID" => "39272",
    "CARDS" => [],
    "FirstName" => nil,
    "LastName" => nil,
    "CompanyName" => nil,
    "CompanyDescription" => nil,
    "CompanyWebsite" => nil,
    "isDebtor" => nil,
    "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **BAL**: _0.00_
*   **NAME**: _Receiver RECEIVER_
*   **EMAIL**: _new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39272_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Register a card for Payer Wallet (RegisterCard)


#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
  :cardType => "1",
  :cardNumber => "5017670000006700",
  :cardCode => "123",
  :cardDate => "12/2019"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.RegisterCardResult",
    "CARD" => {
      "ID" => "13174",
      "EXTRA" => {
        "IS3DS" => "0",
        "CTRY" => "",
        "AUTH" => "651163",
        "NUM" => "501767XXXXXX6700",
        "EXP" => "12/2019"
      }
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _13174_
*   **EXTRA**:
    *   **IS3DS**: _0_
    *   **CTRY**:
    *   **AUTH**: _651163_
    *   **NUM**: _501767XXXXXX6700_
    *   **EXP**: _12/2019_



### Pay with the registered card 13174 into Payer Wallet (MoneyInWithCardId)


#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
  :cardId => "13174",
  :amountTot => "100.00",
  :amountCom => "10.00",
  :comment => "(Ruby tuto) MoneyInWithCardId 100.00 to Payer"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.MoneyInResult",
    "TRANS" => {
      "HPAY" => {
        "ID" => "50629",
        "MLABEL" => "501767XXXXXX6700",
        "DATE" => "15/09/2017 16:14:54",
        "TIME" => nil,
        "SEN" => "",
        "REC" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
        "DEB" => "0.00",
        "CRED" => "90.00",
        "COM" => "10.00",
        "MSG" => "(Ruby tuto) MoneyInWithCardId 100.00 to Payer",
        "STATUS" => "3",
        "EXTRA" => {
          "IS3DS" => "0",
          "CTRY" => "",
          "AUTH" => "056266",
          "NUM" => nil,
          "EXP" => nil,
          "TYP" => nil
        },
        "INT_STATUS" => nil,
        "IS_FEE" => nil,
        "FEE_REF" => nil,
        "TYPE" => nil,
        "INT_MSG" => nil,
        "ORIGIN_ID" => nil,
        "PRIVATE_DATA" => nil,
        "SCHEDULED_DATE" => nil,
        "MTOKEN" => nil,
        "METHOD" => nil,
        "MID" => nil,
        "FROM_MONEYIN" => nil,
        "CARD_ID" => nil,
        "REFUND" => nil,
        "VCC" => nil
      }
    },
    "E" => nil
  }
}
```

#### Result

*   **HPAY**:
    *   **ID**: _50629_
    *   **MLABEL**: _501767XXXXXX6700_
    *   **DATE**: _15/09/2017 16:14:54_
    *   **TIME**:
    *   **SEN**:
    *   **REC**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
    *   **DEB**: _0.00_
    *   **CRED**: _90.00_
    *   **COM**: _10.00_
    *   **MSG**: _(Ruby tuto) MoneyInWithCardId 100.00 to Payer_
    *   **STATUS**: _3_
    *   **EXTRA**:
        *   **IS3DS**: _0_
        *   **CTRY**:
        *   **AUTH**: _056266_
        *   **NUM**:
        *   **EXP**:
        *   **TYP**:
    *   **INT_STATUS**:
    *   **IS_FEE**:
    *   **FEE_REF**:
    *   **TYPE**:
    *   **INT_MSG**:
    *   **ORIGIN_ID**:
    *   **PRIVATE_DATA**:
    *   **SCHEDULED_DATE**:
    *   **MTOKEN**:
    *   **METHOD**:
    *   **MID**:
    *   **FROM_MONEYIN**:
    *   **CARD_ID**:
    *   **REFUND**:
    *   **VCC**:



### Payer Wallet after the payment with card: 100.00 - 10.00 = 90.00 (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
      "BAL" => "90.00",
      "NAME" => "Payer PAYER",
      "EMAIL" => "ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com",
      "DOCS" => [],
      "IBANS" => [],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39271",
      "CARDS" => [
        {
          "ID" => "13173",
          "EXTRA" => {
            "IS3DS" => "0",
            "CTRY" => "",
            "AUTH" => "625272",
            "NUM" => "501767XXXXXX6700",
            "EXP" => "12/2019",
            "TYP" => "VISA"
          }
        },
        {
          "ID" => "13174",
          "EXTRA" => {
            "IS3DS" => "0",
            "CTRY" => "",
            "AUTH" => "651163",
            "NUM" => "501767XXXXXX6700",
            "EXP" => "12/2019",
            "TYP" => "VISA"
            }
         }
       ],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
  ```

#### Result

*   **ID**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
*   **BAL**: _90.00_
*   **NAME**: _Payer PAYER_
*   **EMAIL**: _ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39271_
*   **CARDS**:
    *   **ID**: _13173_
    *   **EXTRA**:
        *   **IS3DS**: _0_
        *   **CTRY**:
        *   **AUTH**: _625272_
        *   **NUM**: _501767XXXXXX6700_
        *   **EXP**: _12/2019_
        *   **TYP**: _VISA_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Payer send 10.00 to Receiver (SendPayment)


#### Request

```ruby
{
  :debitWallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
  :creditWallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
  :amount => "10.00",
  :message => "(Ruby tuto) SendPayment 10.00 from Payer to Receiver"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.SendPaymentResult",
    "TRANS_SENDPAYMENT" => {
      "HPAY" => {
        "ID" => "33871",
        "DATE" => "15/09/2017 16:14:55",
        "SEN" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
        "REC" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
        "DEB" => "10.00",
        "CRED" => "10.00",
        "COM" => "0.00",
        "STATUS" => "3"
      }
    },
    "E" => nil
  }
}
```

#### Result

*   **HPAY**:
    *   **ID**: _33871_
    *   **DATE**: _15/09/2017 16:14:55_
    *   **SEN**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
    *   **REC**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
    *   **DEB**: _10.00_
    *   **CRED**: _10.00_
    *   **COM**: _0.00_
    *   **STATUS**: _3_



### Payer Wallet after the transaction: 80.00 (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc",
      "BAL" => "80.00",
      "NAME" => "Payer PAYER",
      "EMAIL" => "ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com",
      "DOCS" => [],
      "IBANS" => [],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39271",
      "CARDS" => [
        {
          "ID" => "13173",
          "EXTRA" => {
            "IS3DS" => "0",
            "CTRY" => "",
            "AUTH" => "625272",
            "NUM" => "501767XXXXXX6700",
            "EXP" => "12/2019",
            "TYP" => "VISA"
          }
        },
        {
          "ID" => "13174",
          "EXTRA" => {
            "IS3DS" => "0",
            "CTRY" => "",
            "AUTH" => "651163",
            "NUM" => "501767XXXXXX6700",
            "EXP" => "12/2019",
            "TYP" => "VISA"
          }
        }
      ],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Payer-6d64cb06-f2e3-481c-a881-db3f11df72dc_
*   **BAL**: _80.00_
*   **NAME**: _Payer PAYER_
*   **EMAIL**: _ruby-payer-6d64cb06-f2e3-481c-a881-db3f11df72dc@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39271_
*   **CARDS**:
    *   **ID**: _13173_
    *   **EXTRA**:
        *   **IS3DS**: _0_
        *   **CTRY**:
        *   **AUTH**: _625272_
        *   **NUM**: _501767XXXXXX6700_
        *   **EXP**: _12/2019_
        *   **TYP**: _VISA_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Receiver Wallet after the transaction: 10.00 (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "BAL" => "10.00",
      "NAME" => "Receiver RECEIVER",
      "EMAIL" => "new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
      "DOCS" => [],
      "IBANS" => [],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39272",
      "CARDS" => [],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **BAL**: _10.00_
*   **NAME**: _Receiver RECEIVER_
*   **EMAIL**: _new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**: _[]_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39272_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Receiver register an IBAN (RegisterIBAN)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
  :holder => "Receiver Receiver",
  :bic => "ABCDEFGHIJK",
  :iban => "FR1420041010050500013M02606",
  :dom1 => "UNEBANQUE MONTREUIL",
  :dom2 => "56 rue de Lays",
  :comment => "(Ruby tuto) Register IBAN"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.RegisterIBANResult",
    "IBAN_REGISTER" => {
      "S" => "5",
      "ID" => "9592"
      },
      "E" => nil
    }
  }
```

#### Result

*   **S**: _5_
*   **ID**: _9592_



### Receiver Wallet with an IBAN registered (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "BAL" => "10.00",
      "NAME" => "Receiver RECEIVER",
      "EMAIL" => "new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
      "DOCS" => [],
      "IBANS" => [
        {
          "ID" => "9592",
        "S" => "5",
        "DATA" => "FR1420041010050500013M02606",
        "SWIFT" => "ABCDEFGHIJK",
        "HOLDER" => "RECEIVER RECEIVER"
        }
      ],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39272",
      "CARDS" => [],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **BAL**: _10.00_
*   **NAME**: _Receiver RECEIVER_
*   **EMAIL**: _new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**:
    *   **ID**: _9592_
    *   **S**: _5_
    *   **DATA**: _FR1420041010050500013M02606_
    *   **SWIFT**: _ABCDEFGHIJK_
    *   **HOLDER**: _RECEIVER RECEIVER_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39272_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:



### Receiver do a Money Out with the registered IBAN 9592 (MoneyOut)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
  :amountTot => "10.00",
  :message => "(Ruby tuto) Money Out 10.00",
  :ibanId => "9592",
  :autoCommission => "1"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.MoneyOutResultObject",
    "TRANS" => {
      "HPAY" => {
        "ID" => "50630",
        "MLABEL" => "FR1420041010050500013M02606",
        "MID" => "9592",
        "DATE" => "15/09/2017 16:15:03",
        "SEN" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
        "REC" => "",
        "DEB" => "10.00",
        "CRED" => "0.00",
        "COM" => "0.00",
        "MSG" => "(Ruby tuto) Money Out 10.00",
        "STATUS" => "3"
      }
    },
    "E" => nil
  }
}
```

#### Result

*   **HPAY**:
    *   **ID**: _50630_
    *   **MLABEL**: _FR1420041010050500013M02606_
    *   **MID**: _9592_
    *   **DATE**: _15/09/2017 16:15:03_
    *   **SEN**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
    *   **REC**:
    *   **DEB**: _10.00_
    *   **CRED**: _0.00_
    *   **COM**: _0.00_
    *   **MSG**: _(Ruby tuto) Money Out 10.00_
    *   **STATUS**: _3_



### Receiver Wallet after the Money Out: 0.00 (GetWalletDetails)


#### Request

```ruby
{
  :wallet => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53"
}
```

#### Raw response

```ruby
{
  "d" => {
    "__type" => "WonderLib.GetWalletDetailsResult",
    "WALLET" => {
      "ID" => "Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53",
      "BAL" => "0.00",
      "NAME" => "Receiver RECEIVER",
      "EMAIL" => "new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com",
      "DOCS" => [],
      "IBANS" => [
        {
          "ID" => "9592",
          "S" => "5",
          "DATA" => "FR1420041010050500013M02606",
          "SWIFT" => "ABCDEFGHIJK",
          "HOLDER" => "RECEIVER RECEIVER"
        }
      ],
      "STATUS" => "5",
      "BLOCKED" => "0",
      "SDDMANDATES" => [],
      "LWID" => "39272",
      "CARDS" => [],
      "FirstName" => nil,
      "LastName" => nil,
      "CompanyName" => nil,
      "CompanyDescription" => nil,
      "CompanyWebsite" => nil,
      "isDebtor" => nil,
      "payerOrBeneficiary" => nil
    },
    "E" => nil
  }
}
```

#### Result

*   **ID**: _Ruby-Receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53_
*   **BAL**: _0.00_
*   **NAME**: _Receiver RECEIVER_
*   **EMAIL**: _new-ruby-receiver-a21f6a27-d2b7-472d-a086-fe9a41feca53@lemonway.com_
*   **DOCS**: _[]_
*   **IBANS**:
    *   **ID**: _9592_
    *   **S**: _5_
    *   **DATA**: _FR1420041010050500013M02606_
    *   **SWIFT**: _ABCDEFGHIJK_
    *   **HOLDER**: _RECEIVER RECEIVER_
*   **STATUS**: _5_
*   **BLOCKED**: _0_
*   **SDDMANDATES**: _[]_
*   **LWID**: _39272_
*   **CARDS**: _[]_
*   **FirstName**:
*   **LastName**:
*   **CompanyName**:
*   **CompanyDescription**:
*   **CompanyWebsite**:
*   **isDebtor**:
*   **payerOrBeneficiary**:


