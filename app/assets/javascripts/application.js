// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require cocoon
//= require_tree .

$(document).on('turbolinks:load', function(){
  // datepicker
  $(function () {
    $('.timepicker').datetimepicker({
      format: 'LT'
    });

    $('.datepicker').datetimepicker({
      format: 'L',
      format: 'YYYY-MM-DD'
    });

    $('.yearpicker').datetimepicker({
      format: 'L',
      viewMode: 'years',
      format: 'YYYY'
    });


    $('#marketing-details-header').on('click', function() {
      $('.marketing-details').toggleClass('hidden');
    });

    //counter for added fields for cocoon
    // $('.parts').on('cocoon:after-insert', function(e, inserted_item) {
    //   var num = $('.nested-fields').length
    //   console.log(num);
    //   $("<h4 class='text-center'>Part " + num + "</h4>").prependTo(inserted_item);
    // });

    // autocomplete
    $('#product_production_company_name').autocomplete({
      source: $('#product_production_company_name').data('autocomplete-source')
    });

    $('#episode_production_company_name').autocomplete({
      source: $('#episode_production_company_name').data('autocomplete-source')
    });

    $('.guest-field').autocomplete({
      source: $('.guest-field').data('autocomplete-source')
    });

    $('.presenter-field').autocomplete({
      source: $('.presenter-field').data('autocomplete-source')
    });

    $('form').on('cocoon:after-insert', function(e, insertedItem) {
      insertedItem.find('.presenter-field').autocomplete({
        source: $('.presenter-field').data('autocomplete-source')
      });
      insertedItem.find('.guest-field').autocomplete({
        source: $('.guest-field').data('autocomplete-source')
      });
    });
  });
});

// files validation
var extErrorMessage;
var allowedExtension;

function validateFiles(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (250 MB)";
  setExtensionsAndMessage();

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;

  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    alert(maxExceededMessage);
    $(inputFile).val('');
  };

  if (extError) {
    alert(extErrorMessage);
    $(inputFile).val('');
  };
}

function setExtensionsAndMessage() {
  var getExtensions = $('#material-type').text();
  switch (getExtensions) {
    case 'image':
      allowedExtension = ["jpg", "jpeg", "gif", "png"];
      extErrorMessage = "Only image files with extension: .jpg, .jpeg, .gif or .png are allowed";
      break;
    case 'audio':
      allowedExtension = ["mp3"];
      extErrorMessage = "Only file with extension: .mp3 is allowed";
      break;
    case 'video':
      allowedExtension = ["mp4"];
      extErrorMessage = "Only file with extension: .mp4 is allowed";
      break;
    case 'document':
      allowedExtension = ['pdf', 'docx'];
      extErrorMessage = "Only files with extension: .pdf or .docx are allowed";
  };    
}

// duration calculation
// var framerate = 24;
// var time1 = "";
// var time2 = "";
// var target;

// function valueOfFirstField(input) {
//   validateFormat(input)
//   time1 = $(input).val();
//   target = $(input).closest('div').next().next().find('.duration');
//   calculateDuration(time1, time2, target);
// }

// function valueOfSecondField(input) {
//   validateFormat(input)
//   time2 = $(input).val();
//   target = $(input).closest('div').next().find('.duration');
//   calculateDuration(time1, time2, target);
// }

// function calculateDuration(input1, input2, event) {
//   if (input1 != "" && input2 != "") {
//     event.val(frames_to_timecode(timecode_to_frames(input2) - timecode_to_frames(input1)));
//   } else {
//     event.val("");
//   }
// }

// function timecode_to_frames(timecode) {
//   var a = timecode.split(':');
//   return ((Number(a[0])*3600 + Number(a[1])*60 + Number(a[2]))*framerate + Number(a[3]));
// }

// function frames_to_timecode(frames) {
//   var hh = Math.floor(frames / (3600 * framerate));
//   var mm = Math.floor((frames / (60 * framerate)) % 60);
//   var ss = Math.floor((frames / framerate) % 60);
//   var ff = frames % framerate;
//   var result = hh.toString().padStart(2, "0") + ":" + mm.toString().padStart(2, "0") + ":" + ss.toString().padStart(2, "0") + ":" + ff.toString().padStart(2, "0");
//   return result;
// }

// function validateFormat(input) {
//   var wrongFormatMessage = "The format of this input must be '00:00:00:00'";
//   var format = /^\d{2}:\d{2}:\d{2}:([01]\d|2[0-4])$/;
//   var inputValue = $(input).val();

//   if(!inputValue.match(format)) {
//     $(input).val('');
//     alert(wrongFormatMessage);
//   } 
// }