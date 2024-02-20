;; (add-to-list 'load-path "~/.emacs.d/straight/repos/weblorg")
;; (add-to-list 'load-path "~/.emacs.d/straight/repos/emacs-htmlize")
;; (add-to-list 'load-path "~/.emacs.d/straight/repos/templatel")


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install and configure dependencies
(use-package weblorg :ensure t)
(use-package htmlize
  :ensure t
  :config
  (setq org-html-htmlize-output-type 'css))


(require 'weblorg)

(require 'htmlize)
(setq org-html-htmlize-output-type 'css)

(add-to-list 'load-path "./")
(require 'site)

(weblorg-route
 :site site
 :name "posts"
 :input-pattern "posts/*.org"
 :template "post.html"
 :output "output/posts/{{ slug }}.html"
 :url "/posts/{{ slug }}.html")


(weblorg-route
 :site site
 :name "index"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "index.html"
 :output "output/index.html"
 :url "/")

(weblorg-route
 :site site
 :name "archive"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "archive.html"
 :output "output/archive.html"
 :url "/archive.html")

(weblorg-route
 :site site
 :name "pages"
 :input-pattern "pages/*.org"
 :template "page.html"
 :output "output/{{ slug }}.html"
 :url "/{{ slug }}.html")

(weblorg-copy-static
 :site site
 :output "output/static/{{ file }}"
 :url "/static/{{ file }}")


(weblorg-export)
