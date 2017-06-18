require 'strscan'
require 'fiber'

module Cranfield
  module Lexer
    class State

      def initialize(source)
        @source = source
        @start = 0
        @position = -1
        @state = Lexer::Text
        @buffer = ""
      end

      def consume_line
        loop do
          case self.next
          when "\n", nil
            break
          end
        end
      end

      def next
        source.getc.tap do |char|
          buffer << char unless char.nil?
        end
      end

      def peek
        source.getc.tap do
          source.seek(-1, IO::SEEK_CUR)
        end
      end

      def emit(lexeme)
        l = lexeme.new(slice)
        buffer.clear
        Fiber.yield l
      end

      def run
        Fiber.new do
          while state do
            step
          end

          Fiber.yield Lexer::Lexeme::EOS
        end
      end

      def step
        self.state = state.call(self)
      end

      def inspect
        "#{self.class.name}[start=#{start} pos=#{position} state=#{state.name}]"
      end

      def slice
        buffer.clone
      end

      protected

      attr_accessor :state, :position, :start

      private

      attr_reader :source, :buffer
    end
  end
end
