local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function guard_name(_, snip)
  local filename = snip.env.TM_FILENAME or 'HEADER'
  return string.upper(filename:gsub('%.', '_'))
end

local function class_name(_, snip)
  return snip.env.TM_FILENAME:match '^(.-)%.' or 'Class'
end

return {
  s('guard', {
    t '#ifndef ',
    f(guard_name, {}),
    t { '', '#define ' },
    f(guard_name, {}),
    t { '', '', 'class ' },
    f(class_name, {}),
    t { ' {', 'public:' },
    t { '', '  ' },
    f(class_name, {}),
    t '();',
    t { '', '  ~' },
    f(class_name, {}),
    t '();',
    t { '', '  ' },
    f(class_name, {}),
    t '(const ',
    f(class_name, {}),
    t '& other);',
    t { '', '  ' },
    f(class_name, {}),
    t '& operator=(const ',
    f(class_name, {}),
    t '& other);',
    t { '', '};', '', '#endif' },
  }),
  s('ctor', {
    f(function(_, snip)
      local classname = snip.env.TM_FILENAME:match '^(.-)%.' or 'Class'
      return classname .. '::' .. classname .. '() {}'
    end, {}),
    t { '', '' },
    f(function(_, snip)
      local classname = snip.env.TM_FILENAME:match '^(.-)%.' or 'Class'
      return classname .. '::~' .. classname .. '() {}'
    end, {}),
    t { '', '' },
    f(function(_, snip)
      local classname = snip.env.TM_FILENAME:match '^(.-)%.' or 'Class'
      return classname .. '::' .. classname .. '(const ' .. classname .. '& other) {}'
    end, {}),
    t { '', '' },
    f(function(_, snip)
      local classname = snip.env.TM_FILENAME:match '^(.-)%.' or 'Class'
      return classname .. '& ' .. classname .. '::operator=(const ' .. classname .. '& other) { return *this; }'
    end, {}),
  }),
}
