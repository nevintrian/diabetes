<div class="col-xs-12 col-sm-9 content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar"><span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>Data Barang</h3>
        </div>
        <div class="panel-body">
            <div class="content-row">
                <h2 class="content-row-title">Tambah User</h2>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="varchar">Nama</label>
                        <input type="text" pattern="[A-Za-z ]+" title="Masukkan data huruf saja" class="form-control" required name="nama" id="nama" placeholder="Nama User" value="<?php echo $nama; ?>" />
                    </div>
                    <?php if ($password == null) { ?>
                        <div class="form-group">
                            <label for="varchar">Email</label>
                            <input type="email" title="Masukkan email (contoh : kelompok4@gmail.com)" class="form-control" required name="email" id="email" placeholder="Email" value="<?php echo $email; ?>" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Username</label>
                            <input type="text" class="form-control" title="Masukkan angka atau huruf (6-12 karakter)" required name="username" id="username" placeholder="Username" value="<?php echo $username; ?>" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Password </label>
                            <input type="password" placeholder="password" class="form-control" required name="password" id="password" />
                        </div>
                    <?php } else { ?>
                        <div class="form-group">
                            <label for="varchar">Password </label>
                            <input type="password" placeholder="Kosongi jika tidak ingin mengubah password" class="form-control" name="password" id="password" />
                        </div>
                    <?php } ?>
                    <input type="hidden" name="id" value="<?php echo $id; ?>" />
                    <button type="submit" class="btn btn-primary"><?php echo $button ?></button>
                    <a href="<?php echo site_url('user') ?>" class="btn btn-default">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>