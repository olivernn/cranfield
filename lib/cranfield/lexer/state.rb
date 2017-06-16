require 'strscan'
require 'fiber'

module Cranfield
  module Lexer
    class State
      EOS = "EOS".freeze

      def initialize(source)
        @source = source
        @start = 0
        @position = -1
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
        l = lexeme.new(slice, start)
        self.start = self.position + 1
        Fiber.yield l
      end

      def run
        Fiber.new do
          while state do
            step
          end
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
