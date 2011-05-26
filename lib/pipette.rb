require 'thor'
require 'pipette/base'

class Pipette < Thor

  desc "start", "start pipeline"
  method_option :input, :type => :string
  def start
    puts self.class.name
    puts self.class.tasks
    options
  end
end
