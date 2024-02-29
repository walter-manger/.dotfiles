;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+security.el -*- lexical-binding: t; -*-

;; The latest version of gnupg (2.4.3 at the time of writing) causes Emacs to hang.
;; The best way to battle this is to downgrade.
;;
;; See: https://www.reddit.com/user/numbchild/
;;
;; Where the solution is to create a custom brew formula using this:
;; https://raw.githubusercontent.com/Homebrew/homebrew-core/59edfe598541186430d49cc34f42671e849e2fc9/Formula/gnupg.rb
;;
;; And do this
;; brew uninstall --ignore-dependencies gpg
;; brew install [path to custom formula]
