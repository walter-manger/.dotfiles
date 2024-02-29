;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Walter Manger"
      user-mail-address "walter.manger@gmail.com")

(setq js-indent-level 2
      js2-basic-offset 2)

(setq web-mode-markup-indent-offset 2)

(setq typescript-indent-level 2)

(setq ruby-indent-level 2)

(advice-remove 'org-tree-slide--display-tree-with-narrow
               #'+org-present--narrow-to-subtree-a)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))


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


;; Modules
(load! "+ui")
(load! "+functions")
(load! "+bindings")
(load! "+gtd")
(load! "+dired")
(load! "+evil")
(load! "+python")
(load! "+golang")
(load! "+music")
(load! "+org-jira")
(load! "+reading")
(load! "+sql")

;; (add-hook 'typescript-tsx-mode #'format-all-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))


(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
        sql-mode             ; sqlformat is currently broken
        tex-mode             ; latexindent is broken
        web-mode
        json-mode
        go-mode              ; gopls handles this nicely
        python-mode          ; TODO let's not format tiltfiles -- too many changes
        latex-mode))

;; (use-package prettier
;;   :hook (
;;          ;;(typescript-mode . prettier-mode)
;;          ;;(js-mode . prettier-mode)
;;          ;;(json-mode . prettier-mode)
;;          ;;(yaml-mode . prettier-mode)
;;          ;;(ruby-mode . prettier-mode)
;;          (web-mode . prettier-mode)
;;          ))


;;((web-mode . ((eval . (prettier-mode t)))))


(setq deft-directory "~/Dropbox/Org/organizer/roam"
      deft-extensions '("org")
      deft-use-filename-as-title t
      deft-recursive nil)

(use-package! jsonnet-mode
  :defer t
  :config
  (set-electric! 'jsonnet-mode :chars '(?\n ?: ?{ ?}))
  (setq jsonnet-use-smie t))


(setq +format-with-lsp nil)
;;(setq-hook! 'js2-mode-hook flycheck-checker 'javascript-eslint)

;; After reviewing a lot of documentation about experimental flags
;; https://github.com/creack/dotfiles/blob/master/.emacs#L465
;; https://github.com/golang/tools/blob/master/gopls/doc/settings.md#experimentalworkspacemodule-bool
;; https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/settings.md#experimentalworkspacemodule-bool
;; https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/workspace.md
;; https://varunksaini.com/vscode-multimodule-repo/
;; https://github.com/golang/tools/blob/master/gopls/doc/emacs.md#configuring-gopls-via-lsp-mode

(after! lsp-mode
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)
     ;;("gopls.experimentalWorkspaceModule" t t)
     ))
  )


;; brew install vale
;; git clone git@github.com:errata-ai/vale-boilerplate.git
;; .vale.ini needs to be in the directory of the file you want to lint
;; Stolen from: https://emacstil.com/til/2022/03/05/setting-up-vale-prose-linter-on-emacs/
(flycheck-define-checker vale
  "A checker for prose"
  :command ("vale" "--output" "line"
            source)
  :standard-input nil
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (id (one-or-more (not (any ":")))) ":" (message) line-end))
  :modes (markdown-mode org-mode text-mode gfm-mode)
  )
(add-to-list 'flycheck-checkers 'vale 'append)

(setq inferior-lisp-program "clisp")

(setq ob-mermaid-cli-path "~/node_modules/.bin/mmdc")

(when (eq system-type 'darwin)
  (setq insert-directory-program "/opt/homebrew/bin/gls"))

;; https://org-roam.discourse.group/t/org-ref-code-in-doom-emacs-init-file/1483
(use-package! org-ref
  :after org
  :commands
  (org-ref-cite-hydra/body
   org-ref-bibtex-hydra/body)
  :init
  (let ((cache-dir (concat doom-cache-dir "org-ref")))
    (unless (file-exists-p cache-dir)
      (make-directory cache-dir t))
    (setq orhc-bibtex-cache-file (concat cache-dir "/orhc-bibtex-cache"))))


;(setq org-babel-lilypond-ly-command "lilypond")

(after! org
  (require 'org-ref)
  :init
  (setq org-babel-lilypond-ly-command "lilypond")
  )

;; Always try ~/.authinfo first
(after! auth-source
  (setq auth-sources (nreverse auth-sources)))


(use-package! kubernetes
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))


;; don't watch in the large code bases that I find myself in
(after! lsp-mode
  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 100))


(use-package! magit-circleci
  :config
  (setq magit-circleci-token "b2fb2c60de29d7cc186c5f8272500e84932b354b"))

(after! projectile (setq projectile-project-root-files-bottom-up (remove ".git"
                                                                         projectile-project-root-files-bottom-up)))

(after! web-mode
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(use-package! lsp-tailwindcss)

(after! lilypond
  :config
  (setq org-babel-lilypond-commands "lilypond"))


(after! rego-mode
  :config
  (setq rego-repl-executable "/opt/homebrew/bin/opa")
  (setq rego-opa-command "/opt/homebrew/bin/opa")
  )
