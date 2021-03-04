;;; ~/.doom.d/+dired.el -*- lexical-binding: t; -*-

(after! dired
  (add-hook 'dired-mode-hook (lambda ()
                               (dired-hide-details-mode 1))))
