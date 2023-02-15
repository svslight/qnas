# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom", under: "custom"

# pin "jquery", to: "jquery.min.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true

pin "@rails/actioncable", to: "actioncable.esm.js"      
pin "@rails/activestorage", to: "activestorage.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin_all_from "app/javascript/templates", under: "templates"

pin "@nathanvda/cocoon", to: "https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js"
