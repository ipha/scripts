# LOCK=\xEE\x82\xA2
# SEP=\xEE\x82\xB0
# SPACE=\xC2\xA0

F1=220
B1=166
F2=231
B2=31
F3=252
B3=240


if [ "$USER" = 'root' ]; then
    B2=160
fi

if [ -n "$SSH_CLIENT" ]; then
    PS1_1="%F{$F1}%K{$B1} %m %F{$B1}%K{$B2}"
fi

PS1_2="%F{$F2}%K{$B2} %n %F{$B2}%K{$B3}"
PS1_3="%F{$F3}%K{$B3} %~ %F{$B3}%k %f"

PROMPT="${PS1_1}${PS1_2}${PS1_3}"
