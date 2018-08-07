defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    codons =
      rna
        |> String.codepoints
        |> Enum.chunk(3)
        |> Enum.map(&Enum.join/1)
      
      IO.inspect(codons)
      
    Enum.reduce_while codons, {:ok, []}, fn x, acc ->
    IO.inspect(acc)
    # IO.inspect(x)

      case of_codon(x) do
        {:ok, "STOP"} -> {:halt, acc}
        {:ok, value}  -> {:cont, {:ok, elem(acc, 1) ++ [value] }}
        {:error, _}   -> {:halt, {:error, "invalid RNA"}}
        
        
      end
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    cond do
    # ~w = word list /// converts given input into strings seperated by spaces

      codon in ~w(AUG)              -> {:ok, "Methionine"}
      codon in ~w(UUU UUC)          -> {:ok, "Phenylalanine"}
      codon in ~w(UUA UUG)          -> {:ok, "Leucine"}
      codon in ~w(UCU UCC UCA UCG)  -> {:ok, "Serine"}
      codon in ~w(UAU UAC)          -> {:ok, "Tyrosine"}
      codon in ~w(UGU UGC)          -> {:ok, "Cysteine"}
      codon in ~w(UGG)              -> {:ok, "Tryptophan"}
      codon in ~w(UAA UAG UGA)      -> {:ok, "STOP"}
      true                          -> {:error, "invalid codon"}
    end
  end
end
