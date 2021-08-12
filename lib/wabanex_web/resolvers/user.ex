defmodule WabanexWeb.Resolvers.User do
  alias Wabanex.User

  def read(%{id: user_id}, _context), do: User.Read.call(user_id)
  def create(%{input: params}, _context), do: User.Create.call(params)
end
