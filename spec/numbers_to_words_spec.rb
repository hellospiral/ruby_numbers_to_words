require('rspec')
require('numbers_to_words.rb')

describe("Fixnum#to_word") do
  it("returns a string for an integer") do
    expect(9.to_word()).to(eq("nine"))
  end
  it("returns a string for an integer") do
    expect(5.to_word()).to(eq("five"))
  end
  it("returns a string for a large integer") do
    expect(99.to_word()).to(eq("ninety nine"))
  end
  it("returns the right string for a teen number") do
    expect(101.to_word()).to(eq("one hundred one"))
  end
  it("returns the right string for a teen number ending in ten") do
    expect(110.to_word()).to(eq("one hundred ten"))
  end
  it("returns the right string for a hundreds number") do
    expect(135.to_word()).to(eq("one hundred thirty five"))
  end
  it("returns the right string for a hundreds number") do
    expect(205.to_word()).to(eq("two hundred five"))
  end
  it("returns the right string for a hundreds number") do
    expect(412.to_word()).to(eq("four hundred twelve"))
  end
  it("returns the right string for a thousands number") do
    expect(1000.to_word()).to(eq("one thousand"))
  end
  it("returns the right string for a thousands number") do
    expect(1120.to_word()).to(eq("one thousand one hundred twenty"))
  end
  it("returns the right string for a thousands number") do
    expect(7931.to_word()).to(eq("seven thousand nine hundred thirty one"))
  end
end
