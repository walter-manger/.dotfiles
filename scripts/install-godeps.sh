#!/usr/bin/env bash

# REPL!
go install github.com/x-motemen/gore/cmd/gore@latest

# Autocompletion
go install github.com/stamblerre/gocode@latest

# Documentation
go install golang.org/x/tools/cmd/godoc@latest

# Add/Removed Necessary Imports
go install golang.org/x/tools/cmd/goimports@latest

# Type-Safe Renaming of Go identifiers
go install golang.org/x/tools/cmd/gorename@latest

# Asks questions about your Gocode
go install golang.org/x/tools/cmd/guru@latest

# Generate tests based off of the func you're on
go install github.com/cweill/gotests/gotests@latest

# Add `json` or `bson` to structs easily
go install github.com/fatih/gomodifytags@latest

# Language Server
go install golang.org/x/tools/gopls@latest
