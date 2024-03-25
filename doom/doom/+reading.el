;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+reading.el -*- lexical-binding: t; -*-

(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago +unread -theology -mathematics"))

(after! reddigg
  :config
  (setq reddigg-subs
        '(
          Emacs
          Entrepreneur
          OverEmployed
          )
        )
  )
