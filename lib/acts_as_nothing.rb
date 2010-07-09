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
          self.send :define_method, method.to_sym do
            value = read_attribute(:length)
            value.nil? ? default : value     
          end
        end
      end
    end

  end
end

ActiveRecord::Base.send(:include, TotallySoft::ActsAsNothing::Base)