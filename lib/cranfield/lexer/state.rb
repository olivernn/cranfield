require 'strscan'

module Cranfield
  module Lexer
    class State
      EOS = "EOS".freeze

      attr_reader :lexemes

      def initialize(source)
        @source = source
        @start = 0
        @position = -1
        @lexemes = []
        @state = Lexer::Text
      end

      def consume_line
        loop do
          case self.next
          when "\n", EOS
            break
          end
        end
      end

      def next
        return EOS if position > source.size
        self.position += 1
        source[position]
      end

      def peek
        return EOS if position > source.size
        source[position + 1]
      end

      def emit(lexeme)
        lexemes << lexeme.new(slice, start)
        self.start = self.position + 1
      end

      def run
        while state do
          step
        end
      end

      def step
        self.state = state.call(self)
      end

      def inspect
        "#{self.class.name}[start=#{start} pos=#{position} state=#{state.name}]"
      end

      def slice
        source[start..position]
      end

      protected

      attr_accessor :state, :position, :start

      private

      attr_reader :source
    end
  end
end
