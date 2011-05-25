require 'thor'

class Pipette < Thor

  desc "start", "start pipeline"
  method_option :input, :type => :string
  def start
    options
  end

end
