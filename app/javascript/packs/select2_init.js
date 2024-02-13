$(document).on('turbo:load', function() {
    console.log('turbo:load event triggered, initializing Select2');
    $('.select2').select2({
          placeholder: 'Select an ingredient',
          allowClear: true
    });
});

