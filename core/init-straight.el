
;;; -*- lexical-binding: t -*-

;; [straight] Package manager config (should put setq before installation for `straight`)
(setq straight-check-for-modifications nil                   ; Skip modification checks
      straight-vc-git-default-clone-depth '(1 single-branch) ; Shallow clone, single branch
      comp-deferred-compilation-deny-list ()                 ; Allow all native compilations
      warning-suppress-log-types '((comp))                   ; Suppress native compilation warnings
      straight-disable-native-compile (not (and (fboundp 'native-comp-available-p)
                                                (native-comp-available-p))))

;; Bootstrap Straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Integrate Straight.el with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; [use-package] config
(setq use-package-always-demand (daemonp)           ; Load immediately if daemon
      use-package-always-defer (not (daemonp))      ; Defer loading if not daemon
      use-package-expand-minimally t                ; Minimize generated code
      use-package-enable-imenu-support t)           ; Enable Imenu support
