convert.vim
============

This Vim plugin is a tool for converting units to other units. Time, distance,
data, power, etc.

<img src="vim-convert.jpg" width="400">

# Usage
```viml
:Convert [[value]|[start unit]] {target unit}
```

To convert in-place the currently visually-selected text which includes a
unit, e.g. `500g`
```viml
:Convert {target unit}
```

To convert in-place the currently visually-selected text which does *not*
include a unit, e.g. `500`, you'll need to specify one:
```viml
:Convert {start unit} {target unit}
```

To insert a unit conversion as a new value after the cursor, give both fields:
```viml
:Convert <value><start unit> <target unit>
```

This plugin will try to be mindful of whether the unit itself is desired when
replacing text. That is, if the selected text lacks a unit, the result will be
placed without one as well.

Examples of input and results and how they get there:

  ---------------------------------------------------------------------------
  | Selected text   | Command          | What it's doing       | Result     |
  |-----------------|------------------|-----------------------|------------|
  | 192in           | :Convert ft      | `units 192in ft`      | 4.166ft    |
  | 16              | :Convert ft in   | `units 16ft in`       | 192        |
  | *none*          | :Convert 16ft in | `units 16ft in`       | 192in      |
  | *any text*      | :Convert 16ft in | `units 16ft in`       | 192in      |
  | 12parsecs       | :Convert hrs     | `units 12parsecs hrs` | *error*\*  |
  ---------------------------------------------------------------------------
\* parsecs are a unit of distance

# Installation

Several ways to install:

### Pathogen Vim plugin manager

[Pathogen](https://github.com/tpope/vim-pathogen)

```sh
cd ~/.vim/bundle
git clone git://github.com/cspeterson/vim-convert.git
```

### Vundle Vim plugin manager

[Vundle](https://github.com/VundleVim/Vundle.vim)

Add this to the Vundle plugin list in your `.vimrc`
```viml
Plugin 'cspeterson/vim-convert'
```

And install with:
```sh
vim +PluginInstall
```

Once help tags have been generated, you can view the manual with
`:help convert`.

# Customization

## Customizing the plugin

To set the path to the `units` command if not in your PATH:
```viml
set g:convert_command='/path/to/units'
```
 
## Customing the Units utility

This plugin uses Units, a GNU unit conversion and calculation program, and so
supports any conversions that it supports. As a rule of thumb any unit or
shortened unit you think of will probably work.

To list supported units (as defined in Units' `definitions.units` file) in a
split window:
```viml
:Units
```

And while the full lowdown on customizing GNU Units may be beyond the scope of
this text, here is an example of the sort of statements you could put into
`$HOME/.units` in order to create new definitions or override existing ones:
```
# re-define `pt` from `pint` to `point` (the typographical unit)
pt      computerpoint
# re-define `pc` from `parsec` to `pica` (the typographical unit)
pc      computerpica
```

# Contributing

Taking pull requests at `https://github.com/cspeterson/vim-convert`

Please code defensively (`normal!` etc) and try to maintain style, such as
there is.

# Credits

By [Christopher Peterson](https://chrispeterson.info) ([@cspete](https://www.twitter.com/cspete))

This plugin relies on the really actually very awesome [Units utility from GNU](https://www.gnu.org/software/units/)

Images used in the logo art<br/>
[Vim logo from D0ktorz](https://commons.wikimedia.org/wiki/File:Vimlogo.svg) | [SI Units from Dono](https://commons.wikimedia.org/wiki/File:SI_base_unit.svg)

License
-------

Copyright (c) Christopher Peterson. Distributed under [The MIT License](https://opensource.org/licenses/MIT).
