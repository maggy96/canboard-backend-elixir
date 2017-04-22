defmodule Coherence.SessionView do
  # use Canboard.Coherence.Web, :view
  use Canboard.Web, :view
  use Canboard.Api, :view

  def render("new.json", %{ conn: conn }) do
    if conn.assigns[:logged_in] do
      render_one(conn, Coherence.SessionView, "auth.json")
    else
      render_unauthorized()
    end
  end

  def render("delete.json", _conn) do
    %{ auth: false, status: :success }
  end

  def render("auth.json", _conn) do
    %{ auth: true }
  end

  def render("locked.json", params) do
    %{ auth: false,
       message: "Account has been locked",
       remember: params[:remember],
       locked: true }
  end

  def render("confirm.json", params) do
    %{ auth: false,
       remember: params[:remember],
       email: params[:email],
       message: "Account has to be confirmed first" }
  end

  def render_unauthorized do
    %{ status: 401,
       auth: false,
       message: "unauthorized" }
  end

end
