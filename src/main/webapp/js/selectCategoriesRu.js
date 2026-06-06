$('select[multiple]').multiselect({
                columns: 2,
                placeholder: 'Выбрать категории',
                selectAll: true,
                selectGroup:true,
                search:true,
                selectedText: 'Выбрано: #',
                enableFormValidation: true
            });
$('.ms-selectall').text(function () {
    return $(this).hasClass('global') ? 'Выбрать все' : 'Выбрать модуль';
});