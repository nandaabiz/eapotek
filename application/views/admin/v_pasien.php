		<!--  page-wrapper -->
		<div id="page-wrapper">           
			<div class="row">
				 <!--  page header -->
				<div class="col-lg-12">
					<h1 class="page-header">Pasien</h1>
				</div>
				 <!-- end  page header -->
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-heading">
							 Berikut Daftar Pasien :
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover" id="mainTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Nama</th>
											<th>Email</th>
											<th>Aksi</th>
										</tr>
									</thead>
									<tbody>
										<?php
											if (!empty($pasien)) {
												foreach ($pasien as $key => $row) {
													echo "<tr>";
													echo "<td>".($key+1)."</td>";
													echo "<td>".$row['user_nama']."</td>";
													echo "<td>".$row['user_email']."</td>";
													echo "<td class = 'crud-actions'>
														<a href='".site_url('admin')."/update/".$row['user_id']."' class='btn btn-info'>view & edit</a>
														<a href='".site_url('admin')."/delete/".$row['user_id']."' class='btn btn-danger'>delete</a>
													</td>";
													echo "</tr>";
												}
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

	<script>
		$(document).ready(function () {
			$('#mainTable').dataTable();
		});
	</script>