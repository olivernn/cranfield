module Cranfield
  module Lexer
    module Text
      def self.call(state)
        loop do
          case state.next
          when State::EOS
            return nil
          when "."
            return FieldName
          end
        end
      end
    end
  end
end
