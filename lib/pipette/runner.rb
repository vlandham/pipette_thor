require 'pipette'

class Pipette::Runner < Thor
  map "-v" => :version, "-h" => :help

  def help
    say "Options"
  end

  desc "version", "Show Pipette version"
  def version
    require 'pipette/version'
    say "Pipette #{Pipette::VERSION}"
  end
end
