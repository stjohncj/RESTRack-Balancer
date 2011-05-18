require 'rubygems'
require 'restrack-client'

module RESTRack
  class Balancer

    attr_reader :last_client, :clients

    def initialize(uri_list, format=:JSON)
      raise 'You must supply an array as the list of URI to RESTRack::Balancer#initialize.' unless uri_list.is_a? Array
      @clients = uri_list.collect do |uri|
        RESTRack::Client.new(uri, format)
      end
      @path = ''
      @uri = uri_list
      @last_client = nil
      @next_client_i = rand(@clients.length)
    end

    def method_missing(resource_name, *args)
      @clients[@next_client_i].__send__(resource_name.to_sym, *args)
      self
    end

    def get
      response = @clients[@next_client_i].get
      get_next_client
      response
    end

    def delete
      response = @clients[@next_client_i].delete
      get_next_client
      response
    end

    def post(data=nil)
      response = @clients[@next_client_i].post(data)
      get_next_client
      response
    end

    def put(data=nil)
      response = @clients[@next_client_i].put(data)
      get_next_client
      response
    end

    private
    def get_next_client
      @last_client = @uri[@next_client_i]
      if @next_client_i < @clients.length - 1
        @next_client_i += 1
      else
        @next_client_i = 0
      end
      @next_client = @uri[@next_client_i]
    end

  end
end
