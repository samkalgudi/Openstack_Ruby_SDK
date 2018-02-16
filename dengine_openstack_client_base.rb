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
		            :username=>"Admin", 
		            :api_key=>"*********", 
		            :auth_method=>"password", 
		            :auth_url=>"http://openstack_url/v3", 
		            :authtenant_name=>"DemoEngine",
                            :service_type=>"network"})
				  
	      end
	    end
       end
    end
  end
end
		   
