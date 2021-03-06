(function ($) {

Drupal.behaviors.media_gallery = {};
Drupal.behaviors.media_gallery.attach = function (context, settings) {
  // Bind a click handler to the 'add media' link.
  $('a.media-gallery-add.launcher').once('media-gallery-add').bind('click', Drupal.media_gallery.open_browser);
};

Drupal.media_gallery = {};

Drupal.media_gallery.open_browser = function (event) {
  event.preventDefault();
  event.stopPropagation();
 
  // get node id for the link that was clicked and save to settings (id attribute for parent article is node-[id])
  Drupal.settings.mediaGalleryNodeNid = $(this).closest("article.contextual-links-region").attr('id').substring(5);

  var pluginOptions = { 'id': 'media_gallery', 'multiselect' : true , 'types': Drupal.settings.mediaGalleryAllowedMediaTypes};
  Drupal.media.popups.mediaBrowser(Drupal.media_gallery.add_media, pluginOptions);
};

Drupal.media_gallery.add_media = function (mediaFiles) {
  // TODO AN-17966: Add the images to the node's media multifield on the client
  // side instead of reloading the page.
  var mediaAdded = function (returnedData, textStatus, XMLHttpRequest) {
    parent.window.location.reload();
  };

  var errorCallback = function () {
    //console.warn('Error: Media not added.');
  };

  var src = Drupal.settings.mediaGalleryAddImagesBaseUrl + Drupal.settings.mediaGalleryNodeNid + '/' + Drupal.settings.mediaGalleryToken;

  var media = [];

  for(var i = 0; i < mediaFiles.length; i++) {
    media[i] = mediaFiles[i].fid;
  }

  $.ajax({
    url: src,
    type: 'POST',
    dataType: 'json',
    data: {files: media},
    error: errorCallback,
    success: mediaAdded
  });
  
  return false;
}

})(jQuery);
