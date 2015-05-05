$('.contacts-expandable').hide();
    $(".expand_group_contacts_list").on("click", function(event){
        $('.expandable').hide();
      event.preventDefault();
      $(".group-contacts").find('.contacts-expandable').slideToggle(400);
    });
