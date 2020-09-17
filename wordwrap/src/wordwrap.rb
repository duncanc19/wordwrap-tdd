class WordWrap

  def wrap (string_to_wrap, line_length)
    if string_to_wrap.length <= line_length
      string_to_wrap
    else
      i = line_length
      wrapped_string = wrap_once(string_to_wrap, i)
      next_wrap = find_next_wrap(wrapped_string, line_length)

      if  next_wrap
        wrap_once(wrapped_string, next_wrap)
      else 
        wrapped_string
      end
    end
  end

  def find_next_wrap(string, line_length)
    last_wrap = string.rindex("\n") + 2
    next_wrap_position = last_wrap + line_length
    if next_wrap_position < string.length
      next_wrap_position
    else 
      false
    end
  end

  def wrap_once(string, i)
    while string[i] != " "
      i -= 1
    end 
    string[i] = "\n" 
    string
  end
end