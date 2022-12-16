#!/bin/bash

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

rm -rf /Users/jan/.local/share/nvim/site/pack/packer

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ln -s $(pwd)/nvim ~/.config/

# cp nvim/init.lua ~/.config/nvim/init.lua
# cp nvim/plugins.lua ~/.config/nvim/lua/plugins.lua
# cp nvim/colorschemes.lua ~/.config/nvim/lua/colorschemes.lua
# cp nvim/rust.lua ~/.config/nvim/lua/rust.lua
# cp nvim/opts.lua ~/.config/nvim/lua/opts.lua
# cp nvim/completions.lua ~/.config/nvim/lua/completions.lua


