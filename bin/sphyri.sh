#!/bin/sh

# Selects the first editor that is available:
editors=(vim vi nano)
for ed in ${editors[@]}
do
    if which "$ed" > /dev/null; then
        exec "$ed" "$@"
    fi
done
