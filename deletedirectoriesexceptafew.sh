#! /bin/bash
#
#
# Command to delete all directories inside a directory except a few
#
setopt extendedglob
find ./target_dir -mindepth 1 ! -path './target_dir/unittests/*' ! -path './target_dir/unittests' -delete
