# Note

## Create New Repository

```bash
    # 'main', 'trunk' and 'development'
    git config --global init.defaultBranch main
    # reaname via this command : $ git branch -m <name>
    
    mkdir Note
    echo "# Note" >> README.md
    git init
    git config --global init.defaultBranch main
    git status
    git add README.md
    git commit -m "Add README.md"
    git branch -M main
    git remote add origin git@github.com:ViVaKR/Note.git
    git push -u origin main
    code . # excute visual studio code (installed)
```

# mermaid

```bash
    npm install -g @mermaid-js/mermaid-cli
    mmdc -i src.md -o dest.md
```
