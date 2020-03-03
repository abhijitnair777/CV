// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("./nested-forms/addFields");
require("./nested-forms/removeFields");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

class addFields {
    
  constructor(){
      this.links = document.querySelectorAll('.add_fields');
      this.iterateLinks();
    }

    iterateLinks() {
        if(this.links.length === 0) return;
          this.links.forEach((link)=>{
          link.addEventListener('click', (e) => {
          this.handleClick(link, e);
            });
        });
    }

    handleClick(link, e) {
        if (!link || !e) return;
        // Prevent the browser from following the URL.
        e.preventDefault();
        // Save a unique timestamp to ensure the key of the associated array is unique.
        let time = new Date().getTime();
        // Save the data id attribute into a variable. This corresponds to `new_object.object_id`.
        let linkId = link.dataset.id;
        // Create a new regular expression needed to find any instance of the `new_object.object_id` used in the fields data attribute if there's a value in `linkId`.
        let regexp = linkId ? new RegExp(linkId, 'g') : null ;
        // Replace all instances of the `new_object.object_id` with `time`, and save markup into a variable if there's a value in `regexp`.
        let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null ;
        newFields ? link.insertAdjacentHTML('beforebegin', newFields) : null ;
    }

}
 
window.addEventListener('turbolinks:load', () => new addFields() );


class removeFields {
    
    // This executes when the function is instantiated.
    constructor(){
        this.links = document.querySelectorAll('.remove_fields');
        this.iterateLinks();
    }

    iterateLinks() {
        // If there are no links on the page, stop the function from executing.
        if(this.links.length === 0) return;
        // Loop over each link on the page.
        this.links.forEach((link)=>{
            link.addEventListener('click', (e) => {
                this.handleClick(link, e);
            });
        });
    }

    handleClick(link, e) {
        // Stop the function from executing if a link or event were not passed into the function. 
        if (!link || !e) return;
        // Prevent the browser from following the URL.
        e.preventDefault();
        // Find the parent wrapper for the set of nested fields. 
        let fieldParent = link.closest('.nested-fields');
        // If there is a parent wrapper, find the hidden delete field.
        let deleteField = fieldParent ? fieldParent.querySelector('input[type="hidden"]') : null
        // If there is a delete field, update the value to `1` and hide the corresponding nested fields.
        if (deleteField) {
            deleteField.value = 1;
            fieldParent.style.display = 'none';
        }
    }

}
 
window.addEventListener('turbolinks:load', () => new removeFields() );