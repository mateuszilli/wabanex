defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.User.Create

  describe "user query" do
    test "when a valid id is given, return the user", %{conn: conn} do
      params = %{name: "Mateus", email: "mateus@email.com", password: "12345678"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        query {
          user(id: "#{user_id}") {
            name,
            email
          }
        }
      """

      response =
        conn
        |> post("api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "user" => %{
            "name" => "Mateus",
            "email" => "mateus@email.com"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "user mutation" do
    test "when all params are valid, create the user", %{conn: conn} do
      mutation = """
        mutation {
          user(input: {
            name: "Mateus",
            email: "mateus@email.com",
            password: "12345678"
          }) {
            name,
            email
          }
        }
      """

      response =
        conn
        |> post("api/graphql", %{query: mutation})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "user" => %{
            "name" => "Mateus",
            "email" => "mateus@email.com"
          }
        }
      }

      assert response == expected_response
    end
  end
end
