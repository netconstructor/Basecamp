# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_basecamp_session',
  :secret      => '3472c738722903ec6b5fddfd0f81469bf6190d224de1bf255527e3f3239205e76d4a2ef4548ae5417107d6750c71116c2986dd9d97694c42c9dbfb45f016ee20'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
