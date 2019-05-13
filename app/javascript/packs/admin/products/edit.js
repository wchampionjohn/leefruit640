import Vue            from 'vue/dist/vue.esm';

new Vue({
  el: '#app',
  data: {
    images:[],
    productId: $('#product_id').val(),
  },

  mounted(){
    this.initDropZone();
  },
  created() {
    this.fetchImages();
  },
  methods:{
    fetchImages(){
      let self = this;
      $.ajax({
        url: '/admin/products/' + self.productId + '/images',
        dataType: 'json'
      }).done(function(result){
        self.images = result
      })
    },
    initDropZone(){

      let self = this;
      Dropzone.autoDiscover = false;

      var dz = new Dropzone("#dropzone", {
        maxFiles: 5,
        url: "/admin/products/" + self.productId + "/images",
        addRemoveLinks: true,
        createImageThumbnails: true
      });

      dz.on("success", function(file){
        var response  = $.parseJSON(file.xhr.response);
        var data      = $.parseJSON(response.image);

        this.removeFile(file);

        toastr.info('上傳成功', 'Info');
        console.log(data)
        self.images.push(data);
      });

      dz.on("error", function(file, responseText){
        toastr.error(responseText.errors, 'Error');
      });

    },
    removeImages(id) {
      let self = this;

      swal({
        title: '確定刪除這個檔案嗎?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
      }, function() {

          $.ajax({
            type: "DELETE",
            url: "/admin/products/" + self.productId + "/images/" + id
          }).done(function() {

            self.images = self.images.filter(image => image.id !== id)
            toastr.info('刪除成功', 'Info');
          })

      })

    },
  }
})
