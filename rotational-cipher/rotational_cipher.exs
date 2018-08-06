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
      |> to_charlist
      |> Enum.map(&(change_char(&1, shift)))
      |> to_string
  end


  defp change_char(char, shift) when char in ?a..?z,
    do: change_char_with_base(char, shift, ?a)

  defp change_char(char, shift) when char in ?A..?Z,
    do: change_char_with_base(char, shift, ?Z)

  defp change_char(char, _), do: chars

  defp change_char_with_base(char, shift, base),
    do: base + rem(char + shift - base, 26)
end
