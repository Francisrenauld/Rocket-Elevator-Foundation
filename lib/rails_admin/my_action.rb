# require 'rails_admin/config/actions'
# require 'rails_admin/config/actions/base'

# module RailsAdmin
#   module Config
#     module Actions
#       class Patate < RailsAdmin::Config::Actions::Base
#          RailsAdmin::Config::Actions.register(self)
#          register_instance_option :my_option do
#            :default_value
#          end
#       end
#     end
#   end
# end

# # use it like this:

# # config.actions do
# #   my_patate do
# #     my_option :another_value
# #   end
# # end


# somewhere in your lib/ directory:

require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class MyAction < RailsAdmin::Config::Actions::Base
         RailsAdmin::Config::Actions.register(self)
         register_instance_option :my_option do
           :default_value
         end
      end
    end
  end
end

# use it like this:

config.actions do
  my_action do
    my_option :another_value
  end
end