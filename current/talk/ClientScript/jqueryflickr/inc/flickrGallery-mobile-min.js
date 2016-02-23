(function($){document.flickr=new Object();$.mbFlickr={name:"mb.flickr",author:"Matteo Bicocchi",version:"1.0",flickr_api_key:"",flickr_user_name:"",defaults:{flickr_user_id:"",flickr_photoset_id:"",page:1,per_page:20,onStart:function(){},callback:function(){}},loadFlickrPhotos:function(options){var gallery=$(this).get(0);gallery.defaults={};$.extend(gallery.defaults,$.mbFlickr.defaults,options);document.flickr.photoset=gallery.defaults.flickr_photoset_id;if(typeof gallery.isInit!="undefined"&&gallery.isInit==gallery.defaults.flickr_photoset_id){if(gallery.defaults.callBack)gallery.defaults.callBack(gallery);return;}
if(gallery.defaults.onStart)gallery.defaults.onStart();var getSet=gallery.defaults.flickr_photoset_id;if(!$.mbFlickr.defaults.flickr_user_id)
$.mbFlickr.getFlickrNSID($.mbFlickr.flickr_api_key,$.mbFlickr.flickr_user_name);if(getSet){$(gallery).mb_getFlickrSet(gallery.defaults.page,function(){$(gallery).mb_getFlickrPhotoDATA();$(gallery).mb_getFlickrPhotoINFO();});}else{$(gallery).mb_getFlickrPhotos(gallery.defaults.page,function(){$(gallery).mb_getFlickrPhotoDATA();$(gallery).mb_getFlickrPhotoINFO();});}},getFlickrNSID:function(key,name){$.getJSON("http://api.flickr.com/services/rest/?method=flickr.urls.lookupUser&api_key="+key+"&url=http%3A%2F%2Fwww.flickr.com%2Fphotos%2F"+name+"%2F&format=json&rnd="+new Date()+"&jsoncallback=?",function(data){if(data.stat!="fail"){$.mbFlickr.defaults.flickr_user_id=data.user.id;}});},getFlickrSet:function(page,callBack){if(!page)page=1;var gallery=$(this).get(0);var per_page=gallery.defaults.per_page;var key=$.mbFlickr.flickr_api_key;var setID=gallery.defaults.flickr_photoset_id;$.getJSON("http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key="+key+"&photoset_id="+setID+"&extras=url_sq,url_t,url_s,url_m,url_o&per_page="+per_page+"&page="+page+"&format=json&rnd="+new Date()+"&jsoncallback=?",function(data){if(data.stat=="fail"){alert(data.message);return;}
gallery.photos=data.photoset.photo;gallery.pages=data.photoset.pages;gallery.page=data.photoset.page;if(callBack)callBack();});},getFlickrPhotos:function(page,callBack){if(!page)page=1;var gallery=$(this).get(0);var per_page=gallery.defaults.per_page;if(per_page=="all")per_page=100;var key=$.mbFlickr.flickr_api_key;var userNSID=$.mbFlickr.defaults.flickr_user_id;$.getJSON("http://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key="+key+"&user_id="+userNSID+"&per_page="+per_page+"&page="+page+"&format=json&jsoncallback=?",function(data){gallery.photos=data.photos.photo;gallery.pages=data.photos.pages;gallery.page=data.photos.page;if(callBack)callBack();});},getFlickrPhotoDATA:function(){var gallery=$(this).get(0);var key=$.mbFlickr.flickr_api_key;document.flickr.total=gallery.photos.length;$(gallery.photos).each(function(i){$.getJSON("http://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key="+key+"&photo_id="+this.id+"&secret="+this.secret+"&format=json&rnd="+new Date()+"&jsoncallback=?",function(data){gallery.photos[i].square=data.sizes.size[0].source;gallery.photos[i].squareWidth=data.sizes.size[0].width;gallery.photos[i].squareHeight=data.sizes.size[0].height;gallery.photos[i].thumb=data.sizes.size[1].source;gallery.photos[i].thumbWidth=data.sizes.size[1].width;gallery.photos[i].thumbHeght=data.sizes.size[1].height;gallery.photos[i].small=data.sizes.size[2].source;gallery.photos[i].smallWidth=data.sizes.size[2].width;gallery.photos[i].smallHeigt=data.sizes.size[2].height;gallery.photos[i].medium=data.sizes.size[3].source;gallery.photos[i].mediumWidth=data.sizes.size[3].width;gallery.photos[i].mediumHeight=data.sizes.size[3].height;gallery.photos[i].source=data.sizes.size[data.sizes.size.length-1].source;gallery.photos[i].sourceWidth=data.sizes.size[data.sizes.size.length-1].width;gallery.photos[i].sourceHeight=data.sizes.size[data.sizes.size.length-1].height;gallery.photos[i].url=data.sizes.size[data.sizes.size.length-1].url;document.flickr.loaded=i+1;if(i==gallery.photos.length-1){setTimeout(function(){if(gallery.defaults.callback)gallery.defaults.callback(gallery);gallery.isInit=gallery.defaults.flickr_photoset_id;},3000);}});});},getFlickrPhotoINFO:function(){var gallery=$(this).get(0);var key=$.mbFlickr.flickr_api_key;$(gallery.photos).each(function(i){$.getJSON("http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key="+key+"&photo_id="+this.id+"&secret="+this.secret+"&format=json&rnd="+new Date()+"&jsoncallback=?",function(data){gallery.photos[i].description=data.photo.description._content==undefined?"":data.photo.description._content;});});}};$.fn.mb_getFlickrSet=$.mbFlickr.getFlickrSet;$.fn.mb_getFlickrPhotos=$.mbFlickr.getFlickrPhotos;$.fn.mb_getFlickrPhotoDATA=$.mbFlickr.getFlickrPhotoDATA;$.fn.mb_getFlickrPhotoINFO=$.mbFlickr.getFlickrPhotoINFO;$.fn.mb_loadFlickrPhotos=$.mbFlickr.loadFlickrPhotos;})(jQuery);

(function($){$.mbGallery={name:"mb.gallery",author:"Matteo Bicocchi",version:"2.0.2",defaults:{containment:"body",cssURL:"css/",skin:"white",overlayBackground:"#333",exifData:false,galleryTitle:"My Gallery",imageSelector:".imgFull",thumbnailSelector:".imgThumb",titleSelector:".imgTitle",descSelector:".imgDesc",minWidth:300,minHeight:200,maxWidth:0,maxHeight:0,fullScreen:true,addRaster:false,overlayOpacity:.5,startFrom:0,fadeTime:500,slideTimer:6000,autoSlide:true,onOpen:function(){},onBeforeClose:function(){},onClose:function(){},onChangePhoto:function(){}},buildMbGallery:function(options){var gallery=$(this).get(0);if(gallery.initialized){$(gallery).mb_closeGallery();return;}
gallery.initialized=true;gallery.options=$.extend({},$.mbGallery.defaults,options);if(gallery.options.onOpen)gallery.options.onOpen();var css="<link rel='stylesheet' id='mbGalleryCss' type='text/css' href='"+gallery.options.cssURL+gallery.options.skin+".css' title='tyle'  media='screen'/>";$("head").prepend(css);$(gallery).hide();gallery.galleryID="mb_gallery_"+gallery.id;$(gallery).mb_getPhotos();var overlay=$("<div/>").addClass("mb_overlay").one("click",function(){$(gallery).mb_closeGallery();}).css({opacity:gallery.options.overlayOpacity,background:gallery.options.overlayBackground}).hide();var galleryScreen=$("<div/>").attr("id",gallery.galleryID).addClass("galleryScreen").addClass("mbGall_"+gallery.options.skin);var galleryDesc=$("<div/>").addClass("galleryDesc").css({opacity:.7}).hide();var galleryTitle=$("<div/>").addClass("galleryTitle").html(gallery.options.galleryTitle);var galleryImg=$("<div/>").addClass("galleryImg").hover(function(){if(galleryDesc.html())galleryDesc.slideDown();},function(){galleryDesc.slideUp();}).dblclick(function(){if(gallery.sliding)$(gallery).mb_stopSlide();else $(gallery).mb_startSlide();});var galleryRaster=$("<div/>").addClass("galleryRaster").css({width:"100%",height:"100%"});var galleryLoader=$("<div/>").addClass("loader").mb_bringToFront().css("opacity",.7).hide();var galleryThumbs=$("<div/>").addClass("galleryThumbs").hide();var galleryNav=$("<div/>").addClass("galleryNav").hide();galleryScreen.bind("mouseleave",function(){$(gallery).mb_hideThumbs();});if(gallery.options.containment=="body"){$("body").append(overlay);overlay.fadeIn();$("body").append(galleryScreen);}else{galleryScreen.addClass("conatined");$("#"+gallery.options.containment).show();$("#"+gallery.options.containment).append(galleryScreen);}
galleryScreen.append(galleryNav);galleryScreen.append(galleryTitle);var galleryCloseIcon=$("<div/>").addClass("galleryCloseIcon ico").one("click",function(){$(gallery).mb_closeGallery();});galleryTitle.append(galleryCloseIcon);galleryScreen.append(galleryImg);galleryImg.append(galleryLoader);if(gallery.options.addRaster)
galleryImg.append(galleryRaster).mb_bringToFront();galleryImg.append(galleryThumbs);galleryImg.append(galleryDesc);if(gallery.options.containment=="body")
galleryScreen.css({minWidth:gallery.options.minWidth,minHeight:gallery.options.minHeight,top:"50%",marginTop:-(gallery.options.minHeight/2),left:"50%",marginLeft:-(gallery.options.minWidth/2)});galleryImg.css({minWidth:gallery.options.minWidth,minHeight:gallery.options.minHeight});gallery.sliding=gallery.options.autoSlide;gallery.idx=gallery.options.startFrom=="random"?Math.floor(Math.random()*(gallery.images.length-1)):gallery.options.startFrom;$("#"+gallery.galleryID).find(".loader").addClass("loading").show();$(gallery).mb_buildThumbs();$(gallery).mb_selectThumb();$(gallery).mb_buildNav();$(gallery).mb_preload();},getPhotos:function(){var gallery=$(this).get(0);gallery.images=new Array();$(gallery).find(gallery.options.thumbnailSelector).each(function(i){var photo=new Object();photo.idx=i;photo.thumb=$(this).attr("href");photo.full=$(this).next("a").attr("href");photo.fullWidth=$(this).attr("w")?$(this).attr("w"):false;photo.fullHeight=$(this).attr("h")?$(this).attr("h"):false;photo.title=$(this).nextAll(gallery.options.titleSelector).html();photo.description=$(this).nextAll(gallery.options.descSelector).html();gallery.images.push(photo);});},preload:function(){var gallery=$(this).get(0);if(!gallery.sliding)$("#"+gallery.galleryID).find(".loader").addClass("loading").show();var rndVar=$.browser.msie?"?"+new Date():"";var showExif=gallery.options.exifData;$("<img/>").attr({"src":gallery.images[gallery.idx].full+rndVar,"exif":showExif}).load(function(){if(!gallery.sliding)$("#"+gallery.galleryID).find(".loader").fadeOut(500,function(){$("#"+gallery.galleryID).find(".loader").removeClass("loading");});$(gallery).mb_changePhoto(rndVar);$(gallery).mb_selectThumb();});},changePhoto:function(rndVar){var gallery=$(this).get(0);$("#"+gallery.galleryID).find(".loader").fadeOut(500,function(){$("#"+gallery.galleryID).find(".loader").removeClass("loading");});var galleryImg=$("#"+gallery.galleryID).find(".galleryImg");var photoTitle=$("#"+gallery.galleryID).find(".photoTitle");var galleryDesc=$("#"+gallery.galleryID).find(".galleryDesc");var galleryScreen=$("#"+gallery.galleryID);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");var newImg=$("<img/>").addClass("highRes").attr({src:gallery.images[gallery.idx].full+rndVar}).css({position:"absolute",top:0,left:0}).hide();galleryImg.prepend(newImg);var dim=newImg.getDim(gallery,gallery.images[gallery.idx].fullWidth,gallery.images[gallery.idx].fullHeight);var w=parseFloat(dim[1]);var h=parseFloat(dim[0]);if(gallery.options.containment=="body")
galleryScreen.animate({top:"50%",marginTop:-(h/2),left:"30%",marginLeft:-(w/2)},"slow");galleryImg.animate({width:w,height:h},"slow");newImg.fadeIn("slow",function(){galleryNav.fadeIn(500)});newImg.next("img").fadeOut("slow",function(){$(this).remove();});photoTitle.fadeOut("slow",function(){photoTitle.html(gallery.images[gallery.idx].title);photoTitle.fadeIn();});galleryDesc.html(gallery.images[gallery.idx].description);if(gallery.sliding){galleryNav.find(".startStopIcon").addClass("selected");gallery.startGallery=setTimeout(function(){gallery.idx=gallery.idx==gallery.images.length-1?0:gallery.idx+1;$(gallery).mb_preload();},gallery.options.slideTimer);}
galleryNav.find(".photoCounter").html((gallery.idx+1)+" / <b>"+gallery.images.length+"</b>");if(galleryDesc.html()=="")galleryDesc.slideUp();if(gallery.options.onChangePhoto)gallery.options.onChangePhoto();},buildThumbs:function(){var gallery=$(this).get(0);var galleryThumbs=$("#"+gallery.galleryID).find(".galleryThumbs");galleryThumbs.empty();$(gallery.images).each(function(i){var photo=this;var img=$("<img/>").addClass("thumb");img.attr("src",photo.thumb);img.attr("id",gallery.galleryID+"_thumb_"+i);img.bind("click",function(){if($(this).is(".selected"))return;gallery.idx=photo.idx;$(gallery).mb_selectThumb();$(gallery).mb_stopSlide();$(gallery).mb_preload();$(gallery).mb_hideThumbs();});galleryThumbs.css("opacity",.9);galleryThumbs.append(img);});},buildNav:function(){var gallery=$(this).get(0);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");var galleryThumbs=$("#"+gallery.galleryID).find(".galleryThumbs");var photoTitle=$("<div/>").addClass("photoTitle");var thumbsIcon=$("<div/>").addClass("thumbsIcon ico").bind("click",function(){if(galleryThumbs.is(":hidden"))$(gallery).mb_showThumbs();else $(gallery).mb_hideThumbs();});var startStopIcon=$("<div/>").addClass("startStopIcon ico").bind("click",function(){if(gallery.sliding)$(gallery).mb_stopSlide();else $(gallery).mb_startSlide();});var prevIcon=$("<div/>").addClass("prevIcon ico").bind("click",function(){$(gallery).mb_galleryPrev();});var nextIcon=$("<div/>").addClass("nextIcon ico").bind("click",function(){$(gallery).mb_galleryNext();});var showExif=gallery.options.exifData;var exifIcon=showExif?$("<div/>").addClass("exifIcon ico").bind("click",function(){$(gallery).mb_showExifData();}):"";var photoCounter=$("<div/>").addClass("photoCounter ico");var galleryBtns=$("<div/>").addClass("galleryBtns");galleryNav.append(photoTitle);galleryNav.append(galleryBtns);galleryBtns.prepend(thumbsIcon).prepend(startStopIcon).prepend(prevIcon).prepend(nextIcon).prepend((showExif?exifIcon:"")).prepend(photoCounter);},showExifData:function(){var gallery=$(this).get(0);$(gallery).mb_stopSlide();},selectThumb:function(){var gallery=$(this).get(0);var galleryThumbs=$("#"+gallery.galleryID).find(".galleryThumbs");var actualThumb=$("#"+gallery.galleryID+"_thumb_"+gallery.idx);galleryThumbs.find(".thumb").removeClass("selected").css("opacity",1);actualThumb.addClass("selected").css("opacity",.4);},startSlide:function(idx){var gallery=$(this).get(0);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");gallery.sliding=true;gallery.idx=idx?idx:gallery.idx==gallery.images.length-1?0:gallery.idx+1;$(gallery).mb_preload();galleryNav.find(".startStopIcon").addClass("selected");},stopSlide:function(){var gallery=$(this).get(0);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");gallery.sliding=false;clearTimeout(gallery.startGallery);galleryNav.find(".startStopIcon").removeClass("selected");},prev:function(){var gallery=$(this).get(0);$(gallery).mb_stopSlide();gallery.sliding=false;gallery.idx=gallery.idx==0?gallery.images.length-1:gallery.idx-1;$(gallery).mb_preload();},next:function(){var gallery=$(this).get(0);$(gallery).mb_stopSlide();gallery.sliding=false;gallery.idx=gallery.idx==gallery.images.length-1?0:gallery.idx+1;$(gallery).mb_preload();},gotoIDX:function(idx){var gallery=$(this).get(0);gallery.idx=idx-1;$(gallery).mb_selectThumb();$(gallery).mb_stopSlide();$(gallery).mb_preload();$(gallery).mb_hideThumbs();},loader:function(){var gallery=$(this).get(0);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");galleryNav.find(".thumbsIcon").addClass("selected");var galleryThumbs=$("#"+gallery.galleryID).find(".galleryThumbs");galleryThumbs.slideDown();},hideThumbs:function(){var gallery=$(this).get(0);var galleryNav=$("#"+gallery.galleryID).find(".galleryNav");galleryNav.find(".thumbsIcon").removeClass("selected");var galleryThumbs=$("#"+gallery.galleryID).find(".galleryThumbs");galleryThumbs.slideUp();},closeGallery:function(){var gallery=$(this).get(0);if(gallery.options.onBeforeClose)gallery.options.onBeforeClose();if(!$.browser.msie)
$("#"+gallery.galleryID).animate({position:"absolute",top:-1000},"slow",function(){$("#"+gallery.galleryID).remove();$("#"+gallery.options.containment).slideUp();if(gallery.options.onClose)gallery.options.onClose();});else{$("#"+gallery.galleryID).remove();$("#"+gallery.options.containment).hide();}
$(".mb_overlay").slideUp("slow",function(){$(".mb_overlay").remove();});$(gallery).mb_stopSlide();gallery.initialized=false;}};jQuery.fn.extend({getDim:function(gallery,w,h){var nw=w?w:$(this).outerWidth();var nh=h?h:$(this).outerHeight();var wh=gallery.options.containment=="body"?$(window).height():$("#"+gallery.options.containment).innerHeight();var ww=gallery.options.containment=="body"?$(window).width():$("#"+gallery.options.containment).innerWidth();if(gallery.options.galleryMaxHeight>0&&$(this).outerHeight()>gallery.options.galleryMaxHeight){nh=gallery.options.galleryMaxHeight;}
if(gallery.options.galleryMaxWidth>0&&$(this).outerWidth()>gallery.options.galleryMaxWidth){nw=gallery.options.galleryMaxWidth;}
if(parseFloat(nh)+120>=wh||gallery.options.fullScreen){nh=wh-130;nw=(nh*$(this).outerWidth())/$(this).outerHeight();$(this).attr("height",nh);$(this).attr("width",nw);}
if(parseFloat(nw)+100>=ww){nw=ww-120;nh=(nw*$(this).outerHeight())/$(this).outerWidth();$(this).attr("width",nw);$(this).attr("height",nh);}
return[nh,nw];}});$.fn.mbGallery=$.mbGallery.buildMbGallery;$.fn.mb_getPhotos=$.mbGallery.getPhotos;$.fn.mb_buildThumbs=$.mbGallery.buildThumbs;$.fn.mb_buildNav=$.mbGallery.buildNav;$.fn.mb_preload=$.mbGallery.preload;$.fn.mb_changePhoto=$.mbGallery.changePhoto;$.fn.mb_selectThumb=$.mbGallery.selectThumb;$.fn.mb_showExifData=$.mbGallery.showExifData;$.fn.mb_galleryNext=$.mbGallery.next;$.fn.mb_galleryPrev=$.mbGallery.prev;$.fn.mb_gotoIDX=$.mbGallery.gotoIDX;$.fn.mb_startSlide=$.mbGallery.startSlide;$.fn.mb_stopSlide=$.mbGallery.stopSlide;$.fn.mb_showThumbs=$.mbGallery.loader;$.fn.mb_hideThumbs=$.mbGallery.hideThumbs;$.fn.mb_closeGallery=$.mbGallery.closeGallery;jQuery.fn.mb_bringToFront=function(){var zi=10;$('*').each(function(){if($(this).css("position")=="absolute"||$(this).css("position")=="fixed"){var cur=parseInt($(this).css('zIndex'));zi=cur>zi?parseInt($(this).css('zIndex')):zi;}});$(this).css('zIndex',zi+=1);return $(this);};})(jQuery);
