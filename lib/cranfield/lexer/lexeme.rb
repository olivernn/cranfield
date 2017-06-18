module Cranfield
  module Lexer
    module Lexeme
      class Base
        attr_reader :content

        def initialize(content = "")
          @content = content
        end
      end

      FieldName = Class.new(Base)
      FieldValue = Class.new(Base)
      EOS = :eos
    end
  end
end
