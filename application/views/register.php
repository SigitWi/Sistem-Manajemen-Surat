<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login | Admin</title>

  <!-- Bootstrap Core CSS -->
  <link href="<?php echo base_url() ?>assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="<?php echo base_url() ?>assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="<?php echo base_url() ?>assets/dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="<?php echo base_url() ?>assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="<?php echo base_url() ?>assets/register.css" rel="stylesheet" type="text/css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Selamat datang, silahkan Register</h3>
          </div>
          <div class="panel-body">
            <?php
            if ($this->session->flashdata('error') != '') {
              echo '<div class="alert alert-danger" role="alert">';
              echo $this->session->flashdata('error');
              echo '</div>';
            }
            ?>
            <form role="form" method="post" action="<?php echo base_url('register/proses') ?>">
              <fieldset>
                <div>
                  <div>
                    <label>Nama:</label>
                    <input type="text" name="nama" id="username" required autocomplete="off" />
                  </div>
                  <label>NIP:</label>
                  <input type="text" name="nip" id="nip" required autocomplete="off" />
                </div>
                <div class="form-group row">
                  <label class="col-md-6 col-form-label">Jabatan</label>
                  <div class="col-md-5">
                    <select class="form-control" id="id_jabatan" name="id_jabatan" required>
                      <option selected="0">Jabatan</option>
                      <?php foreach ($jabatan as $id_jabatan) : ?>
                        <option value="<?php echo $id_jabatan['id_jabatan']; ?>"> <?php echo $id_jabatan['nama_jabatan']; ?></option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                </div>
                <div>
                  <label>Password:</label>
                  <input type="password" name="password" id="password" required />
                </div>
                <div>
                  <input type="submit" class="btn btn-primary" name="register" value="REGISTER" class="tombol">
                </div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- jQuery -->
  <script src="<?php echo base_url() ?>assets/vendor/jquery/jquery.min.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="<?php echo base_url() ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>

  <!-- Metis Menu Plugin JavaScript -->
  <script src="<?php echo base_url() ?>assets/vendor/metisMenu/metisMenu.min.js"></script>

  <!-- Custom Theme JavaScript -->
  <script src="<?php echo base_url() ?>assets/dist/js/sb-admin-2.js"></script>

</body>

</html>