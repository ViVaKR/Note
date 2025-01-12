# Homebrew

## Get Package List

```bash

    # Check Dependency All Packages
    brew deps --tree --installed

    # One Package
    brew deps --tree --installed [FORMULA]

    brew autoremove
    brew uninstall --force $(brew list)

    brew uses --installed [FORMULA]
    brew cleanup -s
    rm -rf $(brew --cache)

    # Cleanup cache all
    # /User/${whoami}/Library/Caches/Homebrew/downloads/
    brew cleanup --prune=all
```
