module CouchPotato
  module Persistence
    class SimpleProperty
      attr_accessor :name
      
      def initialize(owner_clazz, name, options = {})
        self.name = name
        owner_clazz.send :attr_accessor, name
      end
      
      def build(object, json)
        object.send "#{name}=", json.stringify_keys[name.to_s]
      end
      
      def save(object)
        
      end
      
      def destroy(object)
        
      end
      
      def serialize(json, object)
        json[name] = object.send name
      end
    end
  end
end