require "kids_website"
require "rspec"
require "pry"

describe(Word) do
  before do
    Word.clear
  end
  describe('#initialize') do
    it('creates an instance of the Word class, with 2 properties') do
      term1 = Word.new('Cat')
      expect(term1.term).to(eq('Cat'))
    end
  end
  describe('#add_def') do
    it("adds a definition to the term's definitions array") do
      term1 = Word.new('Shark')
      term1.add_def("A scary animal in the ocean")
      expect(term1.definitions).to(eq(["A scary animal in the ocean"]))
    end
  end
  describe('#save') do
    it("saves the term instance to an array of all term instances") do
      term1 = Word.new('Shark')
      term1.add_def("A scary animal in the ocean")
      term1.save
      term2 = Word.new('Giraffe')
      term2.add_def("An animal with a long neck")
      term2.save
      expect(Word.all).to(eq([term1, term2]))
    end
  end
  describe('.find') do
    it("searches for, and returns a Word instance by it's id") do
      term1 = Word.new('Shark')
      term1.save
      term2 = Word.new('Giraffe')
      term2.save
      expect(Word.find(2)).to(eq(term2))
    end
  end
end

describe(Definition) do
  describe('#initialize') do
    it("will create an instance of the Definition class") do
      def1 = Definition.new('A scary animal in the ocean')
      expect(def1.definition).to(eq('A scary animal in the ocean'))
    end
  end
end
