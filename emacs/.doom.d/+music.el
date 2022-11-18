;;; ~/.doom.d/+music.el -*- lexical-binding: t; -*-

(setq-default
        emms-show-format "NP: %s"
        emms-player-mpv-parameters '("--no-video" "--force-window=no" "--vo=null"))


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
        (emms-play-url "https://radio.stereoscenic.com/asp-s"))

(defun wm/hammock () (interactive)
        (emms-play-url "https://www.youtube.com/watch?v=W9tgpsl6R1Y"))

(defun wm/le-cassette () (interactive)
       (emms-play-url "https://www.youtube.com/watch?v=xzJmFt4iKK8"))

(defun wm/le-cassette-arms () (interactive)
       (emms-play-url "https://youtu.be/xzJmFt4iKK8?t=889"))

(defun wm/playlist () (interactive)
       (emms-play-playlist "~/.doom.d/modules/private/emms/pls"))

(map! :leader
      (:prefix-map ("Z" . "personal")
                   (:prefix ("m" . "music") :desc "play playlist" "p" #'wm/playlist)
                   (:prefix ("m" . "music") :desc "open playlist" "o" #'emms)
                   ))
