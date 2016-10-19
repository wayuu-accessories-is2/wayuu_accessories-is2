Dotenv.load

#Braintree::Configuration.environment = ENV["BT_ENVIRONMENT"].to_sym
#Braintree::Configuration.merchant_id = ENV["BT_MERCHANT_ID"]
#Braintree::Configuration.public_key  = ENV["BT_PUBLIC_KEY"]
#Braintree::Configuration.private_key = ENV["BT_PRIVATE_KEY"]

Braintree::Configuration.environment = "sandbox".to_sym
Braintree::Configuration.merchant_id = "gb7cmjnnj68722n8"
Braintree::Configuration.public_key  = "p5h73rtzm88fhmky"
Braintree::Configuration.private_key = "96237bbbc3afb7e810daf2882019d15b"
