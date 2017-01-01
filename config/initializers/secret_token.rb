# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '392d4ba218c01a686110745d3299dad9f3bca9c0f860d180618b47ad8b7833598fba44815f5d3558288b3916799dce88aeb21f53cd749ffe12f1008d52548b06'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exists?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
