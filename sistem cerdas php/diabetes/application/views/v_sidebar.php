<div class="container-fluid">
  <div class="row row-offcanvas row-offcanvas-left">
    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" role="navigation">
      <ul class="list-group panel">
        <li class="list-group-item"><i class="glyphicon glyphicon-align-justify"></i> <b>MENU UTAMA</b></li>
        <li class="list-group-item"><a href="<?php echo base_url() ?>dashboard"><i class="glyphicon glyphicon-home"></i>Dashboard </a></li>
        <li class="list-group-item"><a href="<?php echo base_url() ?>user"><i class="glyphicon glyphicon-folder-open"></i>Data User</a></li>
        <li class="list-group-item"><a href="<?php echo base_url() ?>mata"><i class="glyphicon glyphicon-picture"></i>Data Mata</a></li>
        <li class="list-group-item"><a href="<?php echo base_url() ?>uji"><i class="glyphicon glyphicon-picture"></i>Data Uji</a></li>
        <li class="list-group-item"><a href="<?php echo base_url() ?>login/logout" type="submit" onclick="javasciprt: return confirm('Apa Anda Yakin?')"><i class="glyphicon glyphicon-share"></i>Logout </a></li>
      </ul>
    </div>