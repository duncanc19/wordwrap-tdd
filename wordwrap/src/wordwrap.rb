class WordWrap

  def wrap (string_to_wrap, line_length)
    if string_to_wrap.length == line_length
      string_to_wrap
    else
      string_to_wrap.gsub(" ", "\n")      
    end
  end

end