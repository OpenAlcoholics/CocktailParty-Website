defmodule OpencocktailBackendWeb.PageView do
  use OpencocktailBackendWeb, :view

  @spec cocktails() :: Map
  def cocktails do
    HTTPoison.start
    # use Cockapi, :get_cocktails
    import Cockapi,
           only: [
             get_cocktails: 0,
             get_ingredients: 1,
             get_accessory: 1,
             get_cocktailcategories: 0
           ]

    # get_accessory(1)
    # get_cocktailcategories()
    get_cocktails()
    |> Enum.map(
         fn cocktail ->
           Map.replace!(cocktail, :ingredients, get_ingredients(cocktail))
         end
       )
  end
end
