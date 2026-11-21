;;; doom-rose-pine-moon-dragon-theme.el --- Rosé Pine Moon syntax on Kanagawa Dragon base -*- lexical-binding: t; -*-
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-rose-pine-moon-dragon-theme nil
  "Options for the `doom-rose-pine-moon-dragon' theme."
  :group 'doom-themes)

(defcustom doom-rose-pine-moon-dragon-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rose-pine-moon-dragon-theme
  :type 'boolean)

(defcustom doom-rose-pine-moon-dragon-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rose-pine-moon-dragon-theme
  :type 'boolean)

(defcustom doom-rose-pine-moon-dragon-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'doom-rose-pine-moon-dragon-theme
  :type 'boolean)

(defcustom doom-rose-pine-moon-dragon-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-rose-pine-moon-dragon-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-rose-pine-moon-dragon
  "Rosé Pine Moon syntax highlighting on a Kanagawa Dragon (Ghostty) base"

  ;; Main theme colors
  (
    ;; name           default     256         16
    (base             '("#181616"   "#181616"   "black"        ))
    (surface          '("#211f26"   "#211f26"   "brightblack"  ))
    (overlay          '("#393552"   "#393552"   "brightblack"  ))
    (muted            '("#6e6a86"   "#6e6a86"   "brightblack"  ))
    ;; Ghostty/Kanagawa foreground-ish grey, kept for base7
    (subtle           '("#c5c9c5"   "#c5c9c5"   "white"        ))
    ;; Real Rosé Pine "subtle" (operators, delimiters in rose-pine.nvim)
    (rp-subtle        '("#908caa"   "#908caa"   "white"        ))
    (text             '("#e0def4"   "#e0def4"   "white"        ))
    (cursor-gold      '("#c8c093"   "#c8c093"   "yellow"       ))
    (love             '("#eb6f92"   "#eb6f92"   "red"          ))
    (gold             '("#f6c177"   "#f6c177"   "yellow"       ))
    (rose             '("#ea9a97"   "#ea9a97"   "cyan"         ))
    (pine             '("#3e8fb0"   "#3e8fb0"   "green"        ))
    (foam             '("#9ccfd8"   "#9ccfd8"   "blue"         ))
    (iris             '("#c4a7e7"   "#c4a7e7"   "magenta"      ))
    (highlightL       '("#201e24"   "#201e24"   "brightblack"  ))
    (highlightM       '("#393552"   "#393552"   "brightblack"  ))
    (highlightH       '("#4c476b"   "#4c476b"   "brightblack"  ))

    ;; Variables required by doom-themes
    (bg               base)
    (fg               (if doom-rose-pine-moon-dragon-brighter-text
                          '("#f5f4fc" "#f5f4fc" "brightwhite")
                        text))
    (bg-alt           base)
    (fg-alt           text)
    (base0            base)
    (base1            surface)
    (base2            highlightL)
    (base3            overlay)
    (base4            highlightM)
    (base5            highlightH)
    (base6            muted)
    (base7            subtle)
    (base8            text)
    (grey             muted)
    (red              love)
    (orange           gold)
    (green            pine)
    (teal             foam)
    (yellow           gold)
    (pink             love)
    (blue             foam)
    (dark-blue        pine)
    (magenta          iris)
    (violet           iris)
    (cyan             rose)
    (dark-cyan        foam)

    ;; Required face categories for syntax highlighting
    (highlight         cursor-gold)
    (selection         overlay)
    (region            overlay)
    (vertical-bar      surface)

    (comments          (if doom-rose-pine-moon-dragon-brighter-comments rp-subtle muted))
    (doc-comments      (if doom-rose-pine-moon-dragon-brighter-comments rp-subtle muted))

    ;; Rosé Pine syntax mapping (from rose-pine.nvim)
    (builtin           rose)
    (constants         foam)
    (functions         rose)
    (keywords          pine)
    (methods           rose)
    (numbers           gold)
    (operators         rp-subtle)
    (strings           gold)
    (type              foam)
    (variables         text)

    (error             love)
    (success           foam)
    (warning           gold)

    (vc-added          foam)
    (vc-deleted        love)
    (vc-modified       gold)

    ;; Modeline
    (modeline-bg               (if doom-rose-pine-moon-dragon-brighter-modeline overlay surface))
    (modeline-fg               text)
    (modeline-bg-alt           (if doom-rose-pine-moon-dragon-brighter-modeline muted overlay))
    (modeline-fg-alt           text)
    (modeline-bg-inactive      base)
    (modeline-fg-inactive      muted)
    (modeline-bg-inactive-alt  base)
    (modeline-fg-inactive-alt  muted)
    (modeline-pad
      (when doom-rose-pine-moon-dragon-padded-modeline
        (if (integerp doom-rose-pine-moon-dragon-padded-modeline)
            doom-rose-pine-moon-dragon-padded-modeline
          4))))

  ;; Base theme face overrides
  (
    ;; Cursor & selection
    (cursor
      :background cursor-gold
      :foreground base)
    ((region &override)
      :background overlay)

    ;; Font lock: classic faces (no bold, no italic)
    ((font-lock-comment-face &override)
      :foreground comments :slant 'normal :weight 'normal
      :background (if doom-rose-pine-moon-dragon-brighter-comments (doom-blend teal base 0.07)))
    ((font-lock-doc-face &override)           :foreground comments  :slant 'normal :weight 'normal)
    ((font-lock-type-face &override)          :foreground foam      :slant 'normal :weight 'normal)
    ((font-lock-builtin-face &override)       :foreground rose      :slant 'normal :weight 'normal)
    ((font-lock-function-name-face &override) :foreground rose      :slant 'normal :weight 'normal)
    ((font-lock-keyword-face &override)       :foreground pine      :slant 'normal :weight 'normal)
    ((font-lock-constant-face &override)      :foreground foam      :slant 'normal :weight 'normal)
    ((font-lock-string-face &override)        :foreground gold      :slant 'normal :weight 'normal)
    ((font-lock-variable-name-face &override) :foreground text      :slant 'normal :weight 'normal)
    ((font-lock-warning-face &override)       :foreground love      :slant 'normal :weight 'normal)
    ((font-lock-negation-char-face &override) :foreground rp-subtle :slant 'normal :weight 'normal)

    ;; Font lock: Emacs 29+ faces used by tree-sitter modes
    ;; (the equivalents of Neovim's @function.call, @property, @punctuation.*, etc.)
    ((font-lock-function-call-face &override)    :foreground rose      :slant 'normal :weight 'normal)
    ((font-lock-variable-use-face &override)     :foreground text      :slant 'normal :weight 'normal)
    ((font-lock-property-name-face &override)    :foreground foam      :slant 'normal :weight 'normal)
    ((font-lock-property-use-face &override)     :foreground foam      :slant 'normal :weight 'normal)
    ((font-lock-number-face &override)           :foreground gold      :slant 'normal :weight 'normal)
    ((font-lock-operator-face &override)         :foreground rp-subtle :slant 'normal :weight 'normal)
    ((font-lock-punctuation-face &override)      :foreground rp-subtle :slant 'normal :weight 'normal)
    ((font-lock-bracket-face &override)          :foreground muted     :slant 'normal :weight 'normal)
    ((font-lock-delimiter-face &override)        :foreground rp-subtle :slant 'normal :weight 'normal)
    ((font-lock-misc-punctuation-face &override) :foreground rp-subtle :slant 'normal :weight 'normal)
    ((font-lock-escape-face &override)           :foreground pine      :slant 'normal :weight 'normal)
    ((font-lock-regexp-face &override)           :foreground iris      :slant 'normal :weight 'normal)
    ((font-lock-regexp-grouping-backslash &override) :foreground pine  :slant 'normal :weight 'normal)
    ((font-lock-regexp-grouping-construct &override) :foreground iris  :slant 'normal :weight 'normal)
    ((font-lock-preprocessor-face &override)     :foreground iris      :slant 'normal :weight 'normal)

    ;; Highlight line
    (hl-line
      :background surface)

    ;; Vertico: selected candidate matches the editor's current-line highlight
    (vertico-current :background surface :weight 'normal)

    ;; Line numbers (current line in the same gold as strings)
    ((line-number &override) :foreground muted)
    ((line-number-current-line &override) :foreground gold)

    ;; Mode line
    (mode-line
      :background modeline-bg
      :foreground modeline-fg
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
      :background modeline-bg-inactive
      :foreground modeline-fg-inactive
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis
      :foreground (if doom-rose-pine-moon-dragon-brighter-modeline text rp-subtle))

    ;; CSS mode / scss-mode
    (css-proprietary-property :foreground rose)
    (css-property             :foreground foam)
    (css-selector             :foreground foam)

    ;; Doom dashboard
    (doom-dashboard-banner      :foreground iris)
    (doom-dashboard-menu-title  :foreground foam)
    (doom-dashboard-menu-desc   :foreground gold)
    (doom-dashboard-footer      :foreground muted)
    (doom-dashboard-footer-icon :foreground pine)
    (doom-dashboard-loaded      :foreground rose)

    ;; Doom mode line
    (doom-modeline-bar :background pine)
    (doom-modeline-evil-emacs-state  :foreground iris)
    (doom-modeline-evil-normal-state :foreground pine)
    (doom-modeline-evil-visual-state :foreground iris)
    (doom-modeline-evil-insert-state :foreground gold)

    ;; Markdown mode
    (markdown-markup-face :foreground muted)
    (markdown-header-face :weight 'normal :foreground iris)
    ((markdown-code-face &override) :background surface)

    ;; Org mode
    (org-block :background (doom-blend yellow bg 0.04) :extend t)
    (org-block-background :background (doom-blend yellow bg 0.04))
    (org-block-begin-line :background (doom-blend yellow bg 0.08) :foreground comments :extend t)
    (org-block-end-line :background (doom-blend yellow bg 0.08) :foreground comments :extend t)
    (org-level-1 :foreground gold :weight 'normal)
    (org-level-2 :foreground rose :weight 'normal)
    (org-level-3 :foreground pine :weight 'normal)
    (org-level-4 :foreground iris :weight 'normal)
    (org-level-5 :foreground gold :weight 'normal)
    (org-level-6 :foreground rose :weight 'normal)
    (org-level-7 :foreground pine :weight 'normal)
    (org-level-8 :foreground iris :weight 'normal)

    ;; Solaire
    (solaire-default-face :background base :foreground fg)
    (solaire-mode-line-face
      :inherit 'mode-line
      :background modeline-bg-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
      :inherit 'mode-line-inactive
      :background modeline-bg-inactive-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Widget
    (widget-field :foreground fg :background muted)
    (widget-single-line-field :foreground fg :background muted)))

;;; doom-rose-pine-moon-dragon-theme.el ends here
