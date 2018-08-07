defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(list, fun, true, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filter(list, fun, false, [])
  end

  defp filter([top|bottom], fun, desired, new_list) do
    next_list = cond do
      fun.(top) == desired -> [top|new_list]
      true                 -> new_list
    end
    filter(bottom, fun, desired, next_list)
  end

  defp filter(_, _fun, _keep, new_list), do: Enum.reverse(new_list)
end
