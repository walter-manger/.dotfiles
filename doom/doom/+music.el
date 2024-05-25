;;; ~/.doom.d/+music.el -*- lexical-binding: t; -*-

(setq-default
 emms-show-format "NP: %s"
 emms-player-mpv-parameters '("--no-video" "--force-window=no" "--vo=null"))


;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html#Association-Lists
(setq yt-urls
      '(
        ("hammock-elsewhere" . ("W9tgpsl6R1Y" 0 "Hammock"))
        ("hammock-oblivion" . ("GBF3GiMQ0d4" 0 "Hammock"))
        ("hammock-shadows" . ("Zxl0ohC_zZ0" 0 "Hammock"))
        ("le-cassette" . ("xzJmFt4iKK8" 0 "Le Cassette"))
        ("le-cassette-arms" . ("xzJmFt4iKK8" 889 "Le Cassette"))
        ("gryff-calypso" . ("whwrW79zVwo" 0 "Gryff"))
        ("timecop-lovers" . ("4Q-QAnmC0PA" 0 "Timecop"))
        ))

;; (cdr (assoc "hammock-elsewhere" yt-urls))


;; (setq-default
;;    emms-source-file-default-directory "~/Music/Downloads"

;;    ;;emms-source-playlist-default-format 'm3u
;;    emms-playlist-mode-center-when-go t
;;    emms-playlist-default-major-mode 'emms-playlist-mode
;;    emms-show-format "NP: %s"

;;    ;;emms-player-list '(emms-player-mpv)
;;    ;;emms-player-mpv-environment '("PULSE_PROP_media.role=music")
;;    emms-player-mpv-parameters '("--quiet" "--really-quiet" "--no-video" "--no-audio-display" "--force-window=no" "--vo=null"))

(defun wm/sleeping-pill () (interactive)
       (setq emms-mode-line-format " [ :Ambient ]")
       (emms-play-url "https://radio.stereoscenic.com/asp-h"))

;; Elsewhere
(defun wm/hammock-elsewhere () (interactive)
       (wm/play-yt "W9tgpsl6R1Y" 0 "Hammock"))

;; Oblivian Hymns
(defun wm/hammock-oblivion () (interactive)
       (wm/play-yt "GBF3GiMQ0d4" 0 "Hammock"))

;; Chasing After Shadows... Living with Ghosts
(defun wm/hammock-shadows () (interactive)
       (wm/play-yt "Zxl0ohC_zZ0" 0 "Hammock"))

(defun wm/le-cassette () (interactive)
       (wm/play-yt "xzJmFt4iKK8" 0 "Le Casette"))

(defun wm/le-cassette-arms () (interactive)
       (wm/play-yt "xzJmFt4iKK8" 889 "Le Casette"))

(defun wm/gryff () (interactive)
       (wm/play-yt "whwrW79zVwo" 0 "Gryff"))

(defun wm/lovers () (interactive)
       (wm/play-yt "4Q-QAnmC0PA" 0 "Lovers"))

(defun wm/somebody () (interactive)
       (wm/play-yt "lN8TtaYMeDk" 0 "Somebody"))

(defun wm/holy-name () (interactive)
       (wm/play-yt "ojntwsaCvfA" 0 "HolyName"))

(defun wm/playlist () (interactive)
       (setq emms-mode-line-format " [ %s ]")
       (emms-play-playlist "~/.doom.d/modules/private/emms/pls"))

(cl-defun wm/play-yt (id &optional (start-time nil) (title nil))
  "Plays a youtube ID beginning at time START-TIME with a TITLE."
  (setq url (format "https://www.youtube.com/watch?v=%s&t=%d" id (or start-time 0)))
  (setq emms-mode-line-format (format " [ 󰗃:%s ]" (or title id)))
  (emms-play-url url))

(map! :leader
      (:prefix-map ("Z" . "personal")
                   (:prefix ("m" . "music") :desc "play playlist" "p" #'wm/playlist)
                   (:prefix ("m" . "music") :desc "open playlist" "o" #'emms)
                   (:prefix ("m" . "music") :desc "stop" "s" #'emms-stop)
                   (:prefix ("m" . "music") :desc "pause" "p" #'emms-pause)
                   ))
