local sub = require "string".sub
local match = require "string".match

local function strip_trailing_comma(text, render)
  local text = render(text)

  local trailing_space = match(text, "%s*$")
  local last_character = #text - #trailing_space

  if sub(text, last_character, last_character) == "," then
    return sub(text, 1, last_character - 1) .. trailing_space
  end

  return text
end

local function json_string_escape(text, render)
  local text = render(text)

  return text:gsub("\\", "\\\\"):gsub("\t", "\\t"):gsub("\n", "\\n"):gsub("\"", "\\\"")
end

return {
  strip_trailing_comma = strip_trailing_comma,
  json_string_escape = json_string_escape,
}
