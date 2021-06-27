module SublInit
  class Context
    def initialize(hash)
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def get_binding
      binding
    end

    def method_missing(method_name, *arguments, &block)
      instance_variable_name = "@#{method_name}"
      return instance_variable_get(instance_variable_name) if defined?(instance_variable_name)

      super
    end
  end
end
