require "#{File.dirname(__FILE__)}/dengine_openstack_client_base"
require 'openstack'
module Engine
   module DengineOpenstackBase
    
	include DengineOpenstackClientBase
	
	def create_net(networkname)
	  puts "#{ui.color('Network creation has been started', :cyan)}"
	  netcreation = connection.create_network(networkname)
          #@x = "#{netcreation.id}"
          print "#{netcreation.id}"
          @net_id = netcreation.id
	end
	
	def create_sub(name,cidr,ip_version,gateway_ip)

          #---------------------------test lines------------------------------

          #------------------------------------------------------------------
	  puts "#{ui.color('Subnet creation has been started', :cyan)}"
	  subcreation = connection.create_subnet(@net_id,cidr,ip_version,opts = {"name" => "sub#{name}", "gateway_ip" => gateway_ip})
	  puts "#{ui.color('network has been created', :cyan)}"
          puts "The name of subnet is :#{subcreation.id}"
          puts "The tenant_id of this subnet is :#{subcreation.tenant_id}"
        end
   end
end
