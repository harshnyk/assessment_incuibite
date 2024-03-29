require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number for a single number" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum of two numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "handles new lines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports different delimiters" do
    expect(calculator.add("//;\n1,2")).to eq(3)
  end

  it "throws an exception for negative numbers" do
    expect { calculator.add("-1,2,-3") }.to raise_error("Negative numbers not allowed: -1,-3")
  end
end