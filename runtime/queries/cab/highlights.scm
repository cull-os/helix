(comment) @comment

"or" @keyword.operator
"and" @keyword.operator

[
  "if" 
  "then"
  "else"
] @keyword.control.conditional

((identifier) @function.builtin
 (#match? @function.builtin "^(fix)$")
 (#is-not? local))

(string_expression) @string

[
  (path_expression)
  (island_expression)
] @string.special.path

; boolean
((identifier) @constant.builtin.boolean (#match? @constant.builtin.boolean "^(true|false)$")) @constant.builtin.boolean
; null and undefined
((identifier) @constant.builtin (#match? @constant.builtin "^(null|undefined)$")) @constant.builtin

(integer_expression) @constant.numeric.integer
(float_expression) @constant.numeric.float

(escape_sequence) @constant.character.escape
(dollar_escape) @constant.character.escape

(function_expression
  "@"? @punctuation.delimiter
  universal: (identifier) @variable.parameter
)

(formal
  name: (identifier) @variable.parameter
  "?"? @punctuation.delimiter)

(select_expression
  attrpath: (attrpath attr: (identifier)) @variable.other.member)

(interpolation
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

(apply_expression
  function: [
    (variable_expression name: (identifier) @function)
    (select_expression
      attrpath: (attrpath
        attr: (identifier) @function .))])

(unary_expression
  operator: _ @operator)

(binary_expression
  operator: _ @operator)

(variable_expression name: (identifier) @variable)

(binding
  attrpath: (attrpath attr: (identifier)) @variable.other.member)

(has_attr_expression
  expression: (_)
  "?" @operator
  attrpath: (attrpath
    attr: (identifier) @variable.other.member))

[
  ";"
  "."
  ","
  "="
  ":"
  "$"
  "|>"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket
