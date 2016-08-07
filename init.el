;; 包管理
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
  

(require 'cl)

;; add whatever packages you want here
(defvar fred/packages '(
			company
			monokai-theme
			hungry-delete
			
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


(require 'hungry-delete)
(global-hungry-delete-mode)


(load-theme 'monokai t)

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭滚动条
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode t)

;; 去掉启动时的欢迎画面
(setq inhibit-splash-screen t)

;; 定义emacs配置文件，以及打开快捷键
(defun open-my-init-file()
(interactive)
(find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 代码补全
(global-company-mode t)

;; 设置光标为竖线
(setq-default cursor-type 'bar)

;; 禁止备份文件，后缀为～
(setq make-backup-files nil)

;; 在org文件中代码高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 绑定最近打开文件列表快捷键
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 选中单词后输入直接替换
(delete-selection-mode t)

;; 启动时的时候全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 括号高亮
(add-hook 'emacs-list-mode-hook 'show-paren-mode)

;; 当前行高亮
(global-hl-line-mode t)

