defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, return valid changeset" do
      params = %{name: "Mateus", email: "mateus@email.com", password: "12345678"}

      response = User.changeset(params)

      assert %Ecto.Changeset{valid?: true, changes: ^params, errors: []} = response
    end

    test "when all params are invalid, return invalid changeset" do
      params = %{email: "mateusemail.com", password: "1234567"}

      response = User.changeset(params)

      expected_response = %{
        email: ["has invalid format"],
        name: ["can't be blank"],
        password: ["should be at least 8 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
