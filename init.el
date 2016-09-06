
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/fred")

(require 'init-packages)



(setq ring-bell-function 'ignore)


(global-auto-revert-mode t)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)









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



;; 设置光标为竖线
(setq-default cursor-type 'bar)

;; 禁止备份文件，后缀为～
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 在org文件中代码高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 绑定最近打开文件列表快捷键
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(global-set-key (kbd "C-h C-f") 'find-function)

;; 选中单词后输入直接替换
(delete-selection-mode t)

;; 启动时的时候全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 括号高亮
(add-hook 'emacs-list-mode-hook 'show-paren-mode)

;; 当前行高亮
(global-hl-line-mode t)



(defun indent-buffer()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))


(global-set-key (kbd "<f7>") 'indent-buffer)






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.02))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



