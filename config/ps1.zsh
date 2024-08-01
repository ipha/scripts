C1=90
C2=168
C3=216
C4=110
C5=30
C6=24

DISPUSER=""
DISPHOST=""

if [ "$USER" = 'root' ]; then
    C1=196
    DISPUSER="%n"
fi

if [ -n "$SSH_CLIENT" ]; then
    DISPUSER="%n"
    DISPHOST="@%M"
fi

PS1_2="%F{$F2}%K{$B2} %n %F{$B2}%K{$B3}"
PS1_3="%F{$F3}%K{$B3} %~ %F{$B3}%k %f"
SEG0="%F{$C1}%f"
SEG1="%K{$C1}$DISPUSER$DISPHOST%k%F{$C1}%K{$C2}%f%k"
SEG2="%K{$C2} %~ %F{$C2}%K{$C3}%f%k"
SEG3="%K{$C3}%F{$C3}%K{$C4}%f%k"
SEG4="%K{$C4}%F{$C4}%k%f%k"

PROMPT="${SEG0}${SEG1}${SEG2}${SEG3}${SEG4} "
