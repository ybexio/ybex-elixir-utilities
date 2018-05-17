defmodule Utilities.Map do
  @moduledoc """
  Documentation for Utilities.
  """

  @doc """
  Returns the map with the keys in kmap renamed to the vals in kmap

  ## Examples

      iex> Utilities.Map.rename_keys(%{a: 1, b: 2}, %{a: :c, b: :d})
      %{c: 1, d: 2}

  """
  def rename_keys(map, kmap) do
    Enum.reduce(kmap, Map.drop(map, Map.keys(kmap)), fn {old_key, new_key}, m ->
      if Map.has_key?(map, old_key) do
        Map.put(m, new_key, Map.get(map, old_key))
      else
        m
      end
    end)
  end

  @doc """
  Returns the map with the string keys converted to atom keys

  ## Examples

      iex> Utilities.Map.to_atom_keys(%{"a" => "a", "b" => "b", :c => "c"})
      %{a: "a", b: "b", c: "c"}

  """
  def to_atom_keys(map) do
    for {key, val} <- map, into: %{} do
      new_key =
        if String.valid?(key) do
          String.to_atom(key)
        else
          key
        end

      {new_key, val}
    end
  end

  @doc """
  Returns the map with the atom keys converted to string keys

  ## Examples

      iex> Utilities.Map.to_string_keys(%{a: "a", b: "b", c: "c"})
      %{"a" => "a", "b" => "b", "c" => "c"}

  """
  def to_string_keys(map) do
    for {key, val} <- map, into: %{} do
      new_key =
        if is_atom(key) do
          Atom.to_string(key)
        else
          key
        end

      {new_key, val}
    end
  end

  @doc """
  Returns true if all keys exist in map

  ## Examples

      iex> Utilities.Map.has_keys?(%{a: "a", b: "b"}, [:a, :b])
      true

      iex> Utilities.Map.has_keys?(%{a: "a", b: "b"}, [:a, :b, :c])
      false

  """
  def has_keys?(map, keys) do
    Enum.all?(keys, &Map.has_key?(map, &1))
  end
end
