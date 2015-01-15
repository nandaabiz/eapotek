<?php $this->load->view('templates/v_admin_header.php'); ?>

       <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <?php $this->load->view('templates/v_admin_sidebar'); ?>
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->

        <!--  page-wrapper -->
        <div id="page-wrapper">

            
            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Daftar Apotek</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Berikut Daftar Apotek :
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Id. Apotek</th>
                                            <th>Nama</th>
                                            <th>Alamat</th>
                                            <th>Koordinat</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = $this->db->get('apotek');
                                        foreach ($query->result() as $row) {
                                            echo "<tr>";
                                            echo "<td>".$row['apotek_id']."</td>";
                                            echo "<td>".$row['apotek_nama']."</td>";
                                            echo "<td>".$row['apotek_alamat']."</td>";
                                            echo "<td>".$row['apotek_koordinat_gps']."</td>";
                                            echo "<td class = 'crud-actions'>
                                                <a href='".site_url('admin')."/apotek/update/".$row['id']."' class='btn btn-info'>view & edit</a>
                                                <a href='".site_url('admin')."/apotek/delete/".$row['id']."' class='btn btn-danger'>delete</a>
                                            </td>";
                                            echo "</tr>";
                                        }
                                        ?>
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

<?php $this->load->view('templates/v_admin_footer.php'); ?>
    <script src="<?php echo base_url('assets/plugins/dataTables/jquery.dataTables.js');?>"></script>
    <script src="<?php echo base_url('assets/plugins/dataTables/dataTables.bootstrap.js');?>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>