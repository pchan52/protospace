$(window).on("click", function(){
  $(".js-image-preview").each(function() {
    var prev = $(this)
    image = prev.find('input[type=file]');
    image.change(function(){
      var file = this.files[0]
      if (!this.files.length){
        return;
      }
      if (!file.type.match('image.*')) {
        window.alert('This file is not available!');
        return;
      }
      fileReader = new FileReader();
      fileReader.readAsDataURL(file);
      fileReader.onload = function(){
        prev.css({
          'background-image': 'url(' + fileReader.result + ')',
          'background-size' : 'cover'
        });
      };
      });
    });
  });
