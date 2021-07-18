<body>
    <div class="col-xs-12 col-sm-12 content">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container">
                    <form class="form-signin" role="form" action="daftar/simpan_daftar" method="post">
                        <center>
                            <h3 class="form-signin-heading">Halaman Registrasi</h3>
                        </center>
                        </br>
                        <div class="form-group">
                            <label for="varchar">Email</label>
                            <input type="text" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Masukan email (contoh : kelompok4@gmail.com)" required name="email" id="email" placeholder="Email" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Username</label>
                            <input type="text" pattern="^[a-zA-Z][a-zA-Z0-9]{5,12}$" title="Masukkan angka atau huruf (6-12 karakter)" class="form-control" required name="username" id="username" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Nama</label>
                            <input type="text" pattern="[A-Za-z ]+" title="Masukkan data huruf saja" class="form-control" pattern="[A-Za-z ]+" required name="nama" id="nama" placeholder="Nama" />
                        </div>
                        <div class="form-group">
                            <label for="varchar">Password </label>
                            <input type="password" pattern="(?=.*\d)(?=.*[a-z]).{6,}" title="Masukkan password dengan huruf dan angka (minimal 8 karakter)" class="form-control" required name="password" id="password" placeholder="Password" ? />
                        </div>
                        </br>
                        <button class="btn btn-lg btn-secondary btn-block" type="submit">Register</button>
                        <br>
                        <center> <a style="color: darkgrey;" href="login">Login Disini</a> </center>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</body>