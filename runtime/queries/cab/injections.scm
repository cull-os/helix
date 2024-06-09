((comment) @injection.content
 (#set! injection.language "comment"))

; mark arbitary languages with a comment
((((comment) @injection.language) .
  (string_expression (string_fragment) @injection.content))
  (#set! injection.combined))
((binding
    (comment) @injection.language
    expression: (string_expression (string_fragment) @injection.content))
  (#set! injection.combined))

; fromJSON
((apply_expression
   function: (_) @_func
   argument: (string_expression (string_fragment) @injection.content))
 (#eq? @_func "fromJSON")
 (#set! injection.language "json")
 (#set! injection.combined))

((string_expression (string_fragment) @injection.shebang @injection.content)
  (#set! injection.combined))
