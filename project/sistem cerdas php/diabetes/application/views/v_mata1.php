<div class="col-xs-12 col-sm-9 content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar"><span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>Data Mata</h3>
        </div>
        <div class="panel-body">
            <div class="content-row">
                <h2 class="content-row-title">Tambah Data Mata</h2>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="varchar">Nama</label>
                        <input type="text" class="form-control" required name="nama" id="nama" placeholder="Nama" value="<?php echo $nama; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="varchar">status</label>
                        <input type="text" class="form-control" required name="status" id="status" placeholder="status" value="<?php echo $status; ?>" />
                    </div>
                    <?php if ($nama == null) { ?>
                        <div class="form-group">
                            <label for="file">Gambar</label>
                            <input type="file" class="form-control" id="gambar" name="gambar" />
                        </div>
                    <?php } ?>
                    <input type="hidden" name="id" id="id" value="<?php echo $id; ?>">
                    <button type="submit" class="btn btn-primary">tambah</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function klik() {
        swal("Sukses!", "Data berhasil di tambahkan", "success")
    }
</script>