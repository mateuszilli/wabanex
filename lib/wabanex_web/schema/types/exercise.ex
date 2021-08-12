defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Exercise representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :repetition, non_null(:string)
    field :video_url, non_null(:string)
  end

  @desc "Exercise representation"
  input_object :input_exercise do
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :repetition, non_null(:string)
    field :video_url, non_null(:string)
  end
end
