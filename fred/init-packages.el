;; 包管理
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )  

(require 'cl)

;; add whatever packages you want here
(defvar fred/packages '(
			company
			monokai-theme
			hungry-delete
			smex
			swiper
			counsel
			smartparens
			web-mode
			exec-path-from-shell
			popwin
			) "Default packages")

(setq package-selected-packages fred/packages)

(defun fred/packages-installed-p ()
  (loop for pkg in fred/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (fred/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg fred/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 代码补全
(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)


(provide 'init-packages)
