source ~/.bashrc

# starts keychain for a more comfortable ssh-feeling (but only on hosts that matter):
if [ \( $(hostname) = "fitzgerald" -o $(hostname) = "kurtis" -o $(hostname) = "marquis" \) ]; then
    if [ -e /usr/bin/keychain ]; then
        eval $(keychain --eval -Q -q ~/.ssh/id_rsa)
    fi
fi
