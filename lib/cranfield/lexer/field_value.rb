module Cranfield
  module Lexer
    module FieldValue
      def self.call(state)
        state.consume_line
        case state.peek
        when ".", State::EOS
          state.emit(Lexeme::FieldValue)
          return Text
        else
          return FieldValue
        end
      end
    end
  end
end
