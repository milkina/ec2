$('select[multiple]').multiselect({
               columns: 2,
               placeholder: 'Select categories',
               selectAll : true,
               selectGroup:true,
               search:true,
               selectedText: '# selected',
               enableFormValidation: true
            });
$('.ms-selectall').text(function () {
    return $(this).hasClass('global') ? 'Select all' : 'Select module';
});