#!/usr/bin/lua

local stache = require "lustache"
local strip_trailing_comma = require "src/lustache_lambdas".strip_trailing_comma

local context = {
  strip_comma = strip_trailing_comma,
  list = {1, 2, 3},
}

local template = [[
{
  "list_with_trailing_comma": [
{{#list}}
    {{.}},
{{/list}}
  ],
  "list_without_trailing_comma": [
{{#strip_comma}}
{{#list}}
    {{.}},
{{/list}}
{{/strip_comma}}
  ]
}
]]

print(stache:render(template, context))
