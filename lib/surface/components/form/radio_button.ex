defmodule Surface.Components.Form.RadioButton do
  @moduledoc """
  Defines a radio button.

  Provides a wrapper for Phoenix.HTML.Form's `radio_button/4` function.

  All options passed via `opts` will be sent to `radio_button/4`, `value` and
  `class` can be set directly and will override anything in `opts`.


  ## Examples

  ```
  <RadioButton form="user" field="color" opts={{ autofocus: "autofocus" }}>
  ```
  """

  use Surface.Components.Form.Input

  import Phoenix.HTML.Form, only: [radio_button: 4]
  import Surface.Components.Form.Utils

  @doc "Indicates whether or not the radio button is the selected item in the group"
  property checked, :boolean

  context get form, from: Form, as: :form_context
  context get field, from: Field, as: :field_context

  def render(assigns) do
    form = get_form(assigns)
    field = get_field(assigns)
    props = get_non_nil_props(assigns, [:checked, class: get_config(:default_class)])
    event_opts = get_events_to_opts(assigns)

    ~H"""
    {{ radio_button(form, field, assigns[:value], props ++ @opts ++ event_opts) }}
    """
  end
end
