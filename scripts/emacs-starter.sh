#!/bin/sh

CLIENT=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient

$(/usr/bin/osascript <<-END
  tell application ((path to applications folder as text) & "Emacs.app")
    activate
  end tell
END
)

while ! "$CLIENT" -e '"pass"' 2>&1 | grep '"pass"' > /dev/null; do
    sleep 0.3
done

if test "$#" -gt 0; then
    exec "$CLIENT" -c $@
fi
