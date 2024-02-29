;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+golang.el -*- lexical-binding: t; -*-

(add-hook! 'go-mode-hook
  (add-hook 'before-save-hook #'lsp-format-buffer nil 'local)
  (add-hook 'before-save-hook #'lsp-organize-imports nil 'local)
  )
