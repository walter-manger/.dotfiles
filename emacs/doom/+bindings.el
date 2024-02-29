;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; (map! :leader
;;       (:prefix-map ("a" . "applications")
;;        (:prefix ("w" . "journal") :desc "Open Work" "j" #'org-journal-new-entry)
;;        ))


;; (map! :leader
;;       (:prefix ("j" . "journal") ;; org-journal bindings
;;         :desc "Create new journal entry" "j" #'org-journal-new-entry
;;         :desc "Open previous entry" "p" #'org-journal-open-previous-entry
;;         :desc "Open next entry" "n" #'org-journal-open-next-entry
;;         :desc "Search journal" "s" #'org-journal-search-forever))

;; Don't just call 'org-agenda-Quit as 'org-agenda-exit will close agenda files too
(add-hook 'org-agenda-mode-hook
          (lambda ()
                  (local-set-key (kbd "q") 'org-agenda-exit)))
