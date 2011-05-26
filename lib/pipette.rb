require 'thor'
require 'pipette/base'

class Pipette < Thor

  desc "start", "Start executing #{self.class.name} pipeline"
  method_option :steps, :type => :array
  def start
    self.valid_steps = options[:steps] if options[:steps]
    self.valid_steps.each do |step|
      invoke step
    end
    #puts self.class.name
    #puts self.class.tasks
    #options
  end
end
