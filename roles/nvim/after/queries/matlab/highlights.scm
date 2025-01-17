; highlights.scm

function_keyword: (_) @keyword
(function_definition end: (end) @keyword)
structure_keyword: (_) @keyword 

"true" @constant.builtin
"false" @constant.builtin

return_variable: (return_value) @type.builtin
function_name: (identifier) @constant.builtin
