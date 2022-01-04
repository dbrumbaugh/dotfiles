config.load_autoconfig()

config.bind('<ctrl-shift-v>', 'hint links spawn --verbose --detach mpv {hint-url} --input-ipc-server=/tmp/mpvsocket')
