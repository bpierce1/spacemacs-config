(setq fzf-packages
      '(
        fzf
        ))

(defun fzf/init-fzf ()
  (use-package fzf
    :init
    (global-set-key (kbd "C-p") 'fzf)
    (global-set-key (kbd "M-p") 'fzf-reindex)
    (setq fzf/window-height 30
          fzf/executable "fzf_with_caching.sh"
          fzf/args "noreindex --no-hscroll --margin=0,1,1,0 -x --print-query"
          fzf/args-reindex "reindex --no-hscroll --margin=0,1,1,0 -x --print-query")
    :config
    ()))

;;(defun fzf/post-init-fzf ())
