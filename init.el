;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
    "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
    (setq-default
        ;; Base distribution to use. This is a layer contained in the directory
        ;; `+distribution'. For now available distributions are `spacemacs-base'
        ;; or `spacemacs'. (default 'spacemacs)
        dotspacemacs-distribution 'spacemacs
        ;; Lazy installation of layers (i.e. layers are installed only when a file
        ;; with a supported type is opened). Possible values are `all', `unused'
        ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
        ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
        ;; lazy install any layer that support lazy installation even the layers
        ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
        ;; installation feature and you have to explicitly list a layer in the
        ;; variable `dotspacemacs-configuration-layers' to install it.
        ;; (default 'unused)
        dotspacemacs-enable-lazy-installation 'unused
        ;; If non-nil then Spacemacs will ask for confirmation before installing
        ;; a layer lazily. (default t)
        dotspacemacs-ask-for-lazy-installation t
        ;; If non-nil layers with lazy install support are lazy installed.
        ;; List of additional paths where to look for configuration layers.
        ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
        dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private")
        ;; List of configuration layers to load.
        dotspacemacs-configuration-layers
        '(
             javascript
             html
             react
             yaml
             gtags
             (version-control :variables
                 version-control-diff-tool 'diff-hl
                 version-control-global-margin 't)
             shell
             (python :variables python-enable-yapf-format-on-save t)
             ;; ----------------------------------------------------------------
             ;; Example of useful layers you may want to use right away.
             ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
             ;; <M-m f e R> (Emacs style) to install them.
             ;; ----------------------------------------------------------------
             helm
             (auto-completion :variables
                 auto-completion-return-key-behavior 'complete
                 auto-completion-tab-key-behavior 'complete
                 auto-completion-complete-with-key-sequence nil
                 auto-completion-complete-with-key-sequence-delay 2.0
                 auto-completion-private-snippets-directory nil)
             better-defaults
             emacs-lisp
             cruise
             ;; (cruise :variables
             ;;     c-c++-default-mode-for-headers 'c++-mode
             ;;     )
             ;; (c-c++ :variables
             ;;     c-c++-enable-clang-support t
             ;;     c-c++-default-mode-for-headers 'c++-mode
             ;;     )
             git
             markdown
             org
             ;;(shell :variables
             ;;    shell-default-height 30
             ;;    shell-default-position 'bottom)
             (spell-checking :variables spell-checking-enable-by-default nil)
             syntax-checking
             version-control
             )
        ;; List of additional packages that will be installed without being
        ;; wrapped in a layer. If you need some configuration for these
        ;; packages, then consider creating a layer. You can also put the
        ;; configuration in `dotspacemacs/user-config'.
        dotspacemacs-additional-packages '(smooth-scrolling ripgrep dired+)
        ;; A list of packages that cannot be updated.
        dotspacemacs-frozen-packages '()
        ;; A list of packages that will not be installed and loaded.
        dotspacemacs-excluded-packages '()
        ;; Defines the behaviour of Spacemacs when installing packages.
        ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
        ;; `used-only' installs only explicitly used packages and uninstall any
        ;; unused packages as well as their unused dependencies.
        ;; `used-but-keep-unused' installs only the used packages but won't uninstall
        ;; them if they become unused. `all' installs *all* packages supported by
        ;; Spacemacs and never uninstall them. (default is `used-only')
        dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
    "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
    ;; This setq-default sexp is an exhaustive list of all the supported
    ;; spacemacs settings.
    (setq-default
        ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
        ;; possible. Set it to nil if you have no way to use HTTPS in your
        ;; environment, otherwise it is strongly recommended to let it set to t.
        ;; This variable has no effect if Emacs is launched with the parameter
        ;; `--insecure' which forces the value of this variable to nil.
        ;; (default t)
        dotspacemacs-elpa-https t
        ;; Maximum allowed time in seconds to contact an ELPA repository.
        dotspacemacs-elpa-timeout 1
        ;; If non nil then spacemacs will check for updates at startup
        ;; when the current branch is not `develop'. Note that checking for
        ;; new versions works via git commands, thus it calls GitHub services
        ;; whenever you start Emacs. (default nil)
        dotspacemacs-check-for-update nil
        ;; If non-nil, a form that evaluates to a package directory. For example, to
        ;; use different package directories for different Emacs versions, set this
        ;; to `emacs-version'.
        dotspacemacs-elpa-subdirectory nil
        ;; One of `vim', `emacs' or `hybrid'.
        ;; `hybrid' is like `vim' except that `insert state' is replaced by the
        ;; `hybrid state' with `emacs' key bindings. The value can also be a list
        ;; with `:variables' keyword (similar to layers). Check the editing styles
        ;; section of the documentation for details on available variables.
        ;; (default 'vim)
        dotspacemacs-editing-style 'vim
        ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
        dotspacemacs-verbose-loading nil
        ;; Specify the startup banner. Default value is `official', it displays
        ;; the official spacemacs logo. An integer value is the index of text
        ;; banner, `random' chooses a random text banner in `core/banners'
        ;; directory. A string value must be a path to an image format supported
        ;; by your Emacs build.
        ;; If the value is nil then no banner is displayed. (default 'official)
        dotspacemacs-startup-banner 'official
        ;; List of items to show in startup buffer or an association list of
        ;; the form `(list-type . list-size)`. If nil then it is disabled.
        ;; Possible values for list-type are:
        ;; `recents' `bookmarks' `projects' `agenda' `todos'."
        ;; List sizes may be nil, in which case
        ;; `spacemacs-buffer-startup-lists-length' takes effect.
        dotspacemacs-startup-lists '((recents . 7)
                                        (projects . 7))
        ;; True if the home buffer should respond to resize events.
        dotspacemacs-startup-buffer-responsive t
        ;; Default major mode of the scratch buffer (default `text-mode')
        dotspacemacs-scratch-mode 'text-mode
        ;; List of themes, the first of the list is loaded when spacemacs starts.
        ;; Press <SPC> T n to cycle to the next theme in the list (works great
        ;; with 2 themes variants, one dark and one light)
        dotspacemacs-themes '(spacemacs-dark
                                 spacemacs-light)
        ;; If non nil the cursor color matches the state color in GUI Emacs.
        dotspacemacs-colorize-cursor-according-to-state t
        ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
        ;; quickly tweak the mode-line size to make separators look not too crappy.
        dotspacemacs-default-font '("Source Code Pro"
                                       :size 13
                                       :weight normal
                                       :width normal
                                       :powerline-scale 1.1)
        ;; The leader key
        dotspacemacs-leader-key "SPC"
        ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
        ;; (default "SPC")
        dotspacemacs-emacs-command-key "SPC"
        ;; The key used for Vim Ex commands (default ":")
        dotspacemacs-ex-command-key ":"
        ;; The leader key accessible in `emacs state' and `insert state'
        ;; (default "M-m")
        dotspacemacs-emacs-leader-key "M-m"
        ;; Major mode leader key is a shortcut key which is the equivalent of
        ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
        dotspacemacs-major-mode-leader-key ","
        ;; Major mode leader key accessible in `emacs state' and `insert state'.
        ;; (default "C-M-m")
        dotspacemacs-major-mode-emacs-leader-key "C-M-m"
        ;; These variables control whether separate commands are bound in the GUI to
        ;; the key pairs C-i, TAB and C-m, RET.
        ;; Setting it to a non-nil value, allows for separate commands under <C-i>
        ;; and TAB or <C-m> and RET.
        ;; In the terminal, these pairs are generally indistinguishable, so this only
        ;; works in the GUI. (default nil)
        dotspacemacs-distinguish-gui-tab t
        ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
        dotspacemacs-remap-Y-to-y$ nil
        ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
        ;; there. (default t)
        dotspacemacs-retain-visual-state-on-shift t
        ;; If non-nil, J and K move lines up and down when in visual mode.
        ;; (default nil)
        dotspacemacs-visual-line-move-text nil
        ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
        ;; (default nil)
        dotspacemacs-ex-substitute-global nil
        ;; Name of the default layout (default "Default")
        dotspacemacs-default-layout-name "Default"
        ;; If non nil the default layout name is displayed in the mode-line.
        ;; (default nil)
        dotspacemacs-display-default-layout t
        ;; If non nil then the last auto saved layouts are resume automatically upon
        ;; start. (default nil)
        dotspacemacs-auto-resume-layouts nil
        ;; Size (in MB) above which spacemacs will prompt to open the large file
        ;; literally to avoid performance issues. Opening a file literally means that
        ;; no major mode or minor modes are active. (default is 1)
        dotspacemacs-large-file-size 1
        ;; Location where to auto-save files. Possible values are `original' to
        ;; auto-save the file in-place, `cache' to auto-save the file to another
        ;; file stored in the cache directory and `nil' to disable auto-saving.
        ;; (default 'cache)
        dotspacemacs-auto-save-file-location 'cache
        ;; Maximum number of rollback slots to keep in the cache. (default 5)
        dotspacemacs-max-rollback-slots 5
        ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
        dotspacemacs-helm-resize nil
        ;; if non nil, the helm header is hidden when there is only one source.
        ;; (default nil)
        dotspacemacs-helm-no-header nil
        ;; define the position to display `helm', options are `bottom', `top',
        ;; `left', or `right'. (default 'bottom)
        dotspacemacs-helm-position 'bottom
        ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
        ;; in all non-asynchronous sources. If set to `source', preserve individual
        ;; source settings. Else, disable fuzzy matching in all sources.
        ;; (default 'always)
        dotspacemacs-helm-use-fuzzy 'always
        ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
        ;; several times cycle between the kill ring content. (default nil)
        dotspacemacs-enable-paste-transient-state nil
        ;; Which-key delay in seconds. The which-key buffer is the popup listing
        ;; the commands bound to the current keystroke sequence. (default 0.4)
        dotspacemacs-which-key-delay 0.4
        ;; Which-key frame position. Possible values are `right', `bottom' and
        ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
        ;; right; if there is insufficient space it displays it at the bottom.
        ;; (default 'bottom)
        dotspacemacs-which-key-position 'bottom
        ;; If non nil a progress bar is displayed when spacemacs is loading. This
        ;; may increase the boot time on some systems and emacs builds, set it to
        ;; nil to boost the loading time. (default t)
        dotspacemacs-loading-progress-bar t
        ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
        ;; (Emacs 24.4+ only)
        dotspacemacs-fullscreen-at-startup nil
        ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
        ;; Use to disable fullscreen animations in OSX. (default nil)
        dotspacemacs-fullscreen-use-non-native nil
        ;; If non nil the frame is maximized when Emacs starts up.
        ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
        ;; (default nil) (Emacs 24.4+ only)
        dotspacemacs-maximized-at-startup nil
        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's active or selected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-active-transparency 90
        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's inactive or deselected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-inactive-transparency 90
        ;; If non nil show the titles of transient states. (default t)
        dotspacemacs-show-transient-state-title t
        ;; If non nil show the color guide hint for transient state keys. (default t)
        dotspacemacs-show-transient-state-color-guide t
        ;; If non nil unicode symbols are displayed in the mode line. (default t)
        dotspacemacs-mode-line-unicode-symbols t
        ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
        ;; scrolling overrides the default behavior of Emacs which recenters point
        ;; when it reaches the top or bottom of the screen. (default t)
        dotspacemacs-smooth-scrolling t
        ;; Control line numbers activation.
        ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
        ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
        ;; This variable can also be set to a property list for finer control:
        ;; '(:relative nil
        ;;   :disabled-for-modes dired-mode
        ;;                       doc-view-mode
        ;;                       markdown-mode
        ;;                       org-mode
        ;;                       pdf-view-mode
        ;;                       text-mode
        ;;   :size-limit-kb 1000)
        ;; (default nil)
        dotspacemacs-line-numbers t
        ;; Code folding method. Possible values are `evil' and `origami'.
        ;; (default 'evil)
        dotspacemacs-folding-method 'evil
        ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
        ;; (default nil)
        dotspacemacs-smartparens-strict-mode nil
        ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
        ;; over any automatically added closing parenthesis, bracket, quote, etc…
        ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
        dotspacemacs-smart-closing-parenthesis nil
        ;; Select a scope to highlight delimiters. Possible values are `any',
        ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
        ;; emphasis the current one). (default 'all)
        dotspacemacs-highlight-delimiters 'all
        ;; If non nil, advise quit functions to keep server open when quitting.
        ;; (default nil)
        dotspacemacs-persistent-server nil
        ;; List of search tool executable names. Spacemacs uses the first installed
        ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
        ;; (default '("ag" "pt" "ack" "grep"))
        dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
        ;; The default package repository used if no explicit repository has been
        ;; specified with an installed package.
        ;; Not used for now. (default nil)
        dotspacemacs-default-package-repository nil
        ;; Delete whitespace while saving buffer. Possible values are `all'
        ;; to aggressively delete empty line and long sequences of whitespace,
        ;; `trailing' to delete only the whitespace at end of lines, `changed'to
        ;; delete only whitespace for changed lines or `nil' to disable cleanup.
        ;; (default nil)
        dotspacemacs-whitespace-cleanup nil
        ))

(defun dotspacemacs/user-init ()
    "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
    (setq exec-path-from-shell-check-startup-files nil)
    (defun evilmi-customize-keybinding ()
        (evil-define-key 'normal evil-matchit-mode-map
            "^" 'evilmi-jump-items))

    ;;(spaceline-toggle-projectile-root-on)

    (defun set-indent ()
        (setq-default
            evil-shift-width 4
            tab-width 4
            default-tab-width 4
            standard-indent 4
            c-basic-offset 4
            js-indent-level 2
            js2-basic-offset 2
            javascript-indent-level 2
            css-indent-offset 2
            prolog-indent-width 4
            coffee-tab-width 2
            web-mode-markup-indent-offset 2
            web-mode-css-indent-offset 2
            web-mode-code-indent-offset 2
            web-mode-markup-indent-offset 2
            web-mode-css-indent-offset 2
            web-mode-code-indent-offset 2
            web-mode-attr-indent-offset 2
            python-indent-offset 4
            python-indent 4
            ))
    (set-indent)
    (defun set-tab-width ()
        (dolist (var '(evil-shift-width
                          default-tab-width
                          tab-width
                          c-basic-offset
                          cmake-tab-width
                          cperl-indent-level
                          elixir-smie-indent-basic
                          enh-ruby-indent-level
                          erlang-indent-level
                          lisp-indent-offset
                          livescript-tab-width
                          mustache-basic-offset
                          nxml-child-indent
                          perl-indent-level
                          puppet-indent-level
                          python-indent-offset
                          ruby-indent-level
                          rust-indent-offset
                          scala-indent:step
                          sgml-basic-offset
                          sh-basic-offset))
            (set (make-local-variable var) 4))
        (dolist (var '(coffee-tab-width
                          css-indent-offset
                          javascript-indent-level
                          js-indent-level
                          js2-basic-offset
                          js3-indent-level
                          web-mode-code-indent-offset
                          web-mode-css-indent-offset
                          web-mode-markup-indent-offset))
            (set (make-local-variable var) 2))
        )
    (set-tab-width)
    (add-hook 'python-mode-hook (lambda () (set-indent)))

    ;; shortcut for creating new frame
    (defun lunaryorn-new-buffer-frame ()
        "Create a new frame with a new empty buffer."
        (interactive)
        (let ((buffer (generate-new-buffer "untitled")))
            (set-buffer-major-mode buffer)
            (display-buffer buffer '(display-buffer-pop-up-frame . nil))))


    ;;(setq my-helm-rg-command "rg --color=never --smart-case --no-heading") ;; doesn't work right now :(
    (setq my-helm-rg-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading")
    ;; (setq my-helm-rg-command "rg --vimgrep --no-heading")
    (defun my-helm-rg (&optional options)
      "Helm version of projectile-ag."
      (interactive (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
      (if (require 'helm-ag nil  'noerror)
          (if (projectile-project-p)
              (let ((helm-ag-command-option options)
                    (current-prefix-arg nil))
                (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
            (error "You're not in a project"))
        (error "helm-ag not available")))
    ;; (defun my-helm-rg (&optional options)
    ;;   "Helm version of projectile-ag."
    ;;   (interactive (if current-prefix-arg (list (helm-read-string "option: " "" 'helm-ag--extra-options-history))))
    ;;   (let* (
    ;;          (helm-ag-command-option options)
    ;;          (my-helm-rg-command (concat my-helm-rg-command " "))
    ;;          (current-prefix-arg nil))
    ;;     (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file)))))
    )

(defun dotspacemacs/user-config ()
    "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
    ;; mac keys
    (setq mac-command-modifier 'control)

    ;; editor config
    (editorconfig-mode 1)
    (add-hook 'after-change-major-mode-hook 'editorconfig-apply 'append)

    ;; auto save
    (setq auto-save-timeout 300)

    ;; tramp speedup
    (setq tramp-default-method "ssh")
    (setq tramp-auto-save-directory "/tmp/tramp-auto-save")
    ;;(setq tramp-verbose 6)

    ;; unicode can cause freeze
    (setq dotspacemacs-mode-line-unicode-symbols nil)

    ;; c-i not as tab
    ;; (define-key input-decode-map [?\C-i] [C-i])

    ;; scrolling
    (setq smooth-scroll-margin 10)
    (setq scroll-margin 10
        scroll-conservatively 100000
        scroll-preserve-screen-position 1)

    ;; underscores as words
    ;; For python
    (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
    ;; For ruby
    (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
    ;; For Javascript
    (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
    ;; For C/c++
    (add-hook 'c++-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))


    (defun toggle-yapf-on-save ()
        "toggle python enable yapf format on save"
        (interactive)
        (if python-enable-yapf-format-on-save
            (progn
                (remove-hook 'before-save-hook 'yapfify-non-interactive t)
                (setq python-enable-yapf-format-on-save nil))
            (progn
                (add-hook 'before-save-hook 'yapfify-non-interactive nil t)
                (setq python-enable-yapf-format-on-save t))))

    (defun clang-format-buffer-smart ()
        "Reformat buffer if .clang-format exists in the projectile root."
        (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
            (clang-format-buffer)))

    (defun clang-format-buffer-smart-on-save ()
        "Add auto-save hook for clang-format-buffer-smart."
        (add-hook 'before-save-hook 'clang-format-buffer-smart nil t))

    (spacemacs/add-to-hooks 'clang-format-buffer-smart-on-save
        '(c-mode-hook c++-mode-hook))

    ;; helm-mini column width
    (setq helm-buffer-max-length 40)

    ;; evil config
    (define-key evil-normal-state-map (kbd "C-i") nil)
    (define-key evil-normal-state-map (kbd "C-o") nil)
    (define-key evil-normal-state-map (kbd "C-M-y") 'toggle-yapf-on-save)
    (define-key evil-insert-state-map (kbd "C-S-v") 'yank) ;; paste with ctrl-shift-v
    (define-key evil-normal-state-map (kbd "C-S-v") 'yank) ;; paste with ctrl-shift-v
    (define-key evil-normal-state-map (kbd "C-S-P") 'projectile-switch-project)
    (define-key evil-normal-state-map (kbd "M-[") 'projectile-add-known-project)
    (define-key evil-normal-state-map (kbd "C-{") 'my-helm-rg)
    ;; (define-key evil-normal-state-map (kbd "C-}") 'helm-projectile-ag)
    (define-key evil-normal-state-map (kbd "SPC o") 'projectile-find-other-file)
    (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
    (define-key evil-normal-state-map (kbd "M-p") 'projectile-invalidate-cache)
    ;;(define-key evil-normal-state-map (kbd "C-p") 'fzf-git)
    ;;(define-key evil-normal-state-map (kbd "M-p") 'fzf-git-reindex)
    (define-key evil-normal-state-map (kbd "C-'") 'helm-recentf)
    (define-key evil-normal-state-map (kbd "C-;") 'helm-mini)
    (define-key evil-normal-state-map (kbd "<C-i>") 'eyebrowse-prev-window-config)
    (define-key evil-normal-state-map (kbd "C-o") 'eyebrowse-next-window-config)
    (define-key evil-normal-state-map (kbd "C-S-i") 'persp-prev)
    (define-key evil-normal-state-map (kbd "C-S-o") 'persp-next)
    (define-key evil-insert-state-map (kbd "C-S-i") 'persp-prev)
    (define-key evil-insert-state-map (kbd "C-S-o") 'persp-next)
    (define-key evil-normal-state-map (kbd "C-S-T") 'eyebrowse-create-window-config)
    (define-key evil-normal-state-map (kbd "C-q") 'eyebrowse-close-window-config)
    ;;(define-key evil-normal-state-map (kbd "%") 'evilmi--simple-jump)
    (define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
    (define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
    (define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
    (define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
    (define-key evil-normal-state-map (kbd "C-f") 'helm-find-files)
    (define-key evil-motion-state-map (kbd "C-f") 'helm-find-files)
    (define-key evil-normal-state-map (kbd "C-.") 'python-indent-shift-right)
    (define-key evil-normal-state-map (kbd "C-<") 'python-indent-shift-left)
    (define-key evil-insert-state-map (kbd "C-.") 'python-indent-shift-right)
    (define-key evil-insert-state-map (kbd "C-<") 'python-indent-shift-left)
    (define-key evil-insert-state-map (kbd "C-`") 'other-frame)
    (define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
    (define-key evil-normal-state-map (kbd "C-S-z") 'evil-window-vsplit)
    (define-key evil-visual-state-map (kbd "C-S-c") 'ns-copy-including-secondary)
    (define-key evil-normal-state-map (kbd "C-S-b") 'kill-this-buffer)
    (define-key evil-visual-state-map (kbd "C-M-\\") 'clang-format-region)
    (define-key evil-normal-state-map (kbd "C-M-\\") 'clang-format-buffer)
    (define-key evil-normal-state-map (kbd "SPC f n") 'lunaryorn-new-buffer-frame)
    (define-key evil-normal-state-map (kbd "C-t") 'helm-gtags-pop-stack)
    (define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-dwim)
    (define-key evil-normal-state-map (kbd "C-}") 'helm-gtags-dwim-other-window)

    ;; for some reason have to repeat these... :(
    (global-set-key (kbd "C-M-y") 'toggle-yapf-on-save)
    (global-set-key (kbd "C-S-v") 'yank) ;; paste with ctrl-shift-v
    (global-set-key (kbd "C-S-P") 'projectile-switch-project)
    (global-set-key (kbd "M-[") 'projectile-add-known-project)
    (global-set-key (kbd "C-{") 'helm-projectile-ag)
    (global-set-key (kbd "C-S-I") 'projectile-find-other-file)
    (global-set-key (kbd "C-S-O") 'projectile-find-other-file)
    (global-set-key (kbd "C-p") 'projectile-find-file)
    (global-set-key (kbd "M-p") 'projectile-invalidate-cache)
    ;;(global-set-key (kbd "C-p") 'fzf-git)
    ;;(global-set-key (kbd "M-p") 'fzf-git-reindex)
    (global-set-key (kbd "C-'") 'helm-recentf)
    (global-set-key (kbd "C-;") 'helm-mini)
    (global-set-key (kbd "<C-i>") 'eyebrowse-prev-window-config)
    (global-set-key (kbd "C-o") 'eyebrowse-next-window-config)
    (global-set-key (kbd "C-S-i") 'persp-prev)
    (global-set-key (kbd "C-S-o") 'persp-next)
    (global-set-key (kbd "C-S-T") 'eyebrowse-create-window-config)
    (global-set-key (kbd "C-q") 'eyebrowse-close-window-config)
    ;;(global-set-key (kbd "%") 'evilmi--simple-jump)
    (global-set-key (kbd "C-k") 'windmove-up)
    (global-set-key (kbd "C-j") 'windmove-down)
    (global-set-key (kbd "C-h") 'windmove-left)
    (global-set-key (kbd "C-l") 'windmove-right)
    (global-set-key (kbd "C-f") 'helm-find-files)
    (global-set-key (kbd "C-.") 'python-indent-shift-right)
    (global-set-key (kbd "C-<") 'python-indent-shift-left)
    (global-set-key (kbd "C-`") 'other-frame)
    (global-set-key (kbd "C-n") 'neotree-toggle)
    (global-set-key (kbd "C-S-z") 'evil-window-vsplit)
    (global-set-key (kbd "C-S-b") 'kill-this-buffer)
    (global-set-key (kbd "C-t") 'helm-gtags-pop-stack)
    (global-set-key (kbd "C-]") 'helm-gtags-dwim)
    (global-set-key (kbd "C-}") 'helm-gtags-dwim-other-window)

    (with-eval-after-load 'org
      (evil-define-key 'evilified org-mode-map (kbd "C-k") 'windmove-up)
      (evil-define-key 'evilified org-mode-map (kbd "C-j") 'windmove-down)
      (evil-define-key 'evilified org-mode-map (kbd "C-h") 'windmove-left)
      (evil-define-key 'evilified org-mode-map (kbd "C-l") 'windmove-right))

    (load-library "find-lisp")

    (with-eval-after-load 'neotree
      (evil-define-key 'evilified neotree-mode-map (kbd "C-n") 'neotree-toggle))

    ;; comments
    (define-key evil-normal-state-map (kbd "C-/") 'evilnc-comment-operator)
    (define-key evil-visual-state-map (kbd "C-/") 'evilnc-comment-operator)

    (define-key evil-normal-state-map (kbd "C-S-/") 'indent-region)
    (define-key evil-visual-state-map (kbd "C-S-/") 'indent-region)


    ;; helm config
    (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))
    (with-eval-after-load 'helm-buffers
        ;(add-to-list 'helm-boring-buffer-regexp-list "\*anaconda-mode\*")
        (add-to-list 'helm-boring-buffer-regexp-list "\*scratch\*")
        (add-to-list 'helm-boring-buffer-regexp-list "\*Messages\*")
        (add-to-list 'helm-boring-buffer-regexp-list "\*spacemacs\*")
        (add-to-list 'helm-boring-buffer-regexp-list "GNU Emacs")
        (setq helm-buffer-skip-remote-checking t))

    ;;(defalias 'e 'helm-find-files)

    ;; autocomplete
    (add-hook 'company-mode-hook
        (lambda()
            (define-key evil-insert-state-map (kbd "<tab>") 'company-complete)
            (if (eq system-type 'darwin) (setq company-clang-executable '/usr/bin/clang))
            (if (eq system-type 'gnu/linux) (setq company-clang-executable '/usr/lib/ccache/clang-3.8))
            ))
    (setq company-idle-delay nil)

    ;; Info mode
    (define-key Info-mode-map "g" nil)
    (define-key Info-mode-map "e" nil)
    (define-key Info-mode-map "n" nil)
    (define-key Info-mode-map "C-j" nil)
    (define-key Info-mode-map "C-k" nil)
    (define-key Info-mode-map (kbd "<C-i>") 'eyebrowse-prev-window-config)
    (define-key Info-mode-map (kbd "C-o") 'eyebrowse-next-window-config)
    (define-key Info-mode-map (kbd "<C-h>") nil)
    (define-key Info-mode-map (kbd "<C-l>") nil)
    (define-key Info-mode-map "[" 'Info-prev)
    (define-key Info-mode-map "]" 'Info-next)
    (define-key Info-mode-map (kbd "C-k") 'windmove-up)
    (define-key Info-mode-map (kbd "C-j") 'windmove-down)
    (define-key Info-mode-map (kbd "C-h") 'windmove-left)
    (define-key Info-mode-map (kbd "C-l") 'windmove-right)
    ;; get rid of <tab> being eyebrowse-next-window-config
    (with-eval-after-load 'eyebrowse
        (global-set-key (kbd "TAB") nil)
        (define-key evil-normal-state-map (kbd "TAB") nil))

    ;; org mode
    (with-eval-after-load 'org
        (setq org-todo-keywords
            '((sequence "TODO" "STRT" "|" "DONE")))
        (setq org-startup-indented t)
        (setq org-hide-emphasis-markers t)
        (org-indent-mode t)
        ;; laptop
        (if (eq system-type 'darwin) (setq org-directory "/home/bpierce/shared/org"))
        (if (eq system-type 'gnu/linux) (setq org-directory "~/shared/org"))

        (setq org-agenda-window-setup 'current-window)
        (setq org-default-notes-file (concat org-directory "/capture.org")))

    (with-eval-after-load 'org-agenda
      (evil-define-key 'evilified org-agenda-mode-map (kbd "C-k") 'windmove-up)
      (evil-define-key 'evilified org-agenda-mode-map (kbd "C-j") 'windmove-down)
      (evil-define-key 'evilified org-agenda-mode-map (kbd "C-h") 'windmove-left)
      (evil-define-key 'evilified org-agenda-mode-map (kbd "C-l") 'windmove-right)
      (if (eq system-type 'darwin) (setq org-agenda-files (find-lisp-find-files "/home/bpierce/shared/org" "\.org$")))
      (if (eq system-type 'gnu/linux) (setq org-agenda-files (find-lisp-find-files "~/shared/org" "\.org$"))))

    (with-eval-after-load 'evil-org
        ;; zoom/unzoom
        (define-key evil-org-mode-map (kbd "<normal-state> ]") 'org-narrow-to-subtree)
        (define-key evil-org-mode-map (kbd "<normal-state> [") 'widen)
        ;; folding
        (define-key evil-org-mode-map (kbd "<normal-state> zv") 'org-cycle)
        ;; promote/demote
        ;;(define-key org-mode-map (kbd "<tab>") nil)
        ;;(define-key org-mode-map (kbd "<S-tab>") nil)
        ;;(define-key evil-org-mode-map (kbd "C-'") nil) ;; ??
        (define-key evil-org-mode-map (kbd "<normal-state> C-S-k") 'org-move-subtree-up)
        (define-key evil-org-mode-map (kbd "<normal-state> C-S-j") 'org-move-subtree-down)
        (define-key evil-org-mode-map (kbd "<normal-state> C-S-l") 'org-demote-subtree)
        (define-key evil-org-mode-map (kbd "<normal-state> C-S-h") 'org-promote-subtree)
        (define-key evil-org-mode-map (kbd "<insert-state> C-S-k") 'org-move-subtree-up)
        (define-key evil-org-mode-map (kbd "<insert-state> C-S-j") 'org-move-subtree-down)
        (define-key evil-org-mode-map (kbd "<insert-state> C-S-l") 'org-demote-subtree)
        (define-key evil-org-mode-map (kbd "<insert-state> C-S-h") 'org-promote-subtree)
        ;; todo
        (define-key evil-org-mode-map (kbd "<normal-state> t") 'org-todo)
        (define-key evil-org-mode-map (kbd "<normal-state> T") 'org-shiftleft)
        ;; fix tab
        (define-key evil-org-mode-map (kbd "<normal-state> C-y") 'yank))

    (if (eq system-type 'darwin) (setq helm-ag-base-command "ag --nocolor --nogroup --mmap"))

    ;; projectile
    ; (setq projectile-known-projects-file "~/.cache/projectile-bookmarks.eld")
    ;; (setq projectile-track-known-projects-automatically t)
    (setq projectile-enable-caching t)
    (setq projectile-file-exists-local-cache-expire (* 5 60))
    ;;(projectile-global-mode)

    ;; get help back
    (global-set-key (kbd "C-c h") help-map)

    ;; no history
    (setq undo-tree-auto-save-history nil)

    (global-evil-matchit-mode t)

    (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

    ;; changing to hpp
    ;;(add-hook 'c++-mode-hook
    ;;   '(lambda ()
    ;;       (define-key c-mode-base-map (kbd "C-S-o") 'cff-find-other-file)))
    ;;(add-hook 'c-mode-hook
    ;;   '(lambda ()
    ;;       (define-key c-mode-base-map (kbd "C-S-o") 'cff-find-other-file)))

    )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(package-selected-packages
         (quote
             (xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-irony company-irony irony cmake-mode xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
