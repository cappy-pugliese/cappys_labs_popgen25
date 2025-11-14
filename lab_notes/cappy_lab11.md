# Troubleshooting tess3r download

## 11-13

-   failed to get tess3r to install
-   issue with c++? not able to find 'iterator'
-   posted a question on stack overflow, will have to see if anyone - is able to help me figure out what's going on

## 11-14

-   had to install xcode app
-   did not work downloading from the app store, but was able to follow a tutorial and downloaded it from apple website instead

```{bash}
xcode-select -p
# ^ shows current xcode path

sudo xcode-select -switch /Applications/Xcode26.1.1.app
# ^ points to the correct version of xcode
```

-   ok it finally worked!!!