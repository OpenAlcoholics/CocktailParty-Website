defmodule OpencocktailBackendWeb.DrinkController do
  use OpencocktailBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def drink(conn, params) do
    id = Map.get(params, "id")

    render(conn, "index.html", id: id)
  end

  def edit(conn, params) do
    id = Map.get(params, "id")

    render(conn, "edit.html", id: id)
  end
end
