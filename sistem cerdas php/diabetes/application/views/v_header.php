<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Diabetes App</title>
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
  <base href="<?php echo base_url(); ?>">
  <link rel="bookmark" href="favicon_16.ico" />
  <link rel="stylesheet" href="assets/dist/css/site.min.css">
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700,400italic,600italic,700italic,800italic,300italic" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="assets/dist/js/site.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
  <nav role="navigation" class="navbars">
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li>
          <b><a href="<?php echo base_url() ?>home" type="submit">
              <h5 class="header"> &nbsp; &nbsp;Diabetes App &nbsp; &nbsp;</h5>
            </a></b>
        </li>
        <li><a class="header" href="home">Home</a></li>
        <li><a class="header" href="tutorial">Tutorial</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <?php if ($this->session->userdata('status') != null) { ?>
          <li><a class="header" href="dashboard"><?php echo $this->session->userdata("username") ?></a></li>
          <li><a class="header" href="login/logout" onclick="javasciprt: return confirm('Apa Anda Yakin?')">Logout</a></li>
        <?php  } else { ?>
          <li><a class="header" href="login">Login</a></li>
          <li><a class="header" href="daftar">Daftar</a></li>
        <?php } ?>
      </ul>
    </div>
  </nav>
  <br>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="assets/dataTables/datatables.min.css"></script>