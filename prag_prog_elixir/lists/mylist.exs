defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)


  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def map([], _func), do: []

  def map([head | tail], func), do: [ func.(head) | map(tail, func)]






# Entry point for the data
  def mapsum(list, func) do
    do_mapsum(list, func, 0)
  end

# If the list has been exhausted, no tail, add the head to the accumulated value and return it
  defp do_mapsum([head|[]], func, acc), do: acc + func.(head)

# Transform the function to the list and iterate until the tail is finished.
  defp do_mapsum([head|tail], func, acc) do
    do_mapsum(tail, func, func.(head) +acc)
  end


# Note the clever use of pattern matching in this scenario, where we create two variables
# that allow a comparison to be made.  {head | tail} and current.


# Pass the list to the recursive functions to check the list, initially
# set the current value to nil.
  def max(list) do
    do_max(list, 0)
  end

  # When the list is empty return the current value to the user

  defp do_max([], current), do: current

# when the current value is nil, execute the function to start the check

  defp do_max([head|tail], current) when is_nil(current) do
  do_max(tail, head)
  end

# When the head of the list passed is greater than or equal to the current value being passed
# get rid of the current value and and replace it with the head of the list for comparison.

  defp do_max([head|tail], current) when head >= current do
  do_max(tail, head)
  end

# When a smaller value is being compared to the current value, get rid of it and keep the current value
# in circulation

  defp do_max([head|tail], current) when head < current do
  do_max(tail, current)
  end



# Take the sring and convert to a tuple.
# Then further split into another tuple, where one does the magic with the char
# The other runs the process again to split the string

  def caeser([head|tail], shift) do
  # Send the shifted char to the check function to wrap if necessery.
    [[shift_char(head + shift)] | caeser(tail, shift)] 
  end

# Wrap the char if its position is greater than "z"
  defp shift_char(n) when n > ?z do
  # 
    pos_in_alph = n - ?a
    # Obtain the remainder of its current position from that of the length of the alphabet
      |> rem(26)
    # The  add back the original value to shift it and keep it within a-z.
    pos_in_alph + ?a
  end


# If there is no issue with the shift and the position of the letter in the alphabet,
# just return it.
  defp shift_char(n) do
    n
  end


end