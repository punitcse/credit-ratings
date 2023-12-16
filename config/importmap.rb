# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'bootstrap', to: 'https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js'
pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js'
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@7.1.2/app/assets/javascripts/rails-ujs.esm.js'
pin '@nathanvda/cocoon', to: 'https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js'
pin 'jquery', to: 'https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js'
