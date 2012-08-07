module CouchPotato
  module RSpec
    module RunJS

      private

      def run_js(js)

        if RUBY_PLATFORM == "java"
          require "rhino"
          context = Rhino::Context.new
        else
          require "v8"
          context = V8::Context.new
        end
        context.eval(js)

      end
    end
  end
end


require 'couch_potato/rspec/matchers/map_to_matcher'
require 'couch_potato/rspec/matchers/reduce_to_matcher'
require 'couch_potato/rspec/matchers/list_as_matcher'

module RSpec
  module Matchers
    def map(document)
      CouchPotato::RSpec::MapToProxy.new(document)
    end

    def reduce(docs, keys)
      CouchPotato::RSpec::ReduceToProxy.new(docs, keys)
    end

    def rereduce(docs, keys)
      CouchPotato::RSpec::ReduceToProxy.new(docs, keys, true)
    end

    def list(results)
      CouchPotato::RSpec::ListAsProxy.new(results)
    end
  end
end

