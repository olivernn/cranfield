module Cranfield
  module Lexer
    module IdValue
      def self.call(state)
        state.consume_line
        state.emit(Lexeme::FieldValue)
        return Text
      end
    end
  end
end
