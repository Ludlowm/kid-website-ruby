class Word

  @@word_array = []

  attr_accessor :term
  attr_accessor :definitions
  attr_accessor :id

  def initialize(term)
    self.term = term.downcase.gsub(/[^a-zA-Z ]/, '').capitalize
    self.definitions = []
    self.id = @@word_array.length.+(1)
  end

  def save
    @@word_array.push(self)
  end

  def add_def(definition)
    self.definitions.push(definition)
  end

  def Word.all
    @@word_array
  end

  def Word.clear
    @@word_array = []
  end

  def Word.find(input)
    found_term = nil
    @@word_array.each do |term|
      if term.id == input
        found_term = term
      end
    end
    found_term
  end

end

class Definition

  attr_accessor :definition

  def initialize(definition)
    self.definition = definition
  end

end
