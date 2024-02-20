echo "running pre_prod.sh"

cat <<EOF > site.el

(setq site
      (weblorg-site
       :base-url "https://ramajd.github.io"
       :template-vars '(("site_name" . "RAMajd's daily notes")
                        ("site_owner" . "Reza Alizadeh Majd <r.a.majd@gmail.com>")
                        ("site_description" . "Notes about challenges I face during my day to day work"))))

(provide 'site)


EOF

echo "finished pre_prod.sh"
