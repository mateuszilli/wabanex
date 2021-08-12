defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.Training

  def create(%{input: params}, _context), do: Training.Create.call(params)
end
