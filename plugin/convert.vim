" convert.vim - Convert units to other units quickly and easily
" Author: Christopher Peterson <https://cspeterson.net>

if exists('g:loaded_convert')
  finish
endif
let g:loaded_convert = 1

""" Config {{{1
if !exists('g:convert_command')
  let g:convert_command = 'units'
endif
""" }}}

""" Commands and functions {{{1
command! -range -nargs=+ Convert
  \ call convert#Convert_units(<f-args>)

command! Units
  \ call convert#Display_units_defs()


""" }}}
