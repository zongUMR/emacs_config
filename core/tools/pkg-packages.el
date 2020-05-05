;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Automatically compile Emacs Lisp libraries
;;	https://github.com/emacscollective/auto-compile
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;; Code:
(use-package auto-compile
  :init (setq load-prefer-newer t)
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Disable the mouse in Emacs
;;	https://github.com/purcell/disable-mouse
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package disable-mouse
  :config (global-disable-mouse-mode))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Powerful undo system for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show key bind for currently entered incomplete command
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package which-key
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-bottom)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show recent file
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
	  recentf-max-menu-items 15)
    (recentf-mode)
    ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show line number of current coding window
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package linum
  :init
  (progn
    (global-linum-mode t)
    (setq linum-format "%4d  ")
    (set-face-foreground 'linum "light green")
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Sidebar for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package all-the-icons)
(use-package neotree
  :config
  (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
    (setq neo-window-fixed-size nil)
    ;; (setq-default neo-show-hidden-files nil)
    (global-set-key (kbd "C-x t") 'neotree-toggle)
    (global-set-key (kbd "C-x C-t") 'neotree-dir)))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Git tool for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package magit)

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Emacs framework for incremental completions and
;;	narrowing selections
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package helm-swoop)
(use-package helm-gtags)
(use-package helm
  :diminish helm-mode
  :init
  (progn
    ;; (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
	  helm-input-idle-delay 0.01  ; this actually updates things
					; reeeelatively quickly.
	  helm-yas-display-key-on-candidate t
	  helm-quick-update t
	  helm-M-x-requires-pattern nil
	  helm-ff-skip-boring-files t)
    (helm-mode))
  :config
  (progn
    )
  :bind  (("C-c s" . helm-swoop)
	  ("C-x C-f" . helm-find-files)
	  ("C-x b" . helm-buffers-list)
	  ("M-y" . helm-show-kill-ring)
	  ("M-x" . helm-M-x)))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Auto complete when coding
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Flycheck
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package flycheck
  :config
  (progn
    (use-package flycheck-pycheckers)
    (use-package flycheck-yamllint)

    (add-hook 'after-init-hook #'global-flycheck-mode)
    (with-eval-after-load 'flycheck
      (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
    )
  )


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	YAML mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package yaml-mode
  :commands yaml-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("yaml" . yaml-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Smart tab
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package smart-tab
  :config
  (progn
    (defun pkg-enable-smart-tab ()
      (smart-tab-mode))
    (add-hook 'prog-mode-hook 'pkg-enable-smart-tab)
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	ace jump mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package ace-jump-mode
  :commands ace-jump-mode
  :bind (
	 ("C-c l" . ace-jump-line-mode)
	 ("C-c w" . ace-jump-word-mode)
	 ("C-c c" . ace-jump-char-mode)
	 )
  )

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	find file in project
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;     ace-window
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package ace-window
 :bind ("M-o" . ace-window)
 )

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;     smartparens
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package smartparens
  :ensure t
  :custom (smartparens-global-mode t))

(provide 'pkg-packages)
