require 'rubygems'
require 'restrack-client'

module RESTRack
  class Balancer

    def initialize(uri_list, format=:JSON)
      @clients = uri_list.collect do |uri|
        RESTRack::Client.new(uri, format)
      end
      @path = ''
      @next_client = rand(@clients.length)
    end

    def method_missing(resource_name, *args)
      @clients[@next_client].resource_name(*args)
      self
    end

    def get
      @clients[@next_client].get
      @next_client = next_client
    end

    def delete
      @clients[@next_client].delete
      @next_client = next_client
    end

    def post(data=nil)
      @clients[@next_client].post(data)
      @next_client = next_client
    end

    def put(data=nil)
      @clients[@next_client].put(data)
      @next_client = next_client
    end

    private
    def next_client
      if @next_client < @clients.length - 1
        @next_client += 1
      else
        @next_client = 0
      end
    end

  end
end
