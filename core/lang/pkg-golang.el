;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Go IDE Setup
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(use-package go-eldoc
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    ))

(use-package go-rename
  :ensure t)

(use-package flycheck-gometalinter :defer t)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'pkg-golang)
