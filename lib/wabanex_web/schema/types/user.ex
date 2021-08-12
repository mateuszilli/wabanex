defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "User representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end

  @desc "User representation"
  input_object :input_user do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :password, non_null(:string)
  end
end
