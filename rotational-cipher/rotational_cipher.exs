defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    # Allow letters to be composed into nums
      |> to_charlist
      # Create a map allowing letters to be changed dependent on their shift value
      |> Enum.map(&(change_char(&1, shift)))
      # Convert back to a string once conversion is finished
      |> to_string
  end


# Change lowercase
  defp change_char(char, shift) when char in ?a..?z,
    do: change_char_with_base(char, shift, ?a)
# Change uppercase
  defp change_char(char, shift) when char in ?A..?Z,
    do: change_char_with_base(char, shift, ?Z)

# Ignore non alpha chars
  defp change_char(char, _), do: char

# Take th alpha base as reference point for char shiftcod
  defp change_char_with_base(char, shift, base),
    do: base + rem(char + shift - base, 26)
end
