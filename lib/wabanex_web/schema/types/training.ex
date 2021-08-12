defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  @desc "Training representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  @desc "Training representation"
  input_object :input_training do
    field :user_id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:input_exercise)
  end
end
