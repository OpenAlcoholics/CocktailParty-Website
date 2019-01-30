defmodule OpencocktailBackendWeb.DrinkController do
  use OpencocktailBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
