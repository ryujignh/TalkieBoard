require 'test_helper'

class TranslatorTest < ActiveSupport::TestCase

  def test_translate
    VCR.use_cassette("model/api_response") do
      response = Translator.new.translate('apple')
      assert_equal('林檎',
        response,
        "Should translate Apple in Japanese")
    end

  end
end
