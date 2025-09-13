$ ->
  $('.orderable-list').sortable
    handle: '.reorder-handle'
    ghostClass: 'ghost'

    onEnd: (event) ->
      record_id = event.item.getAttribute('data-record-id')
      reorder_url = event.from.getAttribute('data-reorder-url')

      $.post reorder_url,
        record_id: record_id
        position: event.newIndex
      .error ->
        alert 'There was a problem with reordering. Refresh and try again.'
