function addWYSIWG() {
      tinymce.init({
        selector: 'textarea',
        plugins: 'code codesample',
        toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | codesample | code",
        browser_spellcheck: true
      });
 }
 addWYSIWG();