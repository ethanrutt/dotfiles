# Helpful Command
To get stuff to open default with certain applications, check out xdg-mime

i.e. query what your default app is
```sh
# default pdf reader
xdg-mime query default application/pdf
# default file explorer
xdg-mime query default inode/directory
```

i.e. reset to a different one
```sh
# set default pdf reader to mupdf
xdg-mime default mupdf.desktop application/pdf
# set default file explorer to thunar
xdg-mime default thunar.desktop inode/directory
```
