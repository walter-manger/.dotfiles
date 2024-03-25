;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+gtd.el -*- lexical-binding: t; -*-

(setq org-base-directory "~/.sync/org/")
(setq org-directory "~/.sync/org/organizer/.agenda-files")
(setq org-gtd-directory "~/.sync/org/organizer/.agenda-files/gtd")

(defun gtd/org-agenda-file (FILENAME)
  (concat (file-name-as-directory org-directory) FILENAME))

(wm/add-file-keybinding "C-c z w" (gtd/org-agenda-file "work.org") "work.org")
(wm/add-file-keybinding "C-c z h" (gtd/org-agenda-file "home.org") "home.org")
(wm/add-file-keybinding "C-c z g" (gtd/org-agenda-file "gtd/refile.org") "refile.org")
(wm/add-file-keybinding "C-c z n" (gtd/org-agenda-file "gtd/next.org") "next.org")
(wm/add-file-keybinding "C-c z f" (gtd/org-agenda-file "elfeed.org") "elfeed.org")

;;; Inspration
;;; https://github.com/kandread/doom-emacs-private/blob/master/%2Bgtd.el
;;; http://doc.norang.ca/org-mode.html

(after! org
  (setq org-roam-directory (concat (file-name-as-directory org-base-directory) "organizer/roam"))
  (setq org-agenda-files (directory-files org-gtd-directory 'full (rx ".org" eos)))

  ;; Borrowing from -> https://github.com/nmartin84/.doom.d#capture-templates
  (setq org-capture-templates
        `(("i" "📥 Inbox")
          ("ih" "✅ Home Task" entry (file+headline ,(gtd/org-agenda-file "gtd/next.org")  "Inbox")
           "* TODO %^{task} :@home:\n:PROPERTIES:\n :CREATED: %U\n :END:\n%?" :empty-lines 1 :kill-buffer t)
          ("iw" "✅ Work Task" entry (file+headline ,(gtd/org-agenda-file "gtd/next.org") "Inbox")
           "* TODO %^{task} :@work:\n:PROPERTIES:\n :CREATED: %U\n :END:\n%?" :empty-lines 1 :kill-buffer t)
          ("ir" "🗄 Refile" entry (file+headline ,(gtd/org-agenda-file "gtd/refile.org") "Inbox")
           "* REFILE %^{task} %^g\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")
          ("s" "ℹ️ Source" entry (file ,(gtd/org-agenda-file "gtd/refile.org"))
           "* REFILE %^{description} %^g\n:PROPERTIES:\n:CREATED: %U\n:END:\n:METADATA:\n- SOURCE: %(org-cliplink-capture)\n- AUTHOR:\n:END:\n%?")
          ;;("j" " journal")
          ;;("gp" " projects")
          ;;("b" " bullet journal")
          ;;("l" " local project")
          ;;("n" " notes")
          ("r" "📎 resources")
          ("rb" "📚 Book" entry (file+headline ,(gtd/org-agenda-file "gtd/read.org") "Inbox")
           "* TODO %^{title} %^g\n:PROPERTIES:\n:CREATED: %U\n:author: %^{author}\n:url: %c\n:pages: \n:rating: \n:END:\n%?")
          ("ra" "📰 Article" entry (file+headline ,(gtd/org-agenda-file "gtd/read.org") "Inbox")
           "* TODO %^{title} %^g\n:PROPERTIES:\n:CREATED: %U\n:author: %^{author}\n:url: %c\n:END:\n%?")
          ))

  ;; TODO: Cleanup the template names to be more clear and easier to recognize.
  ;; (push '("ga" " append to headline" plain (function nm/org-capture-log) " *Note added:* [%<%Y-%m-%d %a %H:%M>]\n%?" :empty-lines-before 1 :empty-lines-after 1) org-capture-templates)
  ;;(push '("gc" " capture" entry (file "~/Dropbox/Org/organizer/.agenda-files/refile.org") "* REFILE %^{task}\n:PROPERTIES:\n:CREATED: %U\n:END:\n:METADATA:\n- SOURCE:\n- AUTHOR:\n:END:\n%?") org-capture-templates)
  ;; (push '("gk" " capture [kill-ring]" entry (file+olp "~/Dropbox/Org/organizer/.agenda-files/gtd.org" "Inbox") "* REFILE %^{task}\n:PROPERTIES:\n:CREATED: %U\n:END:\n%c") org-capture-templates)
  ;; (push '("gx" " capture [current pos]" entry (file+olp "~/Dropbox/Org/organizer/.agenda-files/gtd.org" "Inbox") "* REFILE %^{task}\n:PROPERTIES:\n:CREATED: %U\n:END:\nLocation at time of capture: %a") org-capture-templates)


  ;;(push `("ir" "🗄 Refile" entry (file+headline ,(gtd/org-agenda-file "gtd/refile.org") "Inbox")
  ;;        "* REFILE %^{task} %^g\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?") org-capture-templates)
  ;; (push '("ih" "✅ Home Task" entry (file+headline "~/Dropbox/Org/organizer/.agenda-files/gtd/next.org" "Inbox")
  ;;         "* TODO %^{task} :@home:\n :PROPERTIES:\n :CREATED: %U\n :END:\n%?" :empty-lines 1) org-capture-templates)
  ;; (push '("iw" "✅ Work Task" entry (file+headline "~/Dropbox/Org/organizer/.agenda-files/gtd/next.org" "Inbox")
  ;;         "* TODO %^{task} :@work:\n :PROPERTIES:\n :CREATED: %U\n :END:\n%?" :empty-lines 1) org-capture-templates)


  ;; TODO: Configure more resource capture templates.
  ;; (push `("rb" "📚 Book" entry (file+headline ,(gtd/org-agenda-file "gtd/read.org") "Inbox")
  ;;       "* TODO %^{title} %^g\n:PROPERTIES:\n:CREATED: %U\n:author: %^{author}\n:url: %c\n:pages: \n:rating: \n:END:\n%?") org-capture-templates)
  ;;(push `("ra" "📰 Article" entry (file+headline ,(gtd/org-agenda-file "gtd/read.org") "Inbox")
  ;;        "* TODO %^{title} %^g\n:PROPERTIES:\n:CREATED: %U\n:author: %^{author}\n:url: %c\n:END:\n%?") org-capture-templates)
  ;; (push '("rr" " research literature" entry (file+function "~/projects/orgmode/gtd/websources.org" nm/enter-headline-websources) "* READ %(get-page-title (current-kill 0))") org-capture-templates)
  ;; (push '("rf" " rss feed" entry (file+function "~/projects/orgmode/elfeed.org" nm/return-headline-in-file) "* %^{link}") org-capture-templates)
  )


;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;; https://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
;; https://github.com/alphapapa/org-super-agenda#group-selectors
;; https://github.com/alphapapa/org-super-agenda/blob/master/examples.org#contributed-examples
;; https://github.com/bascht/dotfiles-public/blob/main/dot_doom.d/org.el

(after! org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        ;; org-agenda-block-separator nil
        org-agenda-compact-blocks t
        org-agenda-start-day nil ;; i.e. today
        org-agenda-span 1
        org-agenda-start-on-weekday nil)

  (setq org-agenda-custom-commands
        '(
          ("c" "Super View"
           (
            ( agenda ""
                     ((org-agenda-overriding-header "TODAY")))

            ;; (agenda "" ((org-agenda-overriding-header "")
            ;;         (org-super-agenda-groups
            ;;          '((:name "Today"
            ;;             :time-grid t
            ;;             :date today
            ;;             :order 1)))))

            ( todo "REFILE"
                   ((org-agenda-overriding-header "🗄️ To Refile")))
            ( todo "TODO"
                   ((org-agenda-overriding-header "🗄️ To DO NOW")))
            )
           )
          ("w" "Work Super View"
           (
            ( agenda ""
                     ((org-agenda-overriding-header "")))
            ( tags-todo "@work"
                        ((org-agenda-overriding-header "🗄️ To Work")))
            )
           )

          )
        )


  ;; (setq org-agenda-custom-commands
  ;;       '(("c" "Super view"
  ;;          ((agenda "" ((org-agenda-overriding-header "")
  ;;                       (org-super-agenda-groups
  ;;                        '((:name "Today"
  ;;                           :time-grid t
  ;;                           :date today
  ;;                           :order 1)))))
  ;;           (alltodo "" ((org-agenda-overriding-header "")
  ;;                        (org-super-agenda-groups
  ;;                         '((:log t)
  ;;                           (:name "To refile"
  ;;                            :todo "REFILE")
  ;;                            ;;:file-path "~/Dropbox/Org/organizer/.agenda-files/gtd/refile.org")
  ;;                           (:name "Next to do"
  ;;                            :todo "NEXT"
  ;;                            :order 1)
  ;;                           (:name "Important"
  ;;                            :priority "A"
  ;;                            :order 6)
  ;;                           (:name "Today's tasks"
  ;;                            :file-path "journal/")
  ;;                           (:name "Due Today"
  ;;                            :deadline today
  ;;                            :order 2)
  ;;                           (:name "Scheduled Soon"
  ;;                            :scheduled future
  ;;                            :order 8)
  ;;                           (:name "Overdue"
  ;;                            :deadline past
  ;;                            :order 7)
  ;;                           (:name "Meetings"
  ;;                            :and (:todo "MEET" :scheduled future)
  ;;                            :order 10)
  ;;                           (:discard (:not (:todo "TODO")))))))))))
  :config
  (org-super-agenda-mode))
