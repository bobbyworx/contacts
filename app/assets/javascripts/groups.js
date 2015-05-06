// $('.contacts-expandable').hide();
//     $(".expand_group_contacts_list").on("click", function(event){
//         $('.expandable').hide();
//       event.preventDefault();
//       $(".group-contacts").find('.contacts-expandable').slideToggle(400);
//     });

var select2Gem = function() {
  $("#group_contact_ids").select2({ width: 'resolve', placeholder: "Search contact name", allowClear: true}
  );
};

$(document).ready(select2Gem);
$(document).on('page:load', select2Gem);
