defmodule Bob do
  def hey(input) do
    input = 
      input 
        |> String.trim
        
    
    cond do
      asking?(input) && empty?(strip_non_words(input)) -> "Sure."
      asking?(input) && shouting?(input) -> "Calm down, I know what I'm doing!"
      empty?(input) -> "Fine. Be that way!"
      asking?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def shouting?(message) do
    no_numbers = strip_non_words(message)
    String.upcase(no_numbers) == no_numbers && contains_letters?(no_numbers)
  end

  def empty?(message) do
    String.length(message) == 0
  end
  
  def asking?(message) do
    String.last(message) == "?"
  end

  def strip_non_words(message) do
    Regex.replace(~r/\W|\d/, message, "")
  end

  def contains_letters?(message) do
    Regex.match?(~r/[\p{L}]/,message)
  end

end
