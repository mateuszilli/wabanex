defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias WabanexWeb.Resolvers.User, as: UserResolver
  alias WabanexWeb.Resolvers.Training, as: TrainingResolver
  alias WabanexWeb.Schema.Types

  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training
  import_types Types.Exercise

  object :root_query do
    field :user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.read/2
    end
  end

  object :root_mutation do
    field :user, type: :user do
      arg :input, non_null(:input_user)

      resolve &UserResolver.create/2
      middleware TranslateErrors
    end

    field :training, type: :training do
      arg :input, non_null(:input_training)

      resolve &TrainingResolver.create/2
      middleware TranslateErrors
    end
  end
end
