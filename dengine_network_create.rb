require 'chef/knife'
require "#{File.dirname(__FILE__)}/dengine_openstack_client_base"
require "#{File.dirname(__FILE__)}/dengine_openstack_base"

module Engine
   class DengineNetworkCreate < Chef::Knife
		
    include DengineOpenstackBase
	
       banner "knife dengine network create (options)"
		
       option :name,
              short: "-n NETWORK_NAME",	
              long: "--name NETWORK_NAME",
              description: "The name of the netork that you want to create"
        
       option :gateway_ip,
             :long => '--gateway-ip GATEWAY_IP_ADDRESS',
             :description => "Enter the gateway IP (Internet-Gateway)"

       option :subnet_cidr_block,
             :long => '--subnet-cidr-block SUBNET_CIDR_BLOCK',
             :description => "The CIDR block to construct your SUBNET, ex: 192.168.0.0/24",
             :default => '192.168.0.0/24'

       option :ip_version,
             :long => '--ip-version IP_VERSION',
             :description => "Enter the version of IP address that you want. EX: 4 or 6",
             :default => 4

    def run 
       create
    end 
    
    def create()
      puts "#{ui.color('Creating Network...............', :cyan)}"
      
      #-------------------network creation----------------------
      nc = create_net(config[:name])
	  
      #-------------------subnet creation-----------------------
      sc = create_sub(config[:name],config[:subnet_cidr_block],config[:ip_version],config[:gateway_ip])
	  
    end
	
   end
end
	  
