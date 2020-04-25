;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Haskell IDE Setup
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(use-package lsp-haskell
 :config
 (setq lsp-haskell-process-path-hie "hie-wrapper")
 )

(provide 'pkg-haskell)
