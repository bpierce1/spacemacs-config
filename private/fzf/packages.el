(setq fzf-packages
      '(
        (fzf :location local)
        ))

(defun fzf/init-fzf ()
  (use-package fzf
    :init
    (setq fzf/window-height 30
          fzf/executable "fzf_with_caching.sh"
          fzf/args "noreindex --no-hscroll --margin=0,1,1,0 -x --print-query"
          fzf/args-reindex "reindex --no-hscroll --margin=0,1,1,0 -x --print-query")
    :config
    ()))

;;(defun fzf/post-init-fzf ())
