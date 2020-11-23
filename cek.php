<?php
if(isset($_GET['pesan'])){
	echo $_GET['pesan'];
}
error_reporting(E_ALL & ~E_NOTICE);
if (empty($_SESSION['login_user'])){
	header('location:keluar');
}
else{
	switch($_GET['act']){
		default:
		if(isset($_GET['id_skpd'])){
			$id_skpd=$_GET['id_skpd'];
		}
		else{
			$id_skpd=1;
		}
		?>

		<!-- Page Header-->
		<header class="page-header">
			<div class="container-fluid">
				<h2 class="no-margin-bottom">Pegawai</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
					<li class="breadcrumb-item active">Pegawai</li>
				</ul>
			</div>
		</header>

	  	<section class="tables">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header align-items-center">
								<h3 class="h3 float-left">Data</h3>
								<span class="float-right">
									<a href="tambah-pegawai" class="btn btn-sm btn-primary" id="btnTambah"> <i class="fa fa-plus"></i>Tambah</a>
								</span>
							</div>
							<div class="card-body">
								<fieldset>
									<legend>Filter</legend>
									<form method="GET" class="form-horizontal">
										<div class="form-group row">
											<label class="col-sm-1">Unit Kerja</label>
											<div class="col-sm-4">
												<select name="id_skpd" class="form-control js-example-basic-single">
													<option value="0">Semua</option>
													<?php
													$tampil=mysqli_query($conn,"SELECT * FROM skpd ORDER BY urutan");
													while($r=mysqli_fetch_array($tampil)){
														if($id_skpd==$r['id_skpd']){
															echo"<option value='$r[id_skpd]' selected>$r[nama_skpd]</option>";
														}
														else{
															echo"<option value='$r[id_skpd]'>$r[nama_skpd]</option>";
														}
													}
													?>
												</select>
											</div>
											<div class="col-sm-2">
												<button type="submit" class="btn btn-info">Tampilkan</button>

											<a href="export-data-pegawai-baru?id_skpd=<?= $id_skpd; ?>" class="btn btn-success" target="_blank"><i class="fa fa-file-excel-o"></i> Export</a>
											<!-- <a href="export-data-pegawai?" class="btn btn-success" target="_blank"><i class="fa fa-file-excel-o"></i> Export</a> -->
											</div>
										</div>
									</form>
								</fieldset>
								<table class="table table-sm table-bordered" id="myTable">
									<thead>
										<tr>
											<th width="60px">No.</th>
											<th width="100px">Foto</th>
											<th>NIP</th>
											<th>Nama</th>
											<th>Pangkat</th>
											<th>Jabatan</th>
											<th>Unit Kerja</th>
											<th width="80px">Aksi</th>
										</tr>
									</thead>
									<tbody>
										<?php
										if($id_skpd!=0){
											$tampil = mysqli_query($conn,"SELECT * FROM pegawai WHERE status_pegawai='pegawai' AND status_pegawai_kerja='pns' AND deleted_at is null AND id_skpd='$id_skpd' ORDER BY id_pangkat DESC");
										}
										else{
											$tampil = mysqli_query($conn,"SELECT * FROM pegawai WHERE status_pegawai='pegawai' AND status_pegawai_kerja='pns' ORDER BY id_pangkat DESC");
										}
										$no=1;
										while($r=mysqli_fetch_array($tampil)){
											$j=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM jabatan  WHERE id_jabatan='$r[id_jabatan]'"));
											$s=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM skpd WHERE id_skpd='$r[id_skpd]'"));
											if($r['foto']==''){
												$foto="../../images/no_image.png";
											}
											else{
												$foto="../../images/img_pegawai/$r[foto]";
											}
											if($r['gelar_depan']!=''){
												if($r['gelar_belakang']!=''){
													$nama="$r[gelar_depan] $r[nama_pegawai], $r[gelar_belakang]";
												}
												else{
													$nama="$r[gelar_depan] $r[nama_pegawai]";
												}
											}
											else{
												if($r['gelar_belakang']!=''){
													$nama="$r[nama_pegawai], $r[gelar_belakang]";
												}
												else{
													$nama="$r[nama_pegawai]";
												}
											}

											if($r['plt']=='Y'){
												$nama_jabatan="Plt. $j[nama_jabatan]";
											}
											else{
												$nama_jabatan="$j[nama_jabatan]";
											}

											$a=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM pangkat WHERE id_pangkat='$r[id_pangkat]'"));
											$kode_pangkat=$a['kode_pangkat'];
											$nama_pangkat=$a['nama_pangkat'];
											$id_pegawai = $r["id_pegawai"];
										?>
											<tr>
												<th scope="row"><?php echo $no;?></th>
												<td><img src="<?php echo $foto;?>" class="img-fluid img-thumbnail img-circle" height="50px"></td>
												<td><?php echo $r['nip'];?></td>
												<td><?php echo $nama;?></a></td>
												<td><?php echo "$kode_pangkat";?></td>
												<td><?php echo $nama_jabatan;?></td>
												<td><?php echo $s['nama_skpd'];?></td>
												<td>
													<a href="#" class="btn btn-success btn-sm" onclick="myFunction()"><i class="fa fa-file-excel-o"></i> </a>
													<script> function myFunction(){ window.open('export-per-pegawai?id_pegawai=<?php echo $id_pegawai;?>', '_blank'); location.reload(); }
														</script>
													<a href="view-pegawai-<?php echo $r['id_pegawai'];?>" class="btn btn-warning btn-sm btn-flat mb-2" data-toggle="tooltip" data-placement="top" title="View" target="_blank"><i class="fa fa-eye"></i>
													</a>
													<a href="cetak-pegawai-<?php echo $r['id_pegawai'];?>" class="btn btn-info btn-sm btn-flat btnEdit mb-2" id="<?php echo $r['id_kgb'];?>" data-toggle="tooltip" data-placement="top" title="Cetak" target="_blank">
														<i class="fa fa-print"></i>
													</a>
													<br>
													<a href="aksi-hapus-pegawai-<?php echo $r['id_pegawai'];?>" onclick="return confirm('Anda yakin ingin menghapus data ini?')">
														<button type="button" class="btn btn-danger btn-flat btn-sm mb-2" data-toggle="tooltip" data-placement="top" title="Hapus">
															<i class="fa fa-trash"></i>
														</button>
													</a>

													<a href="resetpassword-pegawai-<?php echo $r['nip'];?>" class="btn btn-success btn-sm btn-flat mb-2" data-toggle="tooltip" data-placement="top" title="Reset Password">
														<i class="fa fa-cog"></i>
													</a>
												</td>
											</tr>
										<?php
											$no++;
										}
										?>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<?php
	break;


	case "tambahpegawai":
	?>
	<!-- Page Header-->
		<header class="page-header">
			<div class="container-fluid">
				<h2 class="no-margin-bottom">Tambah Pegawai</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
					<li class="breadcrumb-item"><a href="pegawai">Pegawai</a></li>
					<li class="breadcrumb-item active">Tambah</li>
				</ul>
			</div>
		</header>


		<section class="tables">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<form method="post" action="aksi-tambah-pegawai" enctype="multipart/form-data">
						<div class="card">
							<div class="card-header d-flex align-items-center">
								<h3 class="h4">Form Tambah</h3>
							</div>
							<div class="card-body">
								<?php
								echo"
								<div class='row'>
									<div class='col-sm-8'>
										<fieldset>
											<legend>Perorangan</legend>
											<div class='row'>
												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIK</label>
														<input type='number' class='form-control' name='nik' id='cek_nik' autofocus>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIP</label>
														<input type='number' class='form-control' name='nip' id='cek_nip' >
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIP Lama</label>
														<input type='number' class='form-control' name='nip_lama' >
													</div>
												</div>

												<div class='col-sm-3'>
													<div class='form-group'>
														<label>Gelar Depan</label>
														<input type='text' class='form-control' name='gelar_depan' >
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Nama Lengkap</label>
														<input type='text' class='form-control' name='nama_pegawai' >
													</div>
												</div>

												<div class='col-sm-3'>
													<div class='form-group'>
														<label>Gelar Belakang</label>
														<input type='text' class='form-control' name='gelar_belakang' >
													</div>
												</div>


												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Jenis Kelamin</label>
														<div class='radio'>
															<label class='radio-inline'><input type='radio' name='jenkel' value='P' checked>Pria</label><br>
															<label class='radio-inline'><input type='radio' name='jenkel' value='W'>Wanita</label>
														</div>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Agama</label>
														<select name='id_agama' class='form-control'>";
															$agama=mysqli_query($conn,"SELECT * FROM agama");
															while($a=mysqli_fetch_array($agama)){
																echo"<option value='$a[id_agama]'>$a[nama_agama]</option>";
															}
														echo"</select>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Status Perkawinan</label>
														<select name='status_kawin' class='form-control'>
															<option value='Belum Kawin'>Belum Kawin</option>
															<option value='Kawin'>Kawin</option>
															<option value='Janda'>Janda</option>
															<option value='Duda'>Duda</option>
														</select>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kegemaran (Hobby)</label>
														<input type='text' class='form-control' name='kegemaran' >
													</div>
												</div>

													<div class='col-sm-6'>
													<div class='form-group'>
														<label>Nomor HP</label>
														<input type='text' class='form-control' name='no_hp' >
													</div>
												</div>

											</div>
										</fieldset>
									</div>

									<div class='col-sm-4'>
										<fieldset>
											<legend>Keterangan Badan</legend>
											<div class='row'>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Tinggi (cm)</label>
														<input type='number' class='form-control' name='tinggi_badan'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Berat badan (kg)</label>
														<input type='number' class='form-control' name='berat_badan'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Rambut</label>
														<input type='text' class='form-control' name='rambut'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Bentuk muka</label>
														<input type='text' class='form-control' name='bentuk_muka'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Warna Kulit</label>
														<input type='text' class='form-control' name='warna_kulit'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Ciri Khas</label>
														<input type='text' class='form-control' name='ciri_khas'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Cacat Tubuh</label>
														<input type='text' class='form-control' name='cacat_tubuh'>
													</div>
												</div>

											</div>
										</fieldset>
									</div>
								</div>

								<div class='row'>
									<div class='col-sm-3'>
										<fieldset>
											<legend>Tempat Lahir</legend>
											<div class='form-group'>
												<label>Tempat Lahir</label>
												<input type='text' class='form-control' name='tempat_lahir'>
											</div>

											<div class='form-group'>
												<label>Kabupaten/ Kota Lahir</label>
												<select name='id_kabupaten_lahir' class='form-control select2 js-example-basic-single'>";
													$kabupaten=mysqli_query($conn,"SELECT * FROM kabupaten");
													while($k=mysqli_fetch_array($kabupaten)){
														echo"<option value='$k[id_kabupaten]'>$k[nama_kabupaten]</option>";
													}
												echo"</select>
											</div>

											<div class='form-group'>
												<label>Tanggal Lahir</label>
												<div class='input-group'>
													<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
													<input type='date' class='form-control readonly' name='tanggal_lahir'>
												</div>
											</div>

										</fieldset>
									</div>

									<div class='col-sm-6'>
										<fieldset>
											<legend>Alamat Rumah</legend>

											<div class='form-group'>
												<label>Jalan</label>
												<input type='text' class='form-control' name='alamat_jalan'>
											</div>

											<div class='row'>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kelurahan/Desa</label>
														<input type='text' class='form-control' name='alamat_kelurahan'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kecamatan</label>
														<input type='text' class='form-control' name='alamat_kecamatan'>
													</div>
												</div>
											</div>

											<div class='row'>
											<div class='col-sm-6'>
													<div class='form-group'>
														<label>Provinsi</label>
														<select name='alamat_id_propinsi' class='form-control js-example-basic-single' id='id_provinsi'>";
														echo"<option value='0'>Pilih Propinsi</option>";
														$provinsi=mysqli_query($conn,"SELECT * FROM provinsi");
														while($k=mysqli_fetch_array($provinsi)){
															echo"<option value='$k[id_provinsi]'>$k[nama_provinsi]</option>";
														}
													echo"
														</select>
													</div>
												</div>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kabupaten/Kota</label>
														<select name='alamat_id_kabupaten' class='form-control js-example-basic-single' id='id_kabupaten'>";
															echo"<option value='0'>Pilih Kabupaten</option>";
															$kabupaten=mysqli_query($conn,"SELECT * FROM kabupaten");
															while($k=mysqli_fetch_array($kabupaten)){
																echo"<option value='$k[id_kabupaten]'>$k[nama_kabupaten]</option>";
															}
														echo"</select>
													</div>
												</div>


											</div>

										</fieldset>
									</div>
									<div class='col-sm-3'>
										<fieldset>
											<legend>Foto</legend>
											<div class='form-group'>
												<img id='preview_gambar2' src='img/default.png' width='250px' alt='' class='img-thumbnail'/>
												<input type='file' class='btn btn-white' name='fupload2' id='fupload2' onChange='readURL2(this);'>
											</div>
										</fieldset>
									</div>
								</div>
								";
								?>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-success btn-sm" id="simpan">SIMPAN</button>
								<a href="#" onClick="history.go(-1)"><button type="button" class="btn btn-danger btn-sm">BATAL</button></a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	<?php
	break;

	case "editpegawai":
	$d=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM pegawai WHERE id_pegawai='$_GET[id_pegawai]'"));
	$tanggal_lahir=DateToIndo2($d['tanggal_lahir']);
	?>
		<header class="page-header">
			<div class="container-fluid">
				<h2 class="no-margin-bottom">Edit Pegawai</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
					<li class="breadcrumb-item"><a href="pegawai">Pegawai</a></li>
					<li class="breadcrumb-item active">Edit</li>
				</ul>
			</div>
		</header>


		<section class="tables">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<form method="post" action="aksi-edit-pegawai" enctype="multipart/form-data">
						<div class="card">
							<div class="card-header d-flex align-items-center">
								<h3 class="h4">Form Edit</h3>
							</div>
							<div class="card-body">
								<?php
								echo"
								<input type='hidden' name='id_pegawai' value='$d[id_pegawai]'>
								<div class='row'>
									<div class='col-sm-8'>
										<fieldset>
											<legend>Perorangan</legend>
											<div class='row'>
												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIK</label>
														<input type='text' class='form-control' name='nik' value='$d[nik]' autofocus>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIP</label>
														<input type='text' class='form-control' name='nip' value='$d[nip]'>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>NIP Lama</label>
														<input type='text' class='form-control' name='nip_lama' value='$d[nip_lama]'>
													</div>
												</div>

												<div class='col-sm-3'>
													<div class='form-group'>
														<label>Gelar Depan</label>
														<input type='text' class='form-control' name='gelar_depan' value='$d[gelar_depan]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Nama Lengkap</label>
														<input type='text' class='form-control' name='nama_pegawai' value='$d[nama_pegawai]'>
													</div>
												</div>

												<div class='col-sm-3'>
													<div class='form-group'>
														<label>Gelar Belakang</label>
														<input type='text' class='form-control' name='gelar_belakang' value='$d[gelar_belakang]'>
													</div>
												</div>


												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Jenis Kelamin</label>
														<div class='radio'>
															<label class='radio-inline'><input type='radio' name='jenkel' value='P'"; if($d['jenkel']=='P') {echo" checked";} echo">Pria</label>
															<label class='radio-inline'><input type='radio' name='jenkel' value='W'"; if($d['jenkel']=='W') {echo" checked";} echo">Wanita</label>
														</div>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Agama</label>
														<select name='id_agama' class='form-control'>";
															$agama=mysqli_query($conn,"SELECT * FROM agama");
															while($a=mysqli_fetch_array($agama)){
																if($d['id_agama']==$a['id_agama']){
																	echo"<option value='$a[id_agama]' selected>$a[nama_agama]</option>";
																}
																else{
																	echo"<option value='$a[id_agama]'>$a[nama_agama]</option>";
																}
															}
														echo"</select>
													</div>
												</div>

												<div class='col-sm-4'>
													<div class='form-group'>
														<label>Status Perkawinan</label>
														<select name='status_kawin' class='form-control'>
															<option value='Belum Kawin'"; if($d['status_kawin']=='Belum Kawin'){echo "selected";}
															echo">Belum Kawin</option>
															<option value='Kawin'"; if($d['status_kawin']=='Kawin'){echo "selected";}
															echo">Kawin</option>
															<option value='Janda'"; if($d['status_kawin']=='Janda'){echo "selected";}
															echo">Janda</option>
															<option value='Duda'"; if($d['status_kawin']=='Duda'){echo "selected";}
															echo">Duda</option>
														</select>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kegemaran (Hobby)</label>
														<input type='text' class='form-control' name='kegemaran' value='$d[kegemaran]'>
													</div>
												</div>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Nomor HP</label>
														<input type='text' class='form-control' name='no_hp' value='$d[no_hp]'>
													</div>
												</div>

											</div>
										</fieldset>
									</div>

									<div class='col-sm-4'>
										<fieldset>
											<legend>Keterangan Badan</legend>
											<div class='row'>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Tinggi (cm)</label>
														<input type='number' class='form-control' name='tinggi_badan' value='$d[tinggi_badan]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Berat badan (kg)</label>
														<input type='number' class='form-control' name='berat_badan' value='$d[berat_badan]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Rambut</label>
														<input type='text' class='form-control' name='rambut' value='$d[rambut]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Bentuk muka</label>
														<input type='text' class='form-control' name='bentuk_muka' value='$d[bentuk_muka]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Warna Kulit</label>
														<input type='text' class='form-control' name='warna_kulit' value='$d[warna_kulit]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Ciri Khas</label>
														<input type='text' class='form-control' name='ciri_khas' value='$d[ciri_khas]'>
													</div>
												</div>

												<div class='col-sm-12'>
													<div class='form-group'>
														<label>Cacat Tubuh</label>
														<input type='text' class='form-control' name='cacat_tubuh' value='$d[cacat_tubuh]'>
													</div>
												</div>

											</div>
										</fieldset>
									</div>
								</div>

								<div class='row'>
									<div class='col-sm-3'>
										<fieldset>
											<legend>Kelahiran</legend>
											<div class='form-group'>
												<label>Tempat Lahir</label>
												<input type='text' class='form-control' name='tempat_lahir' value='$d[tempat_lahir]'>
											</div>

											<div class='form-group'>
												<label>Kabupaten/ Kota Lahir</label>
												<select name='id_kabupaten_lahir' class='form-control js-example-basic-single'>";
													$kabupaten=mysqli_query($conn,"SELECT * FROM kabupaten");
													while($k=mysqli_fetch_array($kabupaten)){
														if($k['id_kabupaten']==$d['id_kabupaten_lahir']){
															echo"<option value='$k[id_kabupaten]' selected>$k[nama_kabupaten]</option>";
														}
														else{
															echo"<option value='$k[id_kabupaten]'>$k[nama_kabupaten]</option>";
														}
													}
												echo"</select>
											</div>

											<div class='form-group'>
												<label>Tanggal Lahir</label>
												<div class='input-group'>
													<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
													<input class='form-control' size='10' type='text' name='tanggal_lahir' value='$tanggal_lahir' id='datepicker'>
												</div>
											</div>

										</fieldset>
									</div>

									<div class='col-sm-6'>
										<fieldset>
											<legend>Alamat Rumah</legend>

											<div class='form-group'>
												<label>Jalan</label>
												<input type='text' class='form-control' name='alamat_jalan' value='$d[alamat_jalan]'>
											</div>

											<div class='row'>
												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kelurahan/Desa</label>
														<input type='text' class='form-control' name='alamat_kelurahan' value='$d[alamat_kelurahan]'>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kecamatan</label>
														<input type='text' class='form-control' name='alamat_kecamatan' value='$d[alamat_kecamatan]'>
													</div>
												</div>
											</div>

											<div class='row'>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Provinsi</label>
														<select name='alamat_id_propinsi' class='form-control js-example-basic-single' id='id_provinsi'>";
														echo"<option value='0'>Pilih Propinsi</option>";
														$provinsi=mysqli_query($conn,"SELECT * FROM provinsi");
														while($k=mysqli_fetch_array($provinsi)){
															if($k['id_provinsi']==$d['alamat_id_propinsi']){
																echo"<option value='$k[id_provinsi]' selected>$k[nama_provinsi]</option>";
															}
															else{
																echo"<option value='$k[id_provinsi]'>$k[nama_provinsi]</option>";
															}
														}
													echo"
														</select>
													</div>
												</div>

												<div class='col-sm-6'>
													<div class='form-group'>
														<label>Kabupaten/Kota</label>
														<select name='alamat_id_kabupaten' class='form-control js-example-basic-single' id='id_kabupaten'>";
															echo"<option value='0'>Pilih Kabupaten</option>";
															$kabupaten=mysqli_query($conn,"SELECT * FROM kabupaten");
															while($k=mysqli_fetch_array($kabupaten)){
																if($k['id_kabupaten']==$d['alamat_id_kabupaten']){
																	echo"<option value='$k[id_kabupaten]' selected>$k[nama_kabupaten]</option>";
																}
																else{
																	echo"<option value='$k[id_kabupaten]'>$k[nama_kabupaten]</option>";
																}
															}
														echo"</select>
													</div>
												</div>
											</div>

										</fieldset>
									</div>
									<div class='col-sm-3'>
										<fieldset>
											<legend>Foto</legend>
											<div class='form-group'>
												<input type='hidden' name='foto' value='$d[foto]'>";
												if(!empty($d['foto'])){
													echo"<img id='preview_gambar2' src='../../images/img_pegawai/$d[foto]' class='img-thumbnail'/>";
													echo"<input type='file' class='btn btn-white' name='fupload2' id='fupload2' onChange='readURL2(this);'>";
												}
												else{
													echo"<img id='preview_gambar2' src='img/default.png' width='250px' alt='' class='img-thumbnail'/>";
													echo"<input type='file' class='btn btn-white' name='fupload2' id='fupload2' onChange='readURL2(this);'>";
												}
												echo"
											</div>
										</fieldset>
									</div>
								</div>
								";
								?>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-success btn-sm">SIMPAN</button>
								<a href="#" onClick="history.go(-1)"><button type="button" class="btn btn-danger btn-sm">BATAL</button></a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	<?php
	break;

	case "editpns":
	$d=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM pegawai WHERE id_pegawai='$_GET[id_pegawai]'"));
	$tmtcapeg = DateToIndo2($d['tmtcapeg']);
	$tmtpns=DateToIndo2($d['tmtpns']);
	$tmtkgb=DateToIndo2($d['tmtkgb']);
	$tmtkgbyad=DateToIndo2($d['tmtkgbyad']);
	$tmtberlaku=DateToIndo2($d['tmtberlaku']);
	$tmtstop=DateToIndo2($d['tmtstop']);

	?>
		<header class="page-header">
			<div class="container-fluid">
				<h2 class="no-margin-bottom">Edit Data PNS Pegawai</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
					<li class="breadcrumb-item"><a href="pegawai">Pegawai</a></li>
					<li class="breadcrumb-item active">Edit Data PNS</li>
				</ul>
			</div>
		</header>


		<section class="tables">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<form method="post" action="aksi-edit-pns" enctype="multipart/form-data">
						<div class="card">
							<div class="card-header d-flex align-items-center">
								<h3 class="h4">Form Edit</h3>
							</div>
							<div class="card-body">
								<?php
								echo"
								<input type='hidden' name='id_pegawai' value='$d[id_pegawai]'>
								<fieldset>
									<legend>PNS</legend>
									<div class='form-group row'>
										<label class='col-sm-2 control-label'>Unit Kerja</label>
										<div class='col-sm-4'>
											<select name='id_skpd'  class='form-control select2 js-example-basic-single' id='id_skpd_jabatan'>";
												$skpd=mysqli_query($conn,"SELECT * FROM skpd ORDER BY nama_skpd");
												echo"<option value=''>Pilih SKPD</option>";
												while($s=mysqli_fetch_array($skpd)){
													if($s['id_skpd']==$d['id_skpd']){
														echo"<option value='$s[id_skpd]' selected>$s[nama_skpd]</option>";
													}
													else{
														echo"<option value='$s[id_skpd]'>$s[nama_skpd]</option>";
													}
												}
											echo"</select>
										</div>

										<label class='col-sm-2 control-label'>Jabatan</label>
										<div class='col-sm-4'>
											<select name='id_jabatan' id='id_jabatan' class='form-control select2 js-example-basic-single'>
												<option value=''>Pilih Jabatan</option>";
												$jabatan=mysqli_query($conn,"SELECT * FROM jabatan WHERE id_skpd='$d[id_skpd]'");
												while($j=mysqli_fetch_array($jabatan)){
													if($j['id_jabatan']==$d['id_jabatan']){
														echo"<option value='$j[id_jabatan]' selected>$j[nama_jabatan]</option>";
													}
													else{
														echo"<option value='$j[id_jabatan]'>$j[nama_jabatan]</option>";
													}
												}
											echo"</select>
										</div>

									</div>

									<div class='form-group row'>
										<label class='col-sm-2 control-label'>Plt</label>
										<div class='col-sm-4'>
											<label class='radio-inline'>
												<input type='radio' name='plt' value='Y'"; if($d['plt']=='Y'){echo "checked";} echo">Ya
											</label>
											<label class='radio-inline'>
												<input type='radio' name='plt' value='N'"; if($d['plt']=='N'){echo "checked";} echo">Tidak
											</label>
										</div>
									</div>

									<div class='form-group row'>
										<label class='col-sm-2 control-label'>Pangkat dan Golongan Ruang</label>
										<div class='col-sm-4'>
											<select name='id_pangkat' class='form-control'>
												<option value=''>Pilih Pangkat</option>";
												$pangkat=mysqli_query($conn,"SELECT * FROM pangkat");
												while($p=mysqli_fetch_array($pangkat)){
													if($p['id_pangkat']==$d['id_pangkat']){
														echo"<option value='$p[id_pangkat]' selected>$p[nama_pangkat] ($p[kode_pangkat])</option>";
													}
													else{
														echo"<option value='$p[id_pangkat]'>$p[nama_pangkat] ($p[kode_pangkat])</option>";
													}
												}
											echo"</select>
										</div>
										<label class='col-sm-2 control-label'>Eselon</label>
										<div class='col-sm-4'>
											<select name='id_eselon' class='form-control'>
											<option value=''>Pilih Eselon</option>";
											$eselon=mysqli_query($conn,"SELECT * FROM eselon");
											while($p=mysqli_fetch_array($eselon)){
												if($p['id_eselon']==$d['id_eselon']){
													echo"<option value='$p[id_eselon]' selected>$p[nama_eselon]</option>";
												}
												else{
													echo"<option value='$p[id_eselon]'>$p[nama_eselon]</option>";
												}
											}
										echo"
											</select>
										</div>
									</div>

									<div class='form-group row'>
										<label class='col-sm-2 control-label'>TMT Capeg</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtcapeg' value='$tmtcapeg' id='datepicker'>
											</div>
										</div>

										<label class='col-sm-2 control-label'>TMT PNS</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtpns' value='$tmtpns' id='datepicker2'>
											</div>
										</div>


										<label class='col-sm-2 control-label'>TMT KGB</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtkgb' value='$tmtkgb' id='datepicker3'>
											</div>
										</div>


									</div>

									<div class='form-group row'>

										<label class='col-sm-2 control-label'>TMT KGBYAD</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtkgbyad' value='$tmtkgbyad' id='datepicker4'>
											</div>
										</div>
										<!--
										<label class='col-sm-2 control-label'>TMT Berlaku</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtberlaku' value='$tmtberlaku' >
											</div>
										</div>-->

										<label class='col-sm-2 control-label'>TMT Stop</label>
										<div class='col-sm-2'>
											<div class='input-group'>
												<span class='input-group-addon khusus'><i class='fa fa-calendar'></i></span>
												<input class='form-control' size='10' type='text' name='tmtstop' value='$tmtstop' id='datepicker5'>
											</div>
										</div>

										<label class='col-sm-2 control-label'>Masa Kerja Golongan</label>
										<div class='col-sm-2'>
											<input type='number' class='form-control' name='mkgolt' value='$d[mkgolt]'>
										</div>

									</div>

									<div class='form-group row'>
										<!--<label class='col-sm-2 control-label'>MKGOLT</label>
										<div class='col-sm-2'>
											<input type='number' class='form-control' name='mkgolt' value='$d[mkgolt]'>
										</div>-->

										<label class='col-sm-2 control-label'>NPWP</label>
										<div class='col-sm-3'>
											<input type='text' class='form-control' name='npwp' value='$d[npwp]'>
										</div>

										<label class='col-sm-2 control-label'>Masuk ke Handkey</label>
										<div class='col-sm-2'>
											<div class='radio'>
											  <label><input type='radio' name='status_hk' value='Y'"; if($d['status_hk']=='Y'){echo"checked";} echo">Ya</label>
											</div>
											<div class='radio'>
											  <label><input type='radio' name='status_hk' value='N'"; if($d['status_hk']=='N'){echo"checked";} echo">Tidak</label>
											</div>
										</div>


										<label class='col-sm-1 control-label'>PIN</label>
										<div class='col-sm-2'>
											<input type='number' class='form-control' name='pin' value='$d[pin]'>
											<small>Diisi jika pegawai dimasukkan ke data absen dengan mesin HK</small>
										</div>

										<label class='col-sm-2 control-label'>Ubah Password </label>
										<div class='col-sm-3'>
											<input type='text' class='form-control' name='password'>
										</div>

									</div>
								</fieldset>
								";
								?>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-success btn-sm">SIMPAN</button>
								<a href="#" onClick="history.go(-1)"><button type="button" class="btn btn-danger btn-sm">BATAL</button></a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	<?php
	break;

	case "viewpegawai":
	$a=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM pegawai WHERE id_pegawai='$_GET[id_pegawai]'"));
	$tanggal_lahir=DateToIndo($a['tanggal_lahir']);

	if($a['foto']==''){
		$foto="../../images/no_image.png";
	}
	else{
		$foto="../../images/img_pegawai/$a[foto]";
	}


	if($a['gelar_belakang']!=''){
		if($a['gelar_depan']!=''){
			$nama="$a[gelar_depan] $a[nama_pegawai], $a[gelar_belakang]";
		}
		else{
			$nama="$a[nama_pegawai], $a[gelar_belakang]";
		}
	}
	else{
		$nama="$a[nama_pegawai]";
	}

	if($a['jenkel']=='P'){
		$jenkel='Pria';
	}
	else{
		$jenkel='Wanita';
	}

	$b=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM kabupaten WHERE id_kabupaten='$a[id_kabupaten_lahir]'"));
	$c=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM agama WHERE id_agama='$a[id_agama]'"));
	$d=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM kabupaten WHERE id_kabupaten='$a[alamat_id_kabupaten]'"));
	$e=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM provinsi WHERE id_provinsi='$a[alamat_id_propinsi]'"));

	if($a['status_verifikasi']=='verified'){
		$status_data="<label class='label label-success'>Verified</label>";
	}
	else{
		$status_data="<label class='label label-warning'>Un-Verified</label>";
	}
	?>
	<header class="page-header">
			<div class="container-fluid">
				<h2 class="no-margin-bottom">Detail Pegawai</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
					<li class="breadcrumb-item"><a href="pegawai">Pegawai</a></li>
					<li class="breadcrumb-item active">Detail</li>
				</ul>
			</div>
		</header>


		<section class="tables">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header d-flex align-items-center">
								<h3 class="h4">Detail Pegawai</h3>
							</div>
								<div class="card-body">
											<a href="export-data-pegawai-detail?id_pegawai=<?= $a["id_pegawai"]; ?>" class="btn btn-success" target="_blank"><i class="fa fa-file-excel-o"></i> Export</a>
								<?php
								echo"
								<fieldset id='section1'>
									<legend>Perorangan</legend>

									<div class='row'>
										<div class='col-sm-8'>
											<table class='table table-bordered table-sm'>
												<tr><td width='100px' colspan='2'>N.I.K</td><td width='50%'>$a[nik]</td></tr>
												<tr><td colspan='2'>N.I.P</td><td>$a[nip]</td></tr>
												<tr><td colspan='2'>N.I.P Lama</td><td>$a[nip_lama]</td></tr>
												<tr><td colspan='2'>Nama Lengkap</td><td>$nama</td></tr>
												<tr><td rowspan='3'>Tempat Lahir / Tanggal Lahir</td><td>Tempat Lahir</td><td>$a[tempat_lahir]</td></tr>
												<tr><td>Kabupaten/Kota Lahir</td><td>$b[nama_kabupaten]</td></tr>
												<tr><td>Tanggal Lahir</td><td>$tanggal_lahir</td></tr>
												<tr><td colspan='2'>Nomor HP</td><td>$a[no_hp]</td></tr>
												<tr><td colspan='2'>Jenis Kelamin</td><td>$jenkel</td></tr>
												<tr><td colspan='2'>Agama</td><td>$c[nama_agama]</td></tr>
												<tr><td colspan='2'>Status Perkawinan</td><td>$a[status_kawin]</td></tr>
												<tr><td rowspan='5'>Alamat Rumah</td><td>Jalan</td><td>$a[alamat_jalan]</td></tr>
												<tr><td>Kelurahan/Desa</td><td>$a[alamat_kelurahan]</td></tr>
												<tr><td>Kecamatan</td><td>$a[alamat_kecamatan]</td></tr>
												<tr><td>Kabupaten/Kota</td><td>$d[nama_kabupaten]</td></tr>
												<tr><td>Propinsi</td><td>$e[nama_provinsi]</td></tr>
												<tr><td rowspan='7'>Keterangan Badan</td><td>Tinggi</td><td>$a[tinggi_badan] cm</td></tr>
												<tr><td>Berat Badan</td><td>$a[berat_badan] kg</td></tr>
												<tr><td>Rambut</td><td>$a[rambut]</td></tr>
												<tr><td>Bentuk muka</td><td>$a[bentuk_muka]</td></tr>
												<tr><td>Warna Kulit</td><td>$a[warna_kulit]</td></tr>
												<tr><td>Ciri Khas</td><td>$a[ciri_khas]</td></tr>
												<tr><td>Cacat Tubuh</td><td>$a[cacat_tubuh]</td></tr>
												<tr><td colspan='2'>Kegemaran (Hobby)</td><td>$a[kegemaran]</td></tr>
											</table>
											<a href='edit-pegawai-$a[id_pegawai]' class='btn btn-warning btn-flat'>Edit</a>
										</div>
										<div class='col-sm-2'>
											<img src='$foto' class='img-responsive img-thumbnail'>
										</div>
									</div>
								</fieldset>";

								$f=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM satker WHERE id_satker='$a[id_satker]'"));
								$g=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM skpd WHERE id_skpd='$a[id_skpd]'"));
								$h=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM jabatan WHERE id_jabatan='$a[id_jabatan]'"));
								$i=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM pangkat WHERE id_pangkat='$a[id_pangkat]'"));
								$j=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM fungsi WHERE id_fungsi='$a[id_fungsi]'"));
								$k=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM guru WHERE id_guru='$a[id_guru]'"));
								$l=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM eselon WHERE id_eselon='$a[id_eselon]'"));
								$nama_jabatan="$h[nama_jabatan]";
								if($a['plt']=='Y'){
									$nama_jabatan="Plt. $h[nama_jabatan]";
								}

								$tmtcapeg=DateToIndo($a['tmtcapeg']);
								$tmtpns=DateToIndo($a['tmtpns']);
								$tmtkgb=DateToIndo($a['tmtkgb']);
								$tmtkgbyad=DateToIndo($a['tmtkgbyad']);
								$tmtberlaku=DateToIndo($a['tmtberlaku']);
								$tmtstop=DateToIndo($a['tmtstop']);
								$gaji=mysqli_fetch_array(mysqli_query($conn,"SELECT * from pangkat_gaji where id_pangkat='$a[id_pangkat]' and masa_kerja <'$a[mkgolt]' order by masa_kerja limit 1"));
								$mkbulan=intval($a['mkgolt'] % 12);
								$mktahun=floor($a['mkgolt'] / 12);
								echo"
								<fieldset id='section2'>
									<legend>PNS</legend>
									<table class='table table-bordered table-sm'>
										<tr><td>Unit Kerja (SKPD)</td><td>$g[nama_skpd]</td></tr>
										<tr><td>Jabatan</td><td>$nama_jabatan</td></tr>
										<tr><td>Pangkat dan Golongan Ruang</td><td>$i[nama_pangkat] $i[kode_pangkat] </td></tr>
										<tr><td>Eselon</td><td>$l[nama_eselon]</td></tr>
										<tr><td>TMT Capeg</td><td>$tmtcapeg</td></tr>
										<tr><td>TMT PNS</td><td>$tmtpns</td></tr>
										<tr><td>Masa Kerja Golongan (MKGOLT)</td><td>$mktahun Tahun $mkbulan bulan</td></tr>
										<tr><td>Gaji Pangkat</td><td>$gaji[upah]</td></tr>
										<tr><td>TMT KGB</td><td>$tmtkgb</td></tr>
										<tr><td>TMT KGBYAD</td><td>$tmtkgbyad</td></tr>
										<tr><td>NPWP</td><td>$a[npwp]</td></tr>
										<tr><td>TMT Stop</td><td>$tmtstop</td></tr>";
										if($a['status_hk']=='Y'){
											$status_hk="Diikutsertakan";
										}
										else{
											$status_hk="Tidak diikutsertakan";
										}
										echo"
										<tr><td>Status Handkey</td><td>$status_hk</td></tr>
										<tr><td>PIN</td><td>$a[pin]</td></tr>
									</table>
									<a href='edit-pns-$a[id_pegawai]' class='btn btn-warning btn-flat'>Edit</a>
								</fieldset>
								<fieldset id='section18'>
									<legend>Berkas Diri</legend>
									<table class='table table-striped table-bordered'>
										<thead class='text-center'>
											<tr>
												<th rowspan='2'>No</th>
												<th rowspan='2'>Nama Berkas</th>
												<th rowspan='3'>Download</th>
												<th rowspan='2'>Aksi</th>
											</tr>

										</thead>
										<tbody>";
										$no=1;
										$pegawai_berkas=mysqli_query($conn,"SELECT * FROM pegawai_berkas WHERE id_pegawai='$a[id_pegawai]'");
										$jumlah=mysqli_fetch_array(mysqli_query($conn,"SELECT COUNT(id_pegawai_berkas) as jumlah FROM pegawai_berkas WHERE id_pegawai='$a[id_pegawai]'"));
										while($p=mysqli_fetch_array($pegawai_berkas)){
											echo"<tr>
												<td>$no</td>
												<td>$p[nama]</td>
												<td><a href='../../../../berkas/berkas/$p[file]' target='_blank' >Download</a></td>
												<td><a 	href='edit-berkaspegawai-$p[id_pegawai_berkas]'>
												<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
												?>
												<a 	href="hapus-berkaspegawai-<?php echo $p['id_pegawai_berkas'];?>"onclick="return confirm('Lanjut?')">
												<?php
												echo"
												<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
											</tr>";
											$no++;
										}
										echo"
										</tbody>
									</table>
									";
									if($jumlah['jumlah']<14){
									echo "<a href='tambah-berkaspegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>";
									}
									echo"
								</fieldset>
								<fieldset id='section3'>
									<legend>Histori Pendidikan</legend>
									<fieldset>
										<legend>1. Pendidikan Di Dalam dan Luar Negeri</legend>

										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>Tingkat</th>
													<th>Nama Sekolah/Universitas</th>
													<th>Jurusan</th>
													<th>STTB/Tanda Lulus/<br>Tahun Ijazah</th>
													<th>Alamat</th>
													<th>Nama Kepala Sekolah / <br>Direktur/ Dekan / Promotor</th>
													<th>Berkas</th>
													<th width='100px'>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_pendidikan=mysqli_query($conn,"SELECT * FROM pegawai_pendidikan a, tingkat_pendidikan b WHERE a.id_tingkat_pendidikan=b.id_tingkat_pendidikan AND a.id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_pendidikan)){
												echo"<tr>
													<td>$no</td>
													<td>$p[nama_tingkat_pendidikan]</td>
													<td>$p[nama_pendidikan]</td>
													<td>$p[jurusan]</td>
													<td>$p[sttb]</td>
													<td>$p[tempat]</td>
													<td>$p[nama_kepala]</td>
													<td><a href='../../berkas/pendidikan/$p[file_sttb]' target='_blank' >$p[file_sttb]</a></td>
													<td><a 	href='edit-pendidikanpegawai-$p[id_pegawai_pendidikan]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-pendidikanpegawai-<?php echo $p['id_pegawai_pendidikan'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-pendidikanpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section4'>
										<legend>2. Kursus/Latihan Di Dalam dan Luar Negeri</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>Nama Kursus/Latihan</th>
													<th>Lamanya</th>
													<th>Ijazah/Tanda Lulus/Surat Ket (TH)</th>
													<th>Tempat</th>
													<th>Keterangan</th>
													<th>Berkas</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_pendidikan=mysqli_query($conn,"SELECT * FROM pegawai_kursus WHERE id_pegawai='$a[id_pegawai]' order by id_pegawai_kursus desc");
											while($p=mysqli_fetch_array($pegawai_pendidikan)){
												$tanggal_awal=DateToIndo2($p['tanggal_awal']);
												$tanggal_akhir=DateToIndo2($p['tanggal_akhir']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nama_kursus]</td>
													<td>$tanggal_awal s/d $tanggal_akhir</td>
													<td>$p[ijazah]</td>
													<td>$p[tempat]</td>
													<td>$p[keterangan]</td>
													<td><a href='../../berkas/kursus/$p[file_ijazah]' target='_blank'> $p[file_ijazah]</a></td>
													<td><a 	href='edit-kursuspegawai-$p[id_pegawai_kursus]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-kursuspegawai-<?php echo $p['id_pegawai_kursus'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-kursuspegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>
								</fieldset>
									<fieldset id='section5'>
										<legend>Riwayat Pekerjaan</legend>
										<fieldset>
											<legend>1. Riwayat Kepangkatan Golongan Ruang Penggajian</legend>
											<table class='table table-striped table-bordered'>
												<thead class='center'>
													<tr>
														<th rowspan='2'>No</th>
														<th rowspan='2'>Nama SK</th>
														<th rowspan='2'>File</th>
														<th rowspan='2'>Gol Ruang<br>Penggajian</th>
														<th rowspan='2'>Masa Kerja</th>
														<th rowspan='2'>Berlaku TMT</th>
														<th rowspan='2'>Gaji Pokok</th>
														<th colspan='3'>Surat Keputusan</th>
														<th rowspan='2'>Peraturan<br>Yang Dijadikan<br>Dasar</th>
														<th rowspan='2'>Aksi</th>
													</tr>
													<tr>
														<th>Pejabat</th>
														<th>Nomor</th>
														<th>Tgl</th>
													</tr>
												</thead>
												<tbody>";
												$no=1;
												$pegawai_golongan=mysqli_query($conn,"SELECT * FROM pegawai_golongan WHERE id_pegawai='$a[id_pegawai]' order by id_pangkat DESC, berlaku_tmt desc");
												while($p=mysqli_fetch_array($pegawai_golongan)){
													$golx=mysqli_fetch_array(mysqli_query($conn,"SELECT * from pangkat where id_pangkat='$p[id_pangkat]'"));
													$berlaku_tmt=DateToIndo2($p['berlaku_tmt']);
													$gaji_pokok=formatRupiah($p['gaji_pokok']);
													$tanggal_keputusan=DateToIndo2($p['tanggal_keputusan']);
													$mkbulan=$p['masa'] % 12;
$mktahun=floor($p['masa'] / 12);

													echo"<tr>
														<td>$no</td>
														<td>$p[pangkat]</td>
														<td><a href='../../../../berkas/berkas/$p[file]' target='_blank' >Download</a></td>
														<td>$golx[nama_pangkat] ($golx[kode_pangkat]) </td>
														<td>$mktahun Tahun $mkbulan bulan</td>
														<td>$berlaku_tmt</td>
														<td>$gaji_pokok</td>
														<td>$p[pejabat_keputusan]</td>
														<td>$p[nomor_keputusan]</td>
														<td>$tanggal_keputusan</td>
														<td>$p[keterangan]</td>
														<td><a 	href='edit-golonganpegawai-$p[id_pegawai_golongan]'>
														<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
														?>
														<a 	href="hapus-golonganpegawai-<?php echo $p['id_pegawai_golongan'];?>"onclick="return confirm('Lanjut?')">
														<?php
														echo"
														<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
													</tr>";
													$no++;
												}
												echo"
												</tbody>
											</table>

											<a href='tambah-golonganpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
										</fieldset>

										<fieldset id='section6'>
										<legend>2. Pengalaman Jabatan / Pekerjaan</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th rowspan='2'>No</th>
													<th rowspan='2'>Jabatan<br>Pekerjaan</th>
													<th rowspan='2'>Mulai dan Sampai</th>
													<th rowspan='2'>Gol<br>Ruang<br>Gaji</th>
													<th rowspan='2'>Gaji Pokok</th>
													<th colspan='3'>Surat Keputusan</th>
													<th rowspan='2'>Aksi</th>
												</tr>
												<tr>
													<th>Pejabat</th>
													<th>Nomor Keputusan</th>
													<th>Tgl</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_pangkat=mysqli_query($conn,"SELECT * FROM pegawai_pangkat WHERE id_pegawai='$a[id_pegawai]' order by golongan desc");
											while($p=mysqli_fetch_array($pegawai_pangkat)){
												$tanggal_mulai=DateToIndo2($p['tanggal_mulai']);
												if($p['sekarang']=='Y'){
													$tanggal_akhir="sekarang";
												}
												else{
													$tanggal_akhir=DateToIndo2($p['tanggal_akhir']);
												}
												$gaji_pokok=formatRupiah($p['gaji_pokok']);
												$tanggal_keputusan=DateToIndo2($p['tanggal_keputusan']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nama_jabatan]</td>
													<td>$tanggal_mulai s/d $tanggal_akhir</td>
													<td>$p[golongan]</td>
													<td>$gaji_pokok</td>
													<td>$p[pejabat_keputusan]</td>
													<td><a href='../../berkas/pendidikan/$p[file_sttb]' target='_blank' >$p[no_keputusan]</a></td>
													<td>$tanggal_keputusan</td>
													<td><a 	href='edit-pangkatpegawai-$p[id_pegawai_pangkat]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-pangkatpegawai-<?php echo $p['id_pegawai_pangkat'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-pangkatpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>
								</fieldset>

								<fieldset id='section7'>
									<legend>Tanda Jasa / Penghargaan</legend>
									<table class='table table-striped table-bordered'>
										<thead class='center'>
											<tr>
												<th>No</th>
												<th>Nama Bintang/SatyaLencana<br>Penghargaan</th>
												<th>Tahun Perolehan</th>
												<th>Nama Negara<br>Instansi yang Memberi</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tbody>";
										$no=1;
										$pegawai_penghargaan=mysqli_query($conn,"SELECT * FROM pegawai_penghargaan WHERE id_pegawai='$a[id_pegawai]'");
										while($p=mysqli_fetch_array($pegawai_penghargaan)){
											echo"<tr>
												<td>$no</td>
												<td>$p[nama_penghargaan]</td>
												<td>$p[tahun_perolehan]</td>
												<td>$p[nama_negara]</td>
												<td><a 	href='edit-penghargaanpegawai-$p[id_pegawai_penghargaan]'>
												<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
												?>
												<a 	href="hapus-penghargaanpegawai-<?php echo $p['id_pegawai_penghargaan'];?>"onclick="return confirm('Lanjut?')">
												<?php
												echo"
												<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
											</tr>";
											$no++;
										}
										echo"
										</tbody>
									</table>

									<a href='tambah-penghargaanpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
								</fieldset>

								<fieldset id='section8'>
									<legend>Pengalaman Ke Luar Negeri</legend>
									<table class='table table-striped table-bordered'>
										<thead class='center'>
											<tr>
												<th>No</th>
												<th>Negara</th>
												<th>Tujuan Kunjungan</th>
												<th>Lamanya</th>
												<th>Yang Membiayai</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tbody>";
										$no=1;
										$pegawai_pengalaman=mysqli_query($conn,"SELECT * FROM pegawai_pengalaman WHERE id_pegawai='$a[id_pegawai]'");
										while($p=mysqli_fetch_array($pegawai_pengalaman)){
											echo"<tr>
												<td>$no</td>
												<td>$p[nama_negara]</td>
												<td>$p[tujuan_kunjungan]</td>
												<td>$p[lamanya]</td>
												<td>$p[sponsor]</td>
												<td><a 	href='edit-pengalamanpegawai-$p[id_pegawai_pengalaman]'>
												<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
												?>
												<a 	href="hapus-pengalamanpegawai-<?php echo $p['id_pegawai_pengalaman'];?>"onclick="return confirm('Lanjut?')">
												<?php
												echo"
												<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
											</tr>";
											$no++;
										}
										echo"
										</tbody>
									</table>

									<a href='tambah-pengalamanpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
								</fieldset>


								<fieldset>
									<legend>Keterangan Keluarga</legend>

									<fieldset id='section9'>
										<legend>1. Istri/Suami</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>NIK</th>
													<th>Nama</th>
													<th>Tempat<br>Lahir</th>
													<th>Tanggal<br>Lahir</th>
													<th>Tanggal Menikah</th>
													<th>Pekerjaan</th>
													<th>Keterangan</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_suami=mysqli_query($conn,"SELECT * FROM pegawai_suami WHERE id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_suami)){
												$tanggal_lahir=DateToIndo($p['tanggal_lahir']);
												$tanggal_menikah=DateToIndo($p['tanggal_menikah']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nik]</td>
													<td>$p[nama]</td>
													<td>$p[tempat_lahir]</td>
													<td>$tanggal_lahir</td>
													<td>$tanggal_menikah</td>
													<td>$p[pekerjaan]</td>
													<td>$p[keterangan]</td>
													<td><a 	href='edit-suamipegawai-$p[id_pegawai_suami]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-suamipegawai-<?php echo $p['id_pegawai_suami'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-suamipegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section10'>
										<legend>2. Anak</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>NIK</th>
													<th>Nama</th>
													<th>Jenis<br>Kelamin</th>
													<th>Tempat<br>Lahir</th>
													<th>Tanggal<br>Lahir</th>
													<th>Sekolah<br>Pekerjaan</th>
													<th>Keterangan</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_anak=mysqli_query($conn,"SELECT * FROM pegawai_anak WHERE id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_anak)){
												if($p['jenkel']=='P'){
													$jenkel="Pria";
												}
												else{
													$jenkel="Wanita";
												}
												$tanggal_lahir=DateToIndo($p['tanggal_lahir']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nik]</td>
													<td>$p[nama]</td>
													<td>$jenkel</td>
													<td>$p[tempat_lahir]</td>
													<td>$tanggal_lahir</td>
													<td>$p[pekerjaan]</td>
													<td>$p[keterangan]</td>
													<td><a 	href='edit-anakpegawai-$p[id_pegawai_anak]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-anakpegawai-<?php echo $p['id_pegawai_anak'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-anakpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section11'>
										<legend>3. Bapak dan Ibu Kandung</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>NIK</th>
													<th>Nama</th>
													<th>Tanggal Lahir</th>
													<th>Pekerjaan</th>
													<th>Keterangan</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_orangtua=mysqli_query($conn,"SELECT * FROM pegawai_orangtua WHERE id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_orangtua)){
												$tanggal_lahir=DateToIndo($p['tanggal_lahir']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nik]</td>
													<td>$p[nama]</td>
													<td>$tanggal_lahir</td>
													<td>$p[pekerjaan]</td>
													<td>$p[keterangan]</td>
													<td><a 	href='edit-orangtuapegawai-$p[id_pegawai_orangtua]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-orangtuapegawai-<?php echo $p['id_pegawai_orangtua'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-orangtuapegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section12'>
										<legend>4. Bapak dan Ibu Mertua</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>NIK</th>
													<th>Nama</th>
													<th>Tanggal Lahir</th>
													<th>Pekerjaan</th>
													<th>Keterangan</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_mertua=mysqli_query($conn,"SELECT * FROM pegawai_mertua WHERE id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_mertua)){
												$tanggal_lahir=DateToIndo($p['tanggal_lahir']);
												echo"<tr>
													<td>$no</td>
													<td>$p[nik]</td>
													<td>$p[nama]</td>
													<td>$tanggal_lahir</td>
													<td>$p[pekerjaan]</td>
													<td>$p[keterangan]</td>
													<td><a 	href='edit-mertuapegawai-$p[id_pegawai_mertua]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-mertuapegawai-<?php echo $p['id_pegawai_mertua'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-mertuapegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section13'>
										<legend>5. Saudara Kandung</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>NIK</th>
													<th>Nama</th>
													<th>Jenis<br>Kelamin</th>
													<th>Tanggal Lahir</th>
													<th>Pekerjaan</th>
													<th>Keterangan</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_saudara=mysqli_query($conn,"SELECT * FROM pegawai_saudara WHERE id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_saudara)){
												$tanggal_lahir=DateToIndo($p['tanggal_lahir']);
												if($p['jenkel']=='P'){
													$jenkel="Pria";
												}
												else{
													$jenkel="Wanita";
												}
												echo"<tr>
													<td>$no</td>
													<td>$p[nik]</td>
													<td>$p[nama]</td>
													<td>$jenkel</td>
													<td>$tanggal_lahir</td>
													<td>$p[pekerjaan]</td>
													<td>$p[keterangan]</td>
													<td><a 	href='edit-saudarapegawai-$p[id_pegawai_saudara]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-saudarapegawai-<?php echo $p['id_pegawai_saudara'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-saudarapegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>
								</fieldset>


								<fieldset id='section14'>
									<legend>Keterangan Organisasi</legend>
									<fieldset>
										<legend>1. Semasa Mengikuti Pendidikan pada SLTA ke Bawah</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>Nama <br>Organisasi</th>
													<th>Kedudukan Dalam<br>Organisasi</th>
													<th>Dalam<br>TH s/d TH</th>
													<th>Tempat</th>
													<th>Nama Pemimpin<br>Organisasi</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_organisasi=mysqli_query($conn,"SELECT * FROM pegawai_organisasi WHERE waktu='SLTA' AND  id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_organisasi)){
												echo"<tr>
													<td>$no</td>
													<td>$p[nama]</td>
													<td>$p[kedudukan]</td>
													<td>$p[tahun_awal] s/d $p[tahun_akhir]</td>
													<td>$p[tempat]</td>
													<td>$p[pemimpin]</td>
													<td><a 	href='edit-organisasi1pegawai-$p[id_pegawai_organisasi]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-organisasi1pegawai-<?php echo $p['id_pegawai_organisasi'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-organisasi1pegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section15'>
										<legend>2. Semasa Mengikuti Pendidikan pada Perguruan Tinggi</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>Nama <br>Organisasi</th>
													<th>Kedudukan Dalam<br>Organisasi</th>
													<th>Dalam<br>TH s/d TH</th>
													<th>Tempat</th>
													<th>Nama Pemimpin<br>Organisasi</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_organisasi=mysqli_query($conn,"SELECT * FROM pegawai_organisasi WHERE waktu='Perguruan' AND id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_organisasi)){
												echo"<tr>
													<td>$no</td>
													<td>$p[nama]</td>
													<td>$p[kedudukan]</td>
													<td>$p[tahun_awal] s/d $p[tahun_akhir]</td>
													<td>$p[tempat]</td>
													<td>$p[pemimpin]</td>
													<td><a 	href='edit-organisasi2pegawai-$p[id_pegawai_organisasi]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-organisasi2pegawai-<?php echo $p['id_pegawai_organisasi'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-organisasi2pegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>

									<fieldset id='section16'>
										<legend>3. Sesudah Selesai Pendidikan atau Selama Menjadi Pegawai</legend>
										<table class='table table-striped table-bordered'>
											<thead class='center'>
												<tr>
													<th>No</th>
													<th>Nama <br>Organisasi</th>
													<th>Kedudukan Dalam<br>Organisasi</th>
													<th>Dalam<br>TH s/d TH</th>
													<th>Tempat</th>
													<th>Nama Pemimpin<br>Organisasi</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>";
											$no=1;
											$pegawai_organisasi=mysqli_query($conn,"SELECT * FROM pegawai_organisasi WHERE waktu='Pegawai' AND  id_pegawai='$a[id_pegawai]'");
											while($p=mysqli_fetch_array($pegawai_organisasi)){
												echo"<tr>
													<td>$no</td>
													<td>$p[nama]</td>
													<td>$p[kedudukan]</td>
													<td>$p[tahun_awal] s/d $p[tahun_akhir]</td>
													<td>$p[tempat]</td>
													<td>$p[pemimpin]</td>
													<td><a 	href='edit-organisasi3pegawai-$p[id_pegawai_organisasi]'>
													<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
													?>
													<a 	href="hapus-organisasi3pegawai-<?php echo $p['id_pegawai_organisasi'];?>"onclick="return confirm('Lanjut?')">
													<?php
													echo"
													<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
												</tr>";
												$no++;
											}
											echo"
											</tbody>
										</table>

										<a href='tambah-organisasi3pegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
									</fieldset>
								</fieldset>

								<fieldset id='section17'>
									<legend>Keterangan Lain-lain</legend>
									<table class='table table-striped table-bordered'>
										<thead class='text-center'>
											<tr>
												<th rowspan='2'>No</th>
												<th rowspan='2'>Nama Keterangan</th>
												<th colspan='3'>Surat Keterangan</th>
												<th rowspan='2'>Aksi</th>
											</tr>
											<tr>
												<th>Pejabat</th>
												<th>Nomor</th>
												<th>Tanggal</th>
											</tr>
										</thead>
										<tbody>";
										$no=1;
										$pegawai_keterangan=mysqli_query($conn,"SELECT * FROM pegawai_keterangan WHERE id_pegawai='$a[id_pegawai]'");
										while($p=mysqli_fetch_array($pegawai_keterangan)){
											$tanggal_keterangan=DateToIndo2($p['tanggal_keterangan']);
											echo"<tr>
												<td>$no</td>
												<td>$p[nama]</td>
												<td>$p[pejabat_keterangan]</td>
												<td>$p[nomor_keterangan]</td>
												<td>$tanggal_keterangan</td>
												<td><a 	href='edit-keteranganpegawai-$p[id_pegawai_keterangan]'>
												<button class='btn btn-warning btn-flat btn-sm' data-toggle='tooltip' title='Edit'><i class='fa fa-edit'></i></button></a>";
												?>
												<a 	href="hapus-keteranganpegawai-<?php echo $p['id_pegawai_keterangan'];?>"onclick="return confirm('Lanjut?')">
												<?php
												echo"
												<button class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' title='Hapus'><i class='fa fa-trash-o'></i></button></a></td>
											</tr>";
											$no++;
										}
										echo"
										</tbody>
									</table>

									<a href='tambah-keteranganpegawai-$a[id_pegawai]' class='btn btn-info btn-flat btn-sm'>Tambah</a>
								</fieldset>
								";
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	<?php
	break;
	}
}
?>