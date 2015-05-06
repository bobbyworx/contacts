var select2Gem = function() {
  $("#contact_group_ids").select2({ width: 'resolve', placeholder: "Search group name", allowClear: true}
  );
};

$(document).ready(select2Gem);
$(document).on('page:load', select2Gem);
