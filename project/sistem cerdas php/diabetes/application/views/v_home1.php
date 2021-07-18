<div class="col-xs-12 col-xs-12 content">
  <div class="panel panel-default">
    <div class="panel-body">
      <center>
        <h3>Hasil Pengujian</h3>
      </center>
      <div class="col-xs-12 text-center">
        <div class="home-category-list__category-grid"></div>
        <p>Diabetes adalah penyakit kronis yang ditandai dengan ciri-ciri berupa tingginya kadar gula atau glukosa
          darah. Glukosa merupakan sumber energi utama bagi sel tubuh manusia. Glukosa yang menumpuk di dalam darah
          akibat tidak diserap sel tubuh dengan baik dapat menimbulkan berbagai gangguan organ tubuh. Jika diabetes
          tidak dikontrol dengan baik, dapat timbul berbagai komplikasi yang membahayakan nyawa penderita. Kami
          membuat aplikasi untuk mendeteksi diabetes berdasarkan iris mata untuk mengetahui diagnosis penyakit
          diabetes. Tutorial aplikasi dapat dilihat <a href="tutorial">disini</a></p><br><br>
        <center>
          <div class="kotak">
            <img style="border-radius: 10px; width:200px; height:200px" src="image/mata/<?php echo $gambar ?>" />
          </div>
        </center>
        <h4>Hasil : <?php echo $hasil ?></h4>
      </div>
    </div>
  </div>
</div>

<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#blah')
          .attr('src', e.target.result)
          .width(200)
          .height(200)
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>