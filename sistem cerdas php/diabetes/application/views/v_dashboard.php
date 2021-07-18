<style>
  d {
    color: rgb(255, 255, 255)
  }
</style>

<div class="col-xs-12 col-sm-9 content">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar"><span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>Dashboard</h3>
    </div>
    <div class="panel-body">
      <div class="content-row">
        <h2 class="content-row-title">Dashboard</h2>
        <div class="col-md-12">
          <div class="panel-heading">
            <div class="row">
              <div class="col-md-4">
                <div class="list-group">
                  <d style="text-align: center;background-color: #969696;border-color: #d9d9d9" class="list-group-item"><i class="fa fa-folder"> </i> Data User</d>
                  <a href="<?php echo site_url('user') ?>" class="list-group-item" style="text-align: center;background-color: light-blue;border-color: #d9d9d9">Jumlah user : <?php echo $total_asset_user; ?></a> <!-- menampilkan jumlah user -->
                </div>
              </div>
              <div class="col-md-4">
                <div class="list-group">
                  <d style="text-align: center;background-color: #969696;border-color: #d9d9d9" class="list-group-item"><i class="fa fa-folder"> </i> Data Mata</d>
                  <a href="<?php echo site_url('mata') ?>" class="list-group-item" style="text-align: center;background-color: light-blue;border-color: #d9d9d9">Jumlah mata : <?php echo $total_asset_mata; ?></a> <!-- menampilkan jumlah user -->
                </div>
              </div>
              <div class="col-md-4">
                <div class="list-group">
                  <d style="text-align: center;background-color: #969696;border-color: #d9d9d9" class="list-group-item"><i class="fa fa-folder"> </i> Data Uji</d>
                  <a href="<?php echo site_url('uji') ?>" class="list-group-item" style="text-align: center;background-color: light-blue;border-color: #d9d9d9">Jumlah uji : <?php echo $total_asset_uji; ?></a> <!-- menampilkan jumlah user -->
                </div>
              </div>
              <div class="col-md-4">
                <div class="list-group">
                  <d style="text-align: center;background-color: #969696;border-color: #d9d9d9" class="list-group-item"><i class="fa fa-folder"> </i> Akurasi Uji</d>
                  <a href="<?php echo site_url('uji') ?>" class="list-group-item" style="text-align: center;background-color: light-blue;border-color: #d9d9d9">akurasi : <?php echo $total_akurasi; ?>%</a> <!-- menampilkan jumlah user -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>