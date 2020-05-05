;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Python IDE Setup
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package lsp-python-ms
  :commands lsp-python-ms
  :defer t
  :ensure t
  :init
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp-deferred))))  ; or lsp-deferred


(use-package yapfify
  :commands (yapf-mode)
  :defer t
  :config
  (defun format-python()
    (when (eq major-mode 'python-mode)
      (yapfify-buffer)))
  
  (add-hook 'python-mode-hook 'yapf-mode)
  (add-hook 'before-save-hook #'format-python)
  )

(use-package conda
  :ensure t
  :init
  
  (setenv "WORKON_HOME" "~/miniconda3/envs")

  (custom-set-variables
    '(conda-anaconda-home "~/miniconda3"))
  (setq conda-env-home-directory (expand-file-name "~/miniconda3/envs"))
)

(provide 'pkg-python)
