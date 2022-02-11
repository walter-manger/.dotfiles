;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Walter Manger"
      user-mail-address "walter.manger@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code iScript" :size 19 :weight 'normal)
      doom-big-font (font-spec :family "Fira Code iScript" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Code iScript" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-spacegrey)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Org/organizer/.agenda-files")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq js-indent-level 2
      js2-basic-offset 2)

(setq web-mode-markup-indent-offset 2)

(setq typescript-indent-level 2)

(setq ruby-indent-level 2)

(advice-remove 'org-tree-slide--display-tree-with-narrow
               #'+org-present--narrow-to-subtree-a)

(add-to-list 'auto-mode-alist '("\\Earthfile\\'" . yaml-mode))

(map! :leader
      (:prefix-map ("a" . "applications")
       (:prefix ("w" . "journal")
        :desc "Open Work" "j" #'org-journal-new-entry)))

;; config.el
;; (use-package! python-black
;;   :demand t
;;   :after python)
;; (add-hook! 'python-mode-hook #'python-black-on-save-mode)

;; ;; Feel free to throw your own personal keybindings here
;; (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
;; (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
;; (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(defun wm/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))

(wm/add-file-keybinding "C-c z w" "~/Dropbox/Org/organizer/.agenda-files/work.org" "work.org")
(wm/add-file-keybinding "C-c z h" "~/Dropbox/Org/organizer/.agenda-files/home.org" "home.org")

;; Modules
(load! "+dired")
(load! "+evil")

;; (add-hook 'typescript-tsx-mode #'format-all-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(setq org-roam-directory "~/Dropbox/Org/organizer/roam")

;; (use-package prettier
;;   :hook ((typescript-mode . prettier-mode)
;;          (js-mode . prettier-mode)
;;          (json-mode . prettier-mode)
;;          (yaml-mode . prettier-mode)
;;          (ruby-mode . prettier-mode)))

(setq deft-directory "~/Dropbox/Org"
      deft-extensions '("txt" "org" "md")
      deft-recursive t)

(use-package! jsonnet-mode
  :defer t
  :config
  (set-electric! 'jsonnet-mode :chars '(?\n ?: ?{ ?}))
  (setq jsonnet-use-smie t))


(setq +format-with-lsp nil)
;;(setq-hook! 'js2-mode-hook flycheck-checker 'javascript-eslint)
