module Cranfield
  module Parser
    module FieldValue
      def self.call(lexeme, state)
        return nil if lexeme == Lexer::Lexeme::EOS

        unless Lexer::Lexeme::FieldValue === lexeme
          fail "unexpected lexeme, expected value, found #{lexeme}"
        end

        state.value = lexeme.content.strip.gsub("\n", " ")

        Parser::FieldName
      end
    end
  end
end
