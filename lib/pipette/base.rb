
class Pipette < Thor
  class << self
    # Provide the order of the steps to execute
    #   steps :one, :two, :three
    # ==== Parameters
    # Array[Symbol]
    #
    def steps(*step_list)
      @steps ||= []
      steps = [step_list].flatten
      # TODO:
      # allows us to use this same method as a
      # getter and a setter. Not sure that this
      # is a very good idea...
      @steps = steps unless steps.empty?
      @steps
    end
  end

  no_tasks do # hide from base Thor
    # Returns the steps for this pipeline
    #
    # ==== Returns
    # Array[Symbol]
    #
    def steps
      self.class.steps
    end
  end
end
