require 'bundler/setup'

require_relative 'rspec-terraform/version'

RSpec.configure do |config|

  config.before(:each, provider: :aws) do
    ENV['TF_VAR_access_key'] = 'foo'
    ENV['TF_VAR_secret_key'] = 'bar'
  end

  config.after(:each, provider: :aws) do
    cleanup!
  end

  def cleanup!
    `rm -f plan.tf`
    `rm -f terraform.tfstate`
    `rm -f provider.tf`
  end
end
