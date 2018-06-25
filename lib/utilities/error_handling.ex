defmodule Utilities.ErrorHandling do
  @doc """
  Creates bang version of given function
  def get_user!(command) do
    bang(get_user(command))
  end
  """
  defmacro bangify(result) do
    quote do
      case unquote(result) do
        :ok -> nil
        {:ok, value} -> value
        {:error, error} -> raise error
      end
    end
  end
end
