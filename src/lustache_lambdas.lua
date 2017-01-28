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

return {
  strip_trailing_comma = strip_trailing_comma,
}
