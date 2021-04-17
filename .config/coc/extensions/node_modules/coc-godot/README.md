# coc-godot

coc.nvim extension for godot language server protocol.
Original work by https://github.com/godotengine/godot-vscode-plugin ported to coc.nvim

This extension will most likely become useless once godot 3.2.2 is released,
as the language server will switch from websockets to TCP (cf: https://github.com/godotengine/godot/pull/35864)
we will be able to define a custom language server like this https://github.com/godotengine/godot/issues/34523#issuecomment-582144661

I recommend https://github.com/calviken/vim-gdscript3 for syntax highlighting
and added filetype to `.gd` files.

## Install

`:CocInstall coc-godot`

## Features

No commands are implemented yet, however this extension provides:
- code completion
- code validation
- go to definition
- documentation on hover

You must be editing the same project that godot currently opens in order for
these features to work.

## Configuration

In order to access your config file, launch `:CocConfig`.
The following configuration variables are exposed:

```
- godot.enable: default true // states wether this extension should be enabled
- godot.lsp_server_port: default 6008
```
