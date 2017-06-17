module Cranfield
  module Parser
    module FieldName
      def self.call(lexeme, state)
        unless Lexer::Lexeme::FieldName === lexeme
          fail "unexpected lexeme, expected field, found #{lexeme}"
        end

        case lexeme.content.strip[1]
        when "I"
          state.field = :id
        when "T"
          state.field = :title
        when "A"
          state.field = :author
        when "B"
          state.field = :bibliography
        when "W"
          state.field = :abstract
        else
          fail "Unexpected field type '#{lexeme.content}'"
        end

        Parser::FieldValue
      end
    end
  end
end
