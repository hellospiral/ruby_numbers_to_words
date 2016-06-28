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
    expect(11.to_word()).to(eq("eleven"))
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
end
