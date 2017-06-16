module Cranfield
  module Lexer
    module FieldName
      def self.call(state)
        case state.next
        when 'I'
          state.emit(Lexeme::FieldName)
          return IdValue
        when 'A', 'T', 'B', 'W'
          state.emit(Lexeme::FieldName)
          return FieldValue
        else
          return Text
        end
      end
    end
  end
end
