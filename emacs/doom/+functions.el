;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+functions.el -*- lexical-binding: t; -*-

(defun wm/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
