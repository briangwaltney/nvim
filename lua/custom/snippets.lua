local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

ls.add_snippets("all", {
  s(
    { trig = "clsx", "className with clsx" },
    fmt(
      [[
      className={clsx([<>])}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "comin", "index file template" },
    fmt(
      [[
      export * from "./<>";
      export { default } from "./<>";
      ]],
      { i(1), rep(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "newForm", "react-hook-form template" },
    fmt(
      [[
      import { z } from 'zod';
      import { zodResolver } from '@hookform/resolvers/zod';
      import { useForm } from 'react-hook-form';
      import InputGroup from '@/ui/InputGroup';

      const <> = () =>> {
        const formSchema = z.object({
          <>
        });

        type TFormSchema = z.infer<<typeof formSchema>>;

        const form = useForm<<TFormSchema>>({
          resolver: zodResolver(formSchema)
        });

        const errors = form.formState.errors;

        const onSubmit = (data: TFormSchema) =>> {
          console.log(data);
        };

        return (
          <<form onSubmit={form.handleSubmit(onSubmit)}>>
          <<InputGroup
            error={errors?.<>}
            label=''
            {...form.register('<>')}
          />>
          <<button>><</button>>
          <</form>>
        );
      };
      ]],
      { i(1), i(2), i(3), rep(3) },
      { delimiters = "<>" }
    )
  ),
})

-- "New Component": {
--   "prefix": "newCom",
--   "body": [
--     "import React from 'react';",
--     "import clsx from 'clsx';",
--     "",
--     "type Props = {",
--     "}",
--     "export default function $1 ({}:Props) {",
--     "return <div className={clsx([''])}>$2</div>;",
--     "};",
--     ""
--   ]
-- },
-- "hookCallbacks": {
--   "prefix": "callback",
--   "body": ["onSuccess: ()=>{$1},", "onError: (err)=>toast.error(err.message)"]
-- },
