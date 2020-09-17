require_relative '../src/wordwrap'

describe "wordwrap" do
  
  it "has two arguments" do      
    expect(WordWrap.new).to respond_to(:wrap).with(2).argument
  end

  same_length_string = {
      "hello" => "hello",
      "oryeh" => "oryeh",
      "coffee" => "coffee"
    } 
  
  same_length_string.each do |string, output|
    it "doesn't wrap if line length is same as word length" do
      expect(WordWrap.new.wrap(string, string.length)).to eq(output)
    end
  end

  ## NB: The following test is implemented three times to compare different methods.
  
  

  two_words_string = [
    ["hello world", 5, "hello\nworld"],
    ["hello hello", 5, "hello\nhello"],
    ["coffee coffee", 6, "coffee\ncoffee"]
  ] 

  two_words_string.each do |string_to_wrap, line_length, expected_output|
    it "wraps after space" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end 
  
  string_shorter_than_length = [
    ["hello", 7, "hello"],
    ["hi you", 8, "hi you"],
    ["hello world", 12, "hello world"]
  ]

  string_shorter_than_length.each do |string_to_wrap, line_length, expected_output|
    it "returns string as it's shorter than line_length" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end

  string_with_multiple_words_shorter_than_length = [
    ["Hi I'm Bob", 7, "Hi I'm\nBob"],
    ["Hello, my name is Bob", 12, "Hello, my\nname is Bob"],
    ["I am a cat and I live in Bali", 19, "I am a cat and I\nlive in Bali"]
  ]

  string_with_multiple_words_shorter_than_length.each do |string_to_wrap, line_length, expected_output|
    it "wraps string after several words" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end

  string_to_wrap_twice = [
    ["I am a big cat", 5, "I am\na big\ncat"],
    ["I need to wrap twice", 9, "I need\nto wrap\ntwice"]
  ]

  string_to_wrap_twice.each do |string_to_wrap, line_length, expected_output|
    it "wraps string twice" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end

end