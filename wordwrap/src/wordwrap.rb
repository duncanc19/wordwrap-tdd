class WordWrap

  def wrap (string_to_wrap, line_length)
    if string_to_wrap.length <= line_length
      string_to_wrap
    else
      i = line_length
      while string_to_wrap[i] != " "
       i -= 1
      end 
      string_to_wrap[i] = "\n" 
      string_to_wrap   
    end
  end

end