#!/bin/zsh
#
# Little script to recompile ElixirLS with the current elixir version.

default_version="0.13.0"
version="${1:-$default_version}"
elixir_ls_dir="tmp/elixir_ls"
current_directory=$(PWD)

echo "Current working directory: $current_directory"

set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

echo ''

info 'Recompiling ElixirLS'

git clone --depth 1 --branch v$version https://github.com/elixir-lsp/elixir-ls.git $elixir_ls_dir

cd $elixir_ls_dir

mix deps.get

# For ElixirLS VSCode extension:
# release_path="~/.vscode/extensions/jakebecker.elixir-ls-$version/elixir-ls-release/"

# For other IDEs, point to where your compiled Elixir LS version is:
# Change this path to where ElixirLS is normally located on your machine
release_path="/Users/simonricard/Documents/language_servers/elixir-ls/"

mix elixir_ls.release -o $release_path
echo "\nDeleting tmp elixir_ls directory"

cd $current_directory 
rm -rf tmp

success "Done."

# Print path to the new release
echo "Path to the new release:"
echo "$release_path"
