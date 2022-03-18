# Szymon Twardosz - Lab 02 DevOps

## Git hook odpowiedzialny za sprawdzenie poprawnosci tytulu i tresci commita. Uzyto do tego hooka commit-msg

```
#!/bin/bash

title=`head -n1 $1`
title_pattern="ST402272"

message=`tail -n1 $1`
message_pattern="(02)"

if ! [[ "$title" = $title_pattern ]]; then
    echo "Bad commit title"
    exit 1
fi

if ! [[ "$message" =~ $message_pattern ]]; then
    echo "Bad commmit message"
    exit 1
fi

```

### Sprawdzenie czy git hook dziala:

