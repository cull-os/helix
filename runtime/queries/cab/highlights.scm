(singleline_comment) @comment.line
(multiline_comment) @comment.block

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ","
  ";"
] @punctuation.delimiter

(prefix_operation
  operator: _ @operator)

(infix_operation
  operator: _ @operator)

; Not a keyword, but use the colors anyway.
((identifier) @keyword.control.import
  (#match? @keyword.control.import "^(import|provide|expect)$")
  (#is-not? local))

((identifier) @keyword.control.exception
  (#match? @keyword.control.exception "^error$")
  (#is-not? local))

((identifier) @type.builtin
  (#match? @type.builtin "^(list|attributes|string|number)$")
  (#is-not? local))

((identifier) @variable.builtin
 (#match? @variable.builtin "^(true|false|null)$")
 (#is-not? local))

(infix_operation
  operator: "|>"
  right: (identifier) @function)
(pattern_infix_operation
  operator: "|>"
  right: (identifier) @function)

(infix_operation
  left: (identifier) @function
  !operator)
(pattern_infix_operation
  left: (identifier) @function
  !operator)

(infix_operation
  left: (identifier) @function
  operator: "<|")
(pattern_infix_operation
  left: (identifier) @function
  operator: "<|")

(infix_operation
  operator: "."
  right: (identifier) @variable.other.member)

(suffix_operation
  operator: _ @operator)

(interpolation
  "\\(" @punctuation.special
  ")" @punctuation.special)

[
  (path)
  (island)
] @string.special.path

(identifier) @variable
(pattern_identifier) @variable.parameter

(string) @string

(escape) @constant.character.escape

[
  "if"
  "then"
  "is"
  "else"
] @keyword.control.conditional

(number) @constant.numeric
