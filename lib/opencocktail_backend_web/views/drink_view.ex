defmodule OpencocktailBackendWeb.DrinkView do
  use OpencocktailBackendWeb, :view

  def cocktail(id) do
    HTTPoison.start
    # use Cockapi, :get_cocktails
    import Cockapi,
           only: [get_cocktail: 1, get_ingredient: 1, get_ingredientcategories: 0]
    cocktail = get_cocktail(id)

    cocktail =
      cocktail
      |> Map.replace!(
           :ingredients,
           Enum.map(
             cocktail.ingredients,
             fn ingredients_rank ->
               Enum.map(
                 ingredients_rank,
                 fn ingredient ->
                   api_ingredient = get_ingredient(Map.get(ingredient, "ingredientId"))
                   Map.put(api_ingredient, :share, Map.get(ingredient, "share"))
                 end
               )
             end
           )
         )

    cocktail
    # Map.replace!(cocktail, :accessories, get_accessories(cocktail)): /accessory is not implemented in the backend
  end
end
