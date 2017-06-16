module Cranfield
  module Lexer
    module Text
      def self.call(state)
        loop do
          case state.next
          when nil
            return nil
          when "."
            return FieldName
          end
        end
      end
    end
  end
end
