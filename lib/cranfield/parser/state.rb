require 'set'

module Cranfield
  module Parser
    class State
      def initialize(lexer)
        @lexer = lexer
        @attributes = {}
        @fields = Set.new
        @current_field = nil
        @state = Parser::FieldName
      end

      def field=(field_name)
        if fields.include? field_name
          puts self.inspect
          fail "Duplicate field '#{field_name}'"
        end

        self.current_field = field_name
        fields << field_name
      end

      def value=(field_value)
        if current_field.nil?
          fail "field not set"
        end

        attributes[current_field] = field_value
        self.current_field = nil

        if all_fields_populated?
          document = Document.new(attributes)
          reset
          Fiber.yield document
        end
      end

      def run
        Fiber.new do
          while state do
            step
          end
          Fiber.yield :eos
        end
      end

      def step
        self.state = state.call(lexer.resume, self)
      end

      def inspect
        "Parser::State[attributes=#{attributes} current_field=#{current_field} state=#{state}]"
      end

      protected

      attr_accessor :state, :current_field

      private

      attr_reader :lexer, :fields, :attributes

      def all_fields_populated?
        Document::RequiredFields.all? do |field_name|
          attributes.has_key?(field_name)
        end
      end

      def reset
        attributes.clear
        fields.clear
      end
    end
  end
end
