<?php $this->load->view('templates/v_apoteker_header.php'); ?>

       <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <?php $this->load->view('templates/v_apoteker_sidebar'); ?>
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->

        <!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Daftar Obat</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Berikut Daftar Obat yang tersedia :
                             <a href="<?php echo site_url('tambah-obat.html'); ?>">
                                <button  type="button" class="navbar-right btn btn-success" >Tambah Obat</button>
                            </a>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Id. Obat</th>
                                            <th>Nama</th>
                                            <th>Harga</th>
                                            <th>Gambar</th>
                                            <th>Jenis</th>
                                            <th>Kategori</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>Trident</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">X</td>
                                            <td class="center">X</td>
                                            <td class="center">X</td>
                                            <td class="center">
                                                <a href="<?php echo site_url('obat-edit.html'); ?>"></i>Edit</a>
                                                <a href="<?php echo site_url('obat-hapus.html'); ?>"></i>Hapus</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
        <!-- end page-wrapper -->
        
<?php $this->load->view('templates/v_apoteker_footer.php'); ?>
    <script src="<?php echo base_url('assets/plugins/dataTables/jquery.dataTables.js');?>"></script>
    <script src="<?php echo base_url('assets/plugins/dataTables/dataTables.bootstrap.js');?>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>