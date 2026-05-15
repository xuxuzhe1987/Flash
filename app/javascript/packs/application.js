// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.$ = window.jQuery = require("jquery")
require("popper.js")
window.bootstrap = require("bootstrap")


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// Initialize dropdowns on page load
$(document).on('turbolinks:load', function() {
  // Ensure jQuery dropdown is properly initialized
  if (typeof $.fn.dropdown !== 'undefined') {
    $('[data-toggle="dropdown"]').dropdown();
  }
});

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initFlashcard } from '../components/flashcard_swiping';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log('helllooo')
  if (location.pathname.includes("user_decks/"))initFlashcard();
});


