# Liyu's Emacs configurations

## Installation

Just clone the repository to your HOME directory:

 ```bash
 cd ~
 git clone https://github.com/gongliyu/.emacs.d.git
 ```
 
## Customize configurations

### "pre" and "post" machine specific configurations

Two user customization configurations will be loaded if exist. "\~/machine-specific-pre.el" will be loaded before other settings are executed. So it is recommended to put some machine dependent variables such as "exec-path" configuration here. On the other hand, "\~/machine-specific-post.el" will be loaded after other settings are executed.


### Customizable variables

There are several customiable variables to control the settings, which are recommended to specific in "~/machine-specific-pre.el"

#### *liyu-font-candidates*

We use "liyu-font-candidates" as a list of preferred fonts. Each item in this list will be checked to see if exist in the system, and will be add to "default-frame-alist" if exists. We can set the list in "~/machine-specific-pre.el" as

```elisp
(setq liyu-font-candidates `("Consolas 13", "Mono 13"))
```

The default value `("Consolas 13", "Mono 13")`.

#### `liyu-frame-width` and `liyu-frame-height`

The width (default to 80) and height (default to 30) of Emacs frame after startup. If either one is less than or equal 0, the frame will be maximized to full screen.

## Configured modes

* zenburn-theme
* unfill
* dired
* ace-window
* ace-link
* ivy
* company
* ispell
* tramp
* lsp
* org
* markdown
* latex
* python
* CC
* ess
* cmake
