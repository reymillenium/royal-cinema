// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


// Default:
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Boostrap 4:
import 'bootstrap'

// Enables the tooltips & popovers:
document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
});

// FontAwesome scripting:
import "@fortawesome/fontawesome-free/js/all";

import './easing'
import './move-top'
// import './responsiveslides'
// import './SmoothScroll.min'
import './SmoothScroll'

// Custom js files:
// require("easing")
// require("move-top")
require("responsiveslides")
// require("SmoothScroll.min")

import './jquery.cm-overlay'
import './jquery.cntl'
// import './jquery.mobile.custom.min'
import './jquery.mobile-1.5.0-rc1.min'
import './jquery.tools.min'
import './skill.bars.jquery'




// require("jquery.cm-overlay")
// require("jquery.cntl")
// require("jquery.mobile.custom.min")
// require("jquery.tools.min")
// require("skill.bars.jquery")





// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
