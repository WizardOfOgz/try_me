require "try_me/version"

module TryMe
  # Supports both || and | syntax
  #   object.try_me { maybe_method || other_possible_method || something_else }
  #   object.try_me { maybe_method | other_possible_method | something_else }
  def try_me(&block)
    Proxy.new(self).__try_me__(&block)
  end

  class Proxy < BasicObject
    def initialize(object)
      @__obj__ = object
    end

    def __getobj__
      @__obj__
    end

    def __try_me__(&block)
      if block
        yield_callback = ->(yielder) {
          self.__yielder__ = yielder
          instance_eval(&block)
        }
        ::Enumerator.new { |yielder|
          yield_callback.call(yielder)
        }.first
      end
    end

    def __yielder__=(yielder)
      @__yielder__ = yielder
    end

    def method_missing(method_name, *args, &block)
      if __getobj__.respond_to?(method_name)
        @__yielder__ << __getobj__.__send__(method_name, *args, &block)
      end
    end
  end
end

Object.include TryMe
