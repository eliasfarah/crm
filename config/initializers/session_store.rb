# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crm_session',
  :secret      => '1c8d1730098d426ac4a999c686ec38f487472a61364b48cbfebd01e85e82935c69c5853d204e5a3bb01bae8f850e1f572f83bb1fc6b3cff09a4e29838559ad65'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
