#!/usr/bin/lua

local stache = require "lustache"
local strip_trailing_comma = require "src/lustache_lambdas".strip_trailing_comma
local indent_by_two_spaces = require "src/lustache_lambdas".indent_by_two_spaces

local context = {
  strip_comma = strip_trailing_comma,
  indent = indent_by_two_spaces,
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
---
{{#indent}}{{#indent}}Text1
Text2{{/indent}}{{/indent}}
Text3
---
{{#indent}}{{#indent}}
Text1
Text2
{{/indent}}{{/indent}}
Text3
---
]]

print(stache:render(template, context))
