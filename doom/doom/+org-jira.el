;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+org-jira.el -*- lexical-binding: t; -*-

(make-directory "~/.org-jira" 'ignore-if-exists)

(setq jiralib-url "https://videoamp.atlassian.net/")

(setq jiralib-update-issue-fields-exclude-list '(reporter))
