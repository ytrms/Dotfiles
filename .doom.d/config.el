;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lorenzo Gravina"
      user-mail-address "lorenzo.gravina@me.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka" :size 15))
(setq doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 15))
(setq doom-serif-font (font-spec :family "Iosevka Etoile" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Loading the modus theme
(require 'modus-themes)
(modus-themes-load-themes)
(modus-themes-load-vivendi)

;; Toggling between light and dark theme
(map! :leader
      :desc "Light/dark Modus theme"
      "t m" #'modus-themes-toggle)

;; Wrap text (not code!) at 80 columns
;;(add-hook 'text-mode-hook #'auto-fill-mode)
;;(setq-default fill-column 80)

;; have vterm use fish by default
(setq-default vterm-shell "/usr/local/bin/fish")

(setq-default
 delete-by-moving-to-trash t) ;; moves files to trash instead of just removing

;;(display-time-mode 1)
(setq auto-save-default t
      truncate-string-ellipsis "???"
      scroll-margin 2)

(setq which-key-idle-delay 0.5)
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "???\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "???\\1"))
   ))
