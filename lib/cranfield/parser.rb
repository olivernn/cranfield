require 'cranfield/parser/state'
require 'cranfield/parser/field_name'
require 'cranfield/parser/field_value'

module Cranfield
  module Parser
    def self.parse(source)
      lexer = Lexer.lex(source)
      State.new(lexer).run
    end
  end
end

__END__


lexeme = fiber.resume
parser(


