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


(weblorg-site
 :template-vars '(("site_name" . "RAMajd's daily notes")
                  ("site_owner" . "Reza Alizadeh Majd <r.a.majd@gmail.com>")
                  ("site_description" . "Notes about challenges I face during my day to day work")))

(weblorg-route
 :name "posts"
 :input-pattern "posts/*.org"
 :template "post.html"
 :output "output/posts/{{ slug }}.html"
 :url "/posts/{{ slug }}.html")


(weblorg-route
 :name "index"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "index.html"
 :output "output/index.html"
 :url "/")

(weblorg-route
 :name "archive"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "archive.html"
 :output "output/archive.html"
 :url "/archive.html")

(weblorg-route
 :name "pages"
 :input-pattern "pages/*.org"
 :template "page.html"
 :output "output/{{ slug }}.html"
 :url "/{{ slug }}.html")

(weblorg-copy-static
 :output "output/static/{{ file }}"
 :url "/static/{{ file }}")


(weblorg-export)
