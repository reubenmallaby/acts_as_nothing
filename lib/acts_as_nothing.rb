# ActsAsNothing
module TotallySoft
  module ActsAsNothing
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
    end

    module Config
      def acts_as_nothing(options = {})
        options.each do |method, default|
          default = "" if default.nil?
          self.send :define_method, method.to_sym do |pre = nil|
            value = read_attribute(method.to_sym)
            (pre.nil? ? "" : pre + " ") + (value.nil? ? default :  value)     
          end
        end
      end
    end

  end
end

ActiveRecord::Base.send(:include, TotallySoft::ActsAsNothing::Base)