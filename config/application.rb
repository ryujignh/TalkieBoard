require_relative 'boot'

require 'rails/all'
require_relative '../lib/locale_parser'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TalkieBoard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |generate|
      generate.helper(false)
      generate.javascripts(false)
      # generate.assets(false)
    end

    #**************************************************************
    # I18N - LOCALIZATION
    #**************************************************************

    config.i18n.default_locale = :ja
    # automatically parse our special combined language I18n files and output into individual language YAML dictionaries
    LocaleParser.new.run if Rails.env.development?

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
