require 'cranfield/lexer/state'
require 'cranfield/lexer/lexeme'

require 'cranfield/lexer/field_name'
require 'cranfield/lexer/field_value'
require 'cranfield/lexer/id_value'
require 'cranfield/lexer/text'

module Cranfield
  module Lexer
    def self.lex(source)
      State.new(source).run
    end
  end
end
