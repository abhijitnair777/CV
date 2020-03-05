
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
