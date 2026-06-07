/* Category multi-select + quantity stepper (vanilla, no jQuery).
   Replaces jquery.multi-select.js + selectCategories(Ru).js + general.js (+/- part). */
(function () {
  var isRu = (document.documentElement.lang || '').toLowerCase().indexOf('ru') === 0;
  var i18n = isRu
    ? { placeholder: 'Выбрать категории', noResults: 'Ничего не найдено',
        selectAll: 'Выбрать все', selectGroup: 'Выбрать модуль' }
    : { placeholder: 'Select categories', noResults: 'No results',
        selectAll: 'Select all', selectGroup: 'Select module' };

  function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;' }[c];
    });
  }

  function initSelects() {
    if (typeof TomSelect === 'undefined') return;
    var selects = document.querySelectorAll('select[multiple]');
    selects.forEach(function (sel) {
      if (sel.tomselect) return;
      var ts = new TomSelect(sel, {
        plugins: ['checkbox_options', 'remove_button', 'clear_button'],
        placeholder: i18n.placeholder,
        hidePlaceholder: false,
        maxOptions: null,
        allowEmptyOption: false,
        persist: false,
        dropdownParent: 'body',
        render: {
          no_results: function () {
            return '<div class="no-results">' + i18n.noResults + '</div>';
          },
          optgroup_header: function (data, esc) {
            var label = esc(data[this.settings.optgroupLabelField]);
            var value = data[this.settings.optgroupValueField];
            return '<div class="optgroup-header">' +
                     '<span class="optgroup-label">' + label + '</span>' +
                     '<a class="ts-select-group" data-group="' + escapeHtml(value) + '">' +
                       escapeHtml(i18n.selectGroup) +
                     '</a>' +
                   '</div>';
          }
        }
      });

      /* Inject "Select all" header at the top of the dropdown. */
      var header = document.createElement('div');
      header.className = 'ts-dropdown-header';
      header.innerHTML = '<a class="ts-select-all">' + escapeHtml(i18n.selectAll) + '</a>';
      ts.dropdown.insertBefore(header, ts.dropdown.firstChild);

      /* Use mousedown so we run before TomSelect's own selection handler. */
      ts.dropdown.addEventListener('mousedown', function (e) {
        var allBtn = e.target.closest('.ts-select-all');
        var grpBtn = e.target.closest('.ts-select-group');
        if (!allBtn && !grpBtn) return;
        e.preventDefault();
        e.stopPropagation();
        var allValues = Object.keys(ts.options);
        var toAdd;
        if (allBtn) {
          toAdd = allValues;
        } else {
          var group = grpBtn.getAttribute('data-group');
          toAdd = allValues.filter(function (v) {
            var opt = ts.options[v];
            return opt && String(opt[ts.settings.optgroupField]) === group;
          });
        }
        toAdd.forEach(function (v) { ts.addItem(v, true); });
        ts.refreshOptions(false);
      }, true);
    });
  }

  function initQtyButtons() {
    document.querySelectorAll('.test-qty').forEach(function (group) {
      var input = group.querySelector('input[type="number"]');
      if (!input) return;
      var min = parseInt(input.min, 10);
      var max = parseInt(input.max, 10);
      group.querySelectorAll('.test-qty-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
          var current = parseInt(input.value, 10) || 0;
          var next = btn.classList.contains('inc') ? current + 1 : current - 1;
          if (!isNaN(min) && next < min) next = min;
          if (!isNaN(max) && next > max) next = max;
          input.value = next;
          input.dispatchEvent(new Event('change', { bubbles: true }));
        });
      });
    });
  }

  function initFormValidation() {
    /* Replicates the previous behaviour: block submit when no category picked. */
    document.querySelectorAll('form.test-form').forEach(function (form) {
      form.addEventListener('submit', function (e) {
        var select = form.querySelector('select[multiple][aria-required="true"]');
        if (!select) return;
        var errorId = select.getAttribute('aria-describedby');
        var errorEl = errorId ? document.getElementById(errorId) : null;
        if (select.selectedOptions.length === 0) {
          e.preventDefault();
          select.setAttribute('aria-invalid', 'true');
          if (errorEl) errorEl.hidden = false;
          if (select.tomselect) select.tomselect.focus();
        } else {
          select.setAttribute('aria-invalid', 'false');
          if (errorEl) errorEl.hidden = true;
        }
      });
    });
  }

  function init() {
    initSelects();
    initQtyButtons();
    initFormValidation();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
