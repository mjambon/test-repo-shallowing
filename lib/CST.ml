(* Generated by ocaml-tree-sitter. *)
(*
   javascript grammar

   entrypoint: program
*)

open! Sexplib.Conv
open Tree_sitter_run

type imm_tok_pat_3f3cd4d = Token.t (* pattern "[^\"\\\\\\n]+|\\\\?\\r?\\n" *)
[@@deriving sexp_of]

type identifier = Token.t
[@@deriving sexp_of]

type jsx_identifier =
  Token.t (* pattern [a-zA-Z_$][a-zA-Z\d_$]*-[a-zA-Z\d_$\-]* *)
[@@deriving sexp_of]

type regex_flags = Token.t (* pattern [a-z]+ *)
[@@deriving sexp_of]

type hash_bang_line = Token.t (* pattern #!.* *)
[@@deriving sexp_of]

type import = Token.t
[@@deriving sexp_of]

type number = Token.t
[@@deriving sexp_of]

type automatic_semicolon = Token.t
[@@deriving sexp_of]

type regex_pattern = Token.t
[@@deriving sexp_of]

type reserved_identifier = [
    `Get of Token.t (* "get" *)
  | `Set of Token.t (* "set" *)
  | `Async of Token.t (* "async" *)
  | `Static of Token.t (* "static" *)
]
[@@deriving sexp_of]

type anon_choice_PLUSPLUS_e498e28 = [
    `PLUSPLUS of Token.t (* "++" *)
  | `DASHDASH of Token.t (* "--" *)
]
[@@deriving sexp_of]

type jsx_text = Token.t (* pattern [^{}<>]+ *)
[@@deriving sexp_of]

type escape_sequence = Token.t
[@@deriving sexp_of]

type template_chars = Token.t
[@@deriving sexp_of]

type imm_tok_pat_a3af5dd = Token.t (* pattern "[^'\\\\\\n]+|\\\\?\\r?\\n" *)
[@@deriving sexp_of]

type import_export_specifier = (
    identifier (*tok*)
  * (Token.t (* "as" *) * identifier (*tok*)) option
)
[@@deriving sexp_of]

type anon_choice_id_b8f8ced = [
    `Id of identifier (*tok*)
  | `Deco_member_exp of decorator_member_expression
]

and decorator_member_expression = (
    anon_choice_id_b8f8ced * Token.t (* "." *) * identifier (*tok*)
)
[@@deriving sexp_of]

type namespace_import = (
    Token.t (* "*" *) * Token.t (* "as" *) * identifier (*tok*)
)
[@@deriving sexp_of]

type nested_identifier = (
    [ `Id of identifier (*tok*) | `Nested_id of nested_identifier ]
  * Token.t (* "." *)
  * identifier (*tok*)
)
[@@deriving sexp_of]

type jsx_identifier_ = [
    `Jsx_id of jsx_identifier (*tok*)
  | `Id of identifier (*tok*)
]
[@@deriving sexp_of]

type semicolon = [
    `Auto_semi of automatic_semicolon (*tok*)
  | `SEMI of Token.t (* ";" *)
]
[@@deriving sexp_of]

type anon_choice_rese_id_9a83200 = [
    `Choice_get of reserved_identifier
  | `Id of identifier (*tok*)
]
[@@deriving sexp_of]

type anon_choice_id_0e3c97f = [
    `Id of identifier (*tok*)
  | `Choice_get of reserved_identifier
]
[@@deriving sexp_of]

type string_ = [
    `DQUOT_rep_choice_imm_tok_pat_3f3cd4d_DQUOT of (
        Token.t (* "\"" *)
      * [
            `Imm_tok_pat_3f3cd4d of imm_tok_pat_3f3cd4d (*tok*)
          | `Esc_seq of escape_sequence (*tok*)
        ]
          list (* zero or more *)
      * Token.t (* "\"" *)
    )
  | `SQUOT_rep_choice_imm_tok_pat_a3af5dd_SQUOT of (
        Token.t (* "'" *)
      * [
            `Imm_tok_pat_a3af5dd of imm_tok_pat_a3af5dd (*tok*)
          | `Esc_seq of escape_sequence (*tok*)
        ]
          list (* zero or more *)
      * Token.t (* "'" *)
    )
]
[@@deriving sexp_of]

type anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d = (
    import_export_specifier
  * (Token.t (* "," *) * import_export_specifier) list (* zero or more *)
)
[@@deriving sexp_of]

type jsx_namespace_name = (
    jsx_identifier_ * Token.t (* ":" *) * jsx_identifier_
)
[@@deriving sexp_of]

type from_clause = (Token.t (* "from" *) * string_)
[@@deriving sexp_of]

type named_imports = (
    Token.t (* "{" *)
  * anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d option
  * Token.t (* "," *) option
  * Token.t (* "}" *)
)
[@@deriving sexp_of]

type export_clause = (
    Token.t (* "{" *)
  * anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d option
  * Token.t (* "," *) option
  * Token.t (* "}" *)
)
[@@deriving sexp_of]

type jsx_attribute_name = [
    `Choice_jsx_id of jsx_identifier_
  | `Jsx_name_name of jsx_namespace_name
]
[@@deriving sexp_of]

type jsx_element_name = [
    `Choice_jsx_id of jsx_identifier_
  | `Nested_id of nested_identifier
  | `Jsx_name_name of jsx_namespace_name
]
[@@deriving sexp_of]

type import_clause = [
    `Name_import of namespace_import
  | `Named_imports of named_imports
  | `Id_opt_COMMA_choice_name_import of (
        identifier (*tok*)
      * (
            Token.t (* "," *)
          * [
                `Name_import of namespace_import
              | `Named_imports of named_imports
            ]
        )
          option
    )
]
[@@deriving sexp_of]

type jsx_closing_element = (
    Token.t (* "<" *) * Token.t (* "/" *) * jsx_element_name
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type anon_choice_exp_6ded967 = [
    `Exp of expression
  | `Choice_this of primary_expression
]

and anon_choice_exp_9818c1b = [
    `Exp of expression
  | `Spread_elem of spread_element
]

and anon_choice_id_21dd422 = [
    `Id of identifier (*tok*)
  | `Choice_obj of destructuring_pattern
]

and anon_choice_pair_bc93fa1 = [
    `Pair of (property_name * Token.t (* ":" *) * expression)
  | `Spread_elem of spread_element
  | `Meth_defi of method_definition
  | `Assign_pat of assignment_pattern
  | `Choice_id of anon_choice_id_0e3c97f
]

and anon_choice_paren_exp_8725fb4 = [
    `Paren_exp of parenthesized_expression
  | `Choice_member_exp of lhs_expression
]

and anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4 =
  (anon_choice_exp_9818c1b option * anon_rep_COMMA_opt_choice_exp_ca698a5)
    option

and anon_rep_COMMA_opt_choice_exp_ca698a5 =
  (Token.t (* "," *) * anon_choice_exp_9818c1b option)
    list (* zero or more *)

and arguments = (
    Token.t (* "(" *)
  * anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4
  * Token.t (* ")" *)
)

and array_ = (
    Token.t (* "[" *)
  * anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4
  * Token.t (* "]" *)
)

and assignment_pattern = (
    [
        `Choice_choice_get of anon_choice_rese_id_9a83200
      | `Choice_obj of destructuring_pattern
    ]
  * Token.t (* "=" *)
  * expression
)

and binary_expression = [
    `Exp_AMPAMP_exp of (expression * Token.t (* "&&" *) * expression)
  | `Exp_BARBAR_exp of (expression * Token.t (* "||" *) * expression)
  | `Exp_GTGT_exp of (expression * Token.t (* ">>" *) * expression)
  | `Exp_GTGTGT_exp of (expression * Token.t (* ">>>" *) * expression)
  | `Exp_LTLT_exp of (expression * Token.t (* "<<" *) * expression)
  | `Exp_AMP_exp of (expression * Token.t (* "&" *) * expression)
  | `Exp_HAT_exp of (expression * Token.t (* "^" *) * expression)
  | `Exp_BAR_exp of (expression * Token.t (* "|" *) * expression)
  | `Exp_PLUS_exp of (expression * Token.t (* "+" *) * expression)
  | `Exp_DASH_exp of (expression * Token.t (* "-" *) * expression)
  | `Exp_STAR_exp of (expression * Token.t (* "*" *) * expression)
  | `Exp_SLASH_exp of (expression * Token.t (* "/" *) * expression)
  | `Exp_PERC_exp of (expression * Token.t (* "%" *) * expression)
  | `Exp_STARSTAR_exp of (expression * Token.t (* "**" *) * expression)
  | `Exp_LT_exp of (expression * Token.t (* "<" *) * expression)
  | `Exp_LTEQ_exp of (expression * Token.t (* "<=" *) * expression)
  | `Exp_EQEQ_exp of (expression * Token.t (* "==" *) * expression)
  | `Exp_EQEQEQ_exp of (expression * Token.t (* "===" *) * expression)
  | `Exp_BANGEQ_exp of (expression * Token.t (* "!=" *) * expression)
  | `Exp_BANGEQEQ_exp of (expression * Token.t (* "!==" *) * expression)
  | `Exp_GTEQ_exp of (expression * Token.t (* ">=" *) * expression)
  | `Exp_GT_exp of (expression * Token.t (* ">" *) * expression)
  | `Exp_QMARKQMARK_exp of (expression * Token.t (* "??" *) * expression)
  | `Exp_inst_exp of (expression * Token.t (* "instanceof" *) * expression)
  | `Exp_in_exp of (expression * Token.t (* "in" *) * expression)
]

and call_expression = [
    `Exp_choice_args of (
        expression
      * [ `Args of arguments | `Temp_str of template_string ]
    )
  | `Choice_this_QMARKDOT_args of (
        primary_expression * Token.t (* "?." *) * arguments
    )
]

and call_signature = formal_parameters

and catch_clause = (
    Token.t (* "catch" *)
  * (Token.t (* "(" *) * anon_choice_id_21dd422 * Token.t (* ")" *)) option
  * statement_block
)

and class_body = (
    Token.t (* "{" *)
  * [
        `Meth_defi_opt_SEMI of (method_definition * Token.t (* ";" *) option)
      | `Public_field_defi_choice_auto_semi of (
            public_field_definition * semicolon
        )
    ]
      list (* zero or more *)
  * Token.t (* "}" *)
)

and class_heritage = (Token.t (* "extends" *) * expression)

and declaration = [
    `Func_decl of (
        Token.t (* "async" *) option
      * Token.t (* "function" *)
      * identifier (*tok*)
      * formal_parameters
      * statement_block
      * automatic_semicolon (*tok*) option
    )
  | `Gene_func_decl of (
        Token.t (* "async" *) option
      * Token.t (* "function" *)
      * Token.t (* "*" *)
      * identifier (*tok*)
      * formal_parameters
      * statement_block
      * automatic_semicolon (*tok*) option
    )
  | `Class_decl of (
        decorator list (* zero or more *)
      * Token.t (* "class" *)
      * identifier (*tok*)
      * class_heritage option
      * class_body
      * automatic_semicolon (*tok*) option
    )
  | `Lexi_decl of lexical_declaration
  | `Var_decl of variable_declaration
]

and decorator = (
    Token.t (* "@" *)
  * [
        `Id of identifier (*tok*)
      | `Deco_member_exp of decorator_member_expression
      | `Deco_call_exp of decorator_call_expression
    ]
)

and decorator_call_expression = (anon_choice_id_b8f8ced * arguments)

and destructuring_pattern = [ `Obj of object_ | `Array of array_ ]

and export_statement = [
    `Export_choice_STAR_from_clause_choice_auto_semi of (
        Token.t (* "export" *)
      * [
            `STAR_from_clause_choice_auto_semi of (
                Token.t (* "*" *) * from_clause * semicolon
            )
          | `Export_clause_from_clause_choice_auto_semi of (
                export_clause * from_clause * semicolon
            )
          | `Export_clause_choice_auto_semi of (export_clause * semicolon)
        ]
    )
  | `Rep_deco_export_choice_decl of (
        decorator list (* zero or more *)
      * Token.t (* "export" *)
      * [
            `Decl of declaration
          | `Defa_exp_choice_auto_semi of (
                Token.t (* "default" *) * expression * semicolon
            )
        ]
    )
]

and expression = [
    `Choice_this of primary_expression
  | `Choice_jsx_elem of jsx_element_
  | `Jsx_frag of jsx_fragment
  | `Assign_exp of (
        anon_choice_paren_exp_8725fb4 * Token.t (* "=" *) * expression
    )
  | `Augm_assign_exp of (
        [
            `Member_exp of member_expression
          | `Subs_exp of subscript_expression
          | `Choice_get of reserved_identifier
          | `Id of identifier (*tok*)
          | `Paren_exp of parenthesized_expression
        ]
      * [
            `PLUSEQ of Token.t (* "+=" *)
          | `DASHEQ of Token.t (* "-=" *)
          | `STAREQ of Token.t (* "*=" *)
          | `SLASHEQ of Token.t (* "/=" *)
          | `PERCEQ of Token.t (* "%=" *)
          | `HATEQ of Token.t (* "^=" *)
          | `AMPEQ of Token.t (* "&=" *)
          | `BAREQ of Token.t (* "|=" *)
          | `GTGTEQ of Token.t (* ">>=" *)
          | `GTGTGTEQ of Token.t (* ">>>=" *)
          | `LTLTEQ of Token.t (* "<<=" *)
          | `STARSTAREQ of Token.t (* "**=" *)
          | `AMPAMPEQ of Token.t (* "&&=" *)
          | `BARBAREQ of Token.t (* "||=" *)
          | `QMARKQMARKEQ of Token.t (* "??=" *)
        ]
      * expression
    )
  | `Await_exp of (Token.t (* "await" *) * expression)
  | `Un_exp of unary_expression
  | `Bin_exp of binary_expression
  | `Tern_exp of (
        expression * Token.t (* "?" *) * expression * Token.t (* ":" *)
      * expression
    )
  | `Update_exp of update_expression
  | `New_exp of (Token.t (* "new" *) * primary_expression * arguments option)
  | `Yield_exp of (
        Token.t (* "yield" *)
      * [
            `STAR_exp of (Token.t (* "*" *) * expression)
          | `Opt_exp of expression option
        ]
    )
]

and expression_statement = (expressions * semicolon)

and expressions = [ `Exp of expression | `Seq_exp of sequence_expression ]

and finally_clause = (Token.t (* "finally" *) * statement_block)

and for_header = (
    Token.t (* "(" *)
  * [
        `Var of Token.t (* "var" *)
      | `Let of Token.t (* "let" *)
      | `Const of Token.t (* "const" *)
    ]
      option
  * anon_choice_paren_exp_8725fb4
  * [ `In of Token.t (* "in" *) | `Of of Token.t (* "of" *) ]
  * expressions
  * Token.t (* ")" *)
)

and formal_parameter = [
    `Id of identifier (*tok*)
  | `Choice_get of reserved_identifier
  | `Choice_obj of destructuring_pattern
  | `Assign_pat of assignment_pattern
  | `Rest_param of (Token.t (* "..." *) * anon_choice_id_21dd422)
]

and formal_parameters = (
    Token.t (* "(" *)
  * (
        formal_parameter
      * (Token.t (* "," *) * formal_parameter) list (* zero or more *)
      * Token.t (* "," *) option
    )
      option
  * Token.t (* ")" *)
)

and initializer_ = (Token.t (* "=" *) * expression)

and jsx_attribute_ = [
    `Jsx_attr of (
        jsx_attribute_name
      * (Token.t (* "=" *) * jsx_attribute_value) option
    )
  | `Jsx_exp of jsx_expression
]

and jsx_attribute_value = [
    `Str of string_
  | `Jsx_exp of jsx_expression
  | `Choice_jsx_elem of jsx_element_
  | `Jsx_frag of jsx_fragment
]

and jsx_child = [
    `Jsx_text of jsx_text (*tok*)
  | `Choice_jsx_elem of jsx_element_
  | `Jsx_frag of jsx_fragment
  | `Jsx_exp of jsx_expression
]

and jsx_element_ = [
    `Jsx_elem of (
        jsx_opening_element
      * jsx_child list (* zero or more *)
      * jsx_closing_element
    )
  | `Jsx_self_clos_elem of (
        Token.t (* "<" *)
      * jsx_element_name
      * jsx_attribute_ list (* zero or more *)
      * Token.t (* "/" *)
      * Token.t (* ">" *)
    )
]

and jsx_expression = (
    Token.t (* "{" *)
  * [
        `Exp of expression
      | `Seq_exp of sequence_expression
      | `Spread_elem of spread_element
    ]
      option
  * Token.t (* "}" *)
)

and jsx_fragment = (
    Token.t (* "<" *)
  * Token.t (* ">" *)
  * jsx_child list (* zero or more *)
  * Token.t (* "<" *)
  * Token.t (* "/" *)
  * Token.t (* ">" *)
)

and jsx_opening_element = (
    Token.t (* "<" *)
  * jsx_element_name
  * jsx_attribute_ list (* zero or more *)
  * Token.t (* ">" *)
)

and lexical_declaration = (
    [ `Let of Token.t (* "let" *) | `Const of Token.t (* "const" *) ]
  * variable_declarator
  * (Token.t (* "," *) * variable_declarator) list (* zero or more *)
  * semicolon
)

and lhs_expression = [
    `Member_exp of member_expression
  | `Subs_exp of subscript_expression
  | `Id of identifier (*tok*)
  | `Choice_get of reserved_identifier
  | `Choice_obj of destructuring_pattern
]

and member_expression = (
    anon_choice_exp_6ded967
  * [ `DOT of Token.t (* "." *) | `QMARKDOT of Token.t (* "?." *) ]
  * identifier (*tok*)
)

and method_definition = (
    decorator list (* zero or more *)
  * Token.t (* "static" *) option
  * Token.t (* "async" *) option
  * [
        `Get of Token.t (* "get" *)
      | `Set of Token.t (* "set" *)
      | `STAR of Token.t (* "*" *)
    ]
      option
  * property_name
  * formal_parameters
  * statement_block
)

and object_ = (
    Token.t (* "{" *)
  * (
        anon_choice_pair_bc93fa1 option
      * (Token.t (* "," *) * anon_choice_pair_bc93fa1 option)
          list (* zero or more *)
    )
      option
  * Token.t (* "}" *)
)

and parenthesized_expression = (
    Token.t (* "(" *) * expressions * Token.t (* ")" *)
)

and primary_expression = [
    `This of Token.t (* "this" *)
  | `Super of Token.t (* "super" *)
  | `Id of identifier (*tok*)
  | `Choice_get of reserved_identifier
  | `Num of number (*tok*)
  | `Str of string_
  | `Temp_str of template_string
  | `Regex of (
        Token.t (* "/" *)
      * regex_pattern (*tok*)
      * Token.t (* "/" *)
      * regex_flags (*tok*) option
    )
  | `True of Token.t (* "true" *)
  | `False of Token.t (* "false" *)
  | `Null of Token.t (* "null" *)
  | `Unde of Token.t (* "undefined" *)
  | `Import of import (*tok*)
  | `Obj of object_
  | `Array of array_
  | `Func of (
        Token.t (* "async" *) option
      * Token.t (* "function" *)
      * identifier (*tok*) option
      * formal_parameters
      * statement_block
    )
  | `Arrow_func of (
        Token.t (* "async" *) option
      * [
            `Choice_choice_get of anon_choice_rese_id_9a83200
          | `Formal_params of call_signature
        ]
      * Token.t (* "=>" *)
      * [ `Exp of expression | `Stmt_blk of statement_block ]
    )
  | `Gene_func of (
        Token.t (* "async" *) option
      * Token.t (* "function" *)
      * Token.t (* "*" *)
      * identifier (*tok*) option
      * formal_parameters
      * statement_block
    )
  | `Class of (
        decorator list (* zero or more *)
      * Token.t (* "class" *)
      * identifier (*tok*) option
      * class_heritage option
      * class_body
    )
  | `Paren_exp of parenthesized_expression
  | `Subs_exp of subscript_expression
  | `Member_exp of member_expression
  | `Meta_prop of (
        Token.t (* "new" *) * Token.t (* "." *) * Token.t (* "target" *)
    )
  | `Call_exp of call_expression
]

and property_name = [
    `Choice_id of anon_choice_id_0e3c97f
  | `Str of string_
  | `Num of number (*tok*)
  | `Comp_prop_name of (Token.t (* "[" *) * expression * Token.t (* "]" *))
]

and public_field_definition = (
    Token.t (* "static" *) option
  * property_name
  * initializer_ option
)

and sequence_expression = (
    expression
  * Token.t (* "," *)
  * [ `Seq_exp of sequence_expression | `Exp of expression ]
)

and spread_element = (Token.t (* "..." *) * expression)

and statement = [
    `Export_stmt of export_statement
  | `Import_stmt of (
        Token.t (* "import" *)
      * [
            `Import_clause_from_clause of (import_clause * from_clause)
          | `Str of string_
        ]
      * semicolon
    )
  | `Debu_stmt of (Token.t (* "debugger" *) * semicolon)
  | `Exp_stmt of expression_statement
  | `Decl of declaration
  | `Stmt_blk of statement_block
  | `If_stmt of (
        Token.t (* "if" *)
      * parenthesized_expression
      * statement
      * (Token.t (* "else" *) * statement) option
    )
  | `Switch_stmt of (
        Token.t (* "switch" *) * parenthesized_expression * switch_body
    )
  | `For_stmt of (
        Token.t (* "for" *)
      * Token.t (* "(" *)
      * [
            `Lexi_decl of lexical_declaration
          | `Var_decl of variable_declaration
          | `Exp_stmt of expression_statement
          | `Empty_stmt of Token.t (* ";" *)
        ]
      * [
            `Exp_stmt of expression_statement
          | `Empty_stmt of Token.t (* ";" *)
        ]
      * expressions option
      * Token.t (* ")" *)
      * statement
    )
  | `For_in_stmt of (
        Token.t (* "for" *)
      * Token.t (* "await" *) option
      * for_header
      * statement
    )
  | `While_stmt of (
        Token.t (* "while" *) * parenthesized_expression * statement
    )
  | `Do_stmt of (
        Token.t (* "do" *) * statement * Token.t (* "while" *)
      * parenthesized_expression * semicolon
    )
  | `Try_stmt of (
        Token.t (* "try" *)
      * statement_block
      * catch_clause option
      * finally_clause option
    )
  | `With_stmt of (
        Token.t (* "with" *) * parenthesized_expression * statement
    )
  | `Brk_stmt of (
        Token.t (* "break" *)
      * identifier (*tok*) option
      * semicolon
    )
  | `Cont_stmt of (
        Token.t (* "continue" *)
      * identifier (*tok*) option
      * semicolon
    )
  | `Ret_stmt of (Token.t (* "return" *) * expressions option * semicolon)
  | `Throw_stmt of (Token.t (* "throw" *) * expressions * semicolon)
  | `Empty_stmt of Token.t (* ";" *)
  | `Labe_stmt of (anon_choice_id_0e3c97f * Token.t (* ":" *) * statement)
]

and statement_block = (
    Token.t (* "{" *)
  * statement list (* zero or more *)
  * Token.t (* "}" *)
  * automatic_semicolon (*tok*) option
)

and subscript_expression = (
    anon_choice_exp_6ded967
  * Token.t (* "?." *) option
  * Token.t (* "[" *)
  * expressions
  * Token.t (* "]" *)
)

and switch_body = (
    Token.t (* "{" *)
  * [ `Switch_case of switch_case | `Switch_defa of switch_default ]
      list (* zero or more *)
  * Token.t (* "}" *)
)

and switch_case = (
    Token.t (* "case" *)
  * expressions
  * Token.t (* ":" *)
  * statement list (* zero or more *)
)

and switch_default = (
    Token.t (* "default" *)
  * Token.t (* ":" *)
  * statement list (* zero or more *)
)

and template_string = (
    Token.t (* "`" *)
  * [
        `Temp_chars of template_chars (*tok*)
      | `Esc_seq of escape_sequence (*tok*)
      | `Temp_subs of template_substitution
    ]
      list (* zero or more *)
  * Token.t (* "`" *)
)

and template_substitution = (
    Token.t (* "${" *) * expressions * Token.t (* "}" *)
)

and unary_expression = [
    `BANG_exp of (Token.t (* "!" *) * expression)
  | `TILDE_exp of (Token.t (* "~" *) * expression)
  | `DASH_exp of (Token.t (* "-" *) * expression)
  | `PLUS_exp of (Token.t (* "+" *) * expression)
  | `Typeof_exp of (Token.t (* "typeof" *) * expression)
  | `Void_exp of (Token.t (* "void" *) * expression)
  | `Delete_exp of (Token.t (* "delete" *) * expression)
]

and update_expression = [
    `Exp_choice_PLUSPLUS of (expression * anon_choice_PLUSPLUS_e498e28)
  | `Choice_PLUSPLUS_exp of (anon_choice_PLUSPLUS_e498e28 * expression)
]

and variable_declaration = (
    Token.t (* "var" *)
  * variable_declarator
  * (Token.t (* "," *) * variable_declarator) list (* zero or more *)
  * semicolon
)

and variable_declarator = (anon_choice_id_21dd422 * initializer_ option)
[@@deriving sexp_of]

type program = (
    hash_bang_line (*tok*) option
  * statement list (* zero or more *)
)
[@@deriving sexp_of]

type super (* inlined *) = Token.t (* "super" *)
[@@deriving sexp_of]

type imm_tok_SLASH (* inlined *) = Token.t (* "/" *)
[@@deriving sexp_of]

type meta_property (* inlined *) = (
    Token.t (* "new" *) * Token.t (* "." *) * Token.t (* "target" *)
)
[@@deriving sexp_of]

type this (* inlined *) = Token.t (* "this" *)
[@@deriving sexp_of]

type undefined (* inlined *) = Token.t (* "undefined" *)
[@@deriving sexp_of]

type false_ (* inlined *) = Token.t (* "false" *)
[@@deriving sexp_of]

type null (* inlined *) = Token.t (* "null" *)
[@@deriving sexp_of]

type empty_statement (* inlined *) = Token.t (* ";" *)
[@@deriving sexp_of]

type comment (* inlined *) = Token.t
[@@deriving sexp_of]

type true_ (* inlined *) = Token.t (* "true" *)
[@@deriving sexp_of]

type regex (* inlined *) = (
    Token.t (* "/" *)
  * regex_pattern (*tok*)
  * Token.t (* "/" *)
  * regex_flags (*tok*) option
)
[@@deriving sexp_of]

type debugger_statement (* inlined *) = (
    Token.t (* "debugger" *) * semicolon
)
[@@deriving sexp_of]

type continue_statement (* inlined *) = (
    Token.t (* "continue" *)
  * identifier (*tok*) option
  * semicolon
)
[@@deriving sexp_of]

type break_statement (* inlined *) = (
    Token.t (* "break" *)
  * identifier (*tok*) option
  * semicolon
)
[@@deriving sexp_of]

type import_statement (* inlined *) = (
    Token.t (* "import" *)
  * [
        `Import_clause_from_clause of (import_clause * from_clause)
      | `Str of string_
    ]
  * semicolon
)
[@@deriving sexp_of]

type arrow_function (* inlined *) = (
    Token.t (* "async" *) option
  * [
        `Choice_choice_get of anon_choice_rese_id_9a83200
      | `Formal_params of call_signature
    ]
  * Token.t (* "=>" *)
  * [ `Exp of expression | `Stmt_blk of statement_block ]
)
[@@deriving sexp_of]

type assignment_expression (* inlined *) = (
    anon_choice_paren_exp_8725fb4 * Token.t (* "=" *) * expression
)
[@@deriving sexp_of]

type augmented_assignment_expression (* inlined *) = (
    [
        `Member_exp of member_expression
      | `Subs_exp of subscript_expression
      | `Choice_get of reserved_identifier
      | `Id of identifier (*tok*)
      | `Paren_exp of parenthesized_expression
    ]
  * [
        `PLUSEQ of Token.t (* "+=" *)
      | `DASHEQ of Token.t (* "-=" *)
      | `STAREQ of Token.t (* "*=" *)
      | `SLASHEQ of Token.t (* "/=" *)
      | `PERCEQ of Token.t (* "%=" *)
      | `HATEQ of Token.t (* "^=" *)
      | `AMPEQ of Token.t (* "&=" *)
      | `BAREQ of Token.t (* "|=" *)
      | `GTGTEQ of Token.t (* ">>=" *)
      | `GTGTGTEQ of Token.t (* ">>>=" *)
      | `LTLTEQ of Token.t (* "<<=" *)
      | `STARSTAREQ of Token.t (* "**=" *)
      | `AMPAMPEQ of Token.t (* "&&=" *)
      | `BARBAREQ of Token.t (* "||=" *)
      | `QMARKQMARKEQ of Token.t (* "??=" *)
    ]
  * expression
)
[@@deriving sexp_of]

type await_expression (* inlined *) = (Token.t (* "await" *) * expression)
[@@deriving sexp_of]

type class_ (* inlined *) = (
    decorator list (* zero or more *)
  * Token.t (* "class" *)
  * identifier (*tok*) option
  * class_heritage option
  * class_body
)
[@@deriving sexp_of]

type class_declaration (* inlined *) = (
    decorator list (* zero or more *)
  * Token.t (* "class" *)
  * identifier (*tok*)
  * class_heritage option
  * class_body
  * automatic_semicolon (*tok*) option
)
[@@deriving sexp_of]

type computed_property_name (* inlined *) = (
    Token.t (* "[" *) * expression * Token.t (* "]" *)
)
[@@deriving sexp_of]

type do_statement (* inlined *) = (
    Token.t (* "do" *) * statement * Token.t (* "while" *)
  * parenthesized_expression * semicolon
)
[@@deriving sexp_of]

type for_in_statement (* inlined *) = (
    Token.t (* "for" *)
  * Token.t (* "await" *) option
  * for_header
  * statement
)
[@@deriving sexp_of]

type for_statement (* inlined *) = (
    Token.t (* "for" *)
  * Token.t (* "(" *)
  * [
        `Lexi_decl of lexical_declaration
      | `Var_decl of variable_declaration
      | `Exp_stmt of expression_statement
      | `Empty_stmt of Token.t (* ";" *)
    ]
  * [ `Exp_stmt of expression_statement | `Empty_stmt of Token.t (* ";" *) ]
  * expressions option
  * Token.t (* ")" *)
  * statement
)
[@@deriving sexp_of]

type function_ (* inlined *) = (
    Token.t (* "async" *) option
  * Token.t (* "function" *)
  * identifier (*tok*) option
  * formal_parameters
  * statement_block
)
[@@deriving sexp_of]

type function_declaration (* inlined *) = (
    Token.t (* "async" *) option
  * Token.t (* "function" *)
  * identifier (*tok*)
  * formal_parameters
  * statement_block
  * automatic_semicolon (*tok*) option
)
[@@deriving sexp_of]

type generator_function (* inlined *) = (
    Token.t (* "async" *) option
  * Token.t (* "function" *)
  * Token.t (* "*" *)
  * identifier (*tok*) option
  * formal_parameters
  * statement_block
)
[@@deriving sexp_of]

type generator_function_declaration (* inlined *) = (
    Token.t (* "async" *) option
  * Token.t (* "function" *)
  * Token.t (* "*" *)
  * identifier (*tok*)
  * formal_parameters
  * statement_block
  * automatic_semicolon (*tok*) option
)
[@@deriving sexp_of]

type if_statement (* inlined *) = (
    Token.t (* "if" *)
  * parenthesized_expression
  * statement
  * (Token.t (* "else" *) * statement) option
)
[@@deriving sexp_of]

type jsx_attribute (* inlined *) = (
    jsx_attribute_name
  * (Token.t (* "=" *) * jsx_attribute_value) option
)
[@@deriving sexp_of]

type jsx_element (* inlined *) = (
    jsx_opening_element
  * jsx_child list (* zero or more *)
  * jsx_closing_element
)
[@@deriving sexp_of]

type jsx_self_closing_element (* inlined *) = (
    Token.t (* "<" *)
  * jsx_element_name
  * jsx_attribute_ list (* zero or more *)
  * Token.t (* "/" *)
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type labeled_statement (* inlined *) = (
    anon_choice_id_0e3c97f * Token.t (* ":" *) * statement
)
[@@deriving sexp_of]

type new_expression (* inlined *) = (
    Token.t (* "new" *)
  * primary_expression
  * arguments option
)
[@@deriving sexp_of]

type pair (* inlined *) = (property_name * Token.t (* ":" *) * expression)
[@@deriving sexp_of]

type rest_parameter (* inlined *) = (
    Token.t (* "..." *) * anon_choice_id_21dd422
)
[@@deriving sexp_of]

type return_statement (* inlined *) = (
    Token.t (* "return" *)
  * expressions option
  * semicolon
)
[@@deriving sexp_of]

type switch_statement (* inlined *) = (
    Token.t (* "switch" *) * parenthesized_expression * switch_body
)
[@@deriving sexp_of]

type ternary_expression (* inlined *) = (
    expression * Token.t (* "?" *) * expression * Token.t (* ":" *)
  * expression
)
[@@deriving sexp_of]

type throw_statement (* inlined *) = (
    Token.t (* "throw" *) * expressions * semicolon
)
[@@deriving sexp_of]

type try_statement (* inlined *) = (
    Token.t (* "try" *)
  * statement_block
  * catch_clause option
  * finally_clause option
)
[@@deriving sexp_of]

type while_statement (* inlined *) = (
    Token.t (* "while" *) * parenthesized_expression * statement
)
[@@deriving sexp_of]

type with_statement (* inlined *) = (
    Token.t (* "with" *) * parenthesized_expression * statement
)
[@@deriving sexp_of]

type yield_expression (* inlined *) = (
    Token.t (* "yield" *)
  * [
        `STAR_exp of (Token.t (* "*" *) * expression)
      | `Opt_exp of expression option
    ]
)
[@@deriving sexp_of]

let dump_tree root =
  sexp_of_program root
  |> Print_sexp.to_stdout