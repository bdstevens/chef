#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 OpsCode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Resource
    class Link < Chef::Resource
            
      def initialize(name, collection=nil, node=nil)
        super(name, collection, node)
        @resource_name = :link
        @source_file = name
        @action = :create
        @link_type = :symbolic
        @target_file = nil
        @allowed_actions.push(:create, :delete)
      end
      
      def source_file(arg=nil)
        set_or_return(
          :source_file,
          arg,
          :kind_of => String
        )
      end
      
      def target_file(arg=nil)
        set_or_return(
          :target_file,
          arg,
          :kind_of => String
        )
      end
      
      def link_type(arg=nil)
        real_arg = arg.kind_of?(String) ? arg.to_sym : arg
        set_or_return(
          :link_type,
          real_arg,
          :equal_to => [ :symbolic, :hard ]
        )
      end
      
    end
  end
end