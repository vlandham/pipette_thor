require 'thor'
require 'pipette/base'

class Pipette < Thor

  desc "start", "Start executing #{self.class.name} pipeline"
  method_option :steps, :type => :array
  def start
    self.valid_steps = options[:steps] if options[:steps]
    previous_output = {}
    self.valid_steps.each_with_index do |step,index|
      step_options = options.merge(previous_output)
      # TODO: why do i have to do this??
      if index == 0
        invoke step, step_options
      else
        invoke step, [], step_options
      end
      previous_output = output
    end
  end
end
