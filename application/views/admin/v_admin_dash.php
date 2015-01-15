<?php  ?>

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
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hallo <?php echo $usertipe[0]['user_tipe_nama']; ?>! </b>Selamat Datang <b><?php echo $nama_user; ?> </b>
                    </div>
                </div>
                <!--end  Welcome -->
            </div>
        </div>
        <!-- end page-wrapper -->