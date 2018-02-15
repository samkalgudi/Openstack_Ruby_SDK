require 'chef/knife'
require 'openstack/connection'
require 'openstack'

module  Engine
  module DengineOpenstackClientBase 
  
    def self.included(includer)
      includer.class_eval do
	
	    def connection
	      @connection ||= begin
		     connection = OpenStack::Connection.create({
		            :username=>"osmosis", 
		            :api_key=>"osmosis", 
		            :auth_method=>"password", 
		            :auth_url=>"http://10.100.60.231:5000/v3", 
		            :authtenant_name=>"DEngine",
                            :service_type=>"network"})
				  
	      end
	    end
       end
    end
  end
end
		   
