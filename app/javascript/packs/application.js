// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("packs/bootstrap.js")
require("packs/custom.js")

require("packs/rails.validations.js")
require("packs/rails.validations.simple_form.bootstrap4.js")
require("packs/rails.validations.simple_form.js")

//require("lightbox.js")
//require("bootstrap-dropdown.js")

require("packs/baguetteBox.js")

require("packs/stripe_v3.js")
require("packs/cocoon.js")


require("trix")
require("@rails/actiontext")

import $ from 'jquery';
global.$ = $;
global.jQuery = $;

import toastr from 'toastr';

toastr.options = {
    "closeButton": true
    // .... add options here ...
};

global.toastr = toastr;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true);
const imagePath = (name) => images(name, true);

document.addEventListner("turbolinks:load", () => {
  $('[data=toggle-"tooltip"]').tooltip()
  $('[data=toggle-"popover"]').popover()
})

import "../stylesheets/application";
