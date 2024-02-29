;;; ../repos/walter-manger/.dotfiles/emacs/.doom.d/+sql.el -*- lexical-binding: t; -*-


;;; server list
(setq sql-connection-alist
      '((local.user.dev (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "root")
         (sql-database "user"))
        ("RAM Prod" (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "central-database-ram-all.videoamp.com")
         (sql-user "wmanger")
         ;; (sql-password "Jwi8LA8V5mnKn5xw") ;; use password-wallet
         (sql-database "share"))))


;;(auth-source-search :label "RAM Prod")
