# Homebrew

## Get Package List
```bash

    # all Packages
    brew deps --tree --installed

    # One Package
    brew deps --tree --installed [FORMULAcle]

    brew autoremove
    brew uninstall --force $(brew list)

    brew uses --installed [FORMULA]
    brew cleanup -s
    rm -rf $(brew --cache)
```
