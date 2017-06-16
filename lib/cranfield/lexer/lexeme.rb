module Cranfield
  module Lexer
    module Lexeme
      class Base
        attr_reader :content, :position

        def initialize(content, position)
          @content = content
          @position = position
        end
      end

      FieldName = Class.new(Base)
      FieldValue = Class.new(Base)
    end
  end
end
