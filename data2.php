<?php
// error_reporting(0);
//echo getcwd();

if (isset($_POST['submit'])) {
	//echo var_dump($_POST);
	$acak = rand(1, 99);
	$fupload_name = $_FILES['fupload']['name'];
	$nama_file_unik = $acak . $fupload_name;
	$id_skpd = $_POST['id_skpd'];
	$jabatan = mysqli_fetch_array(mysqli_query($conn, "SELECT id_jabatan FROM jabatan WHERE id_skpd='$_POST[id_skpd]'"));
	$id_jabatan = $jabatan["id_jabatan"];

	// file grup

	//direktori excel
	$vdir_upload = "../images/importedExcel/";
	$file_task = $vdir_upload . $nama_file_unik;

	//Simpan gambar dalam ukuran sebenarnya
	move_uploaded_file($_FILES["fupload"]["tmp_name"], $file_task);
	require 'PHPExcelReader/PHPExcelReader.php';

	// untuk file grup
	try {
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(0);
		foreach ($Reader as $key => $readerRow) {

			$data = null;
			$data = $readerRow;         // loop obtain row data

			$nik = str_replace("'", '', $data[1]);
			$nip = str_replace("'", '', $data[2]);
			$nip_lama = str_replace("'", '', $data[3]);
			$nama = $data[4];
			$gelar_depan = $data[5];
			$gelar_belakang = $data[6];
			$tampat_lahir = $data[7];
			$kabupaten_lahir = $data[8];
			$tgl = $data[9];
			$jenkel = $data[10];
			$usia = $data[11];
			$npwp = $data[12];
			$agama = $data[13];
			$status_kawin = $data[14];
			$alamat_jalan = $data[15];
			$alamat_kelurahan = $data[16];
			$alamat_kecamatan = $data[17];
			$alamat_id_kabupaten = $data[18];
			$alamat_id_provinsi = $data[19];
			$tinggi_badan = $data[20];
			$berat_badan = $data[21];
			$rambut = $data[22];
			$bentuk_muka = $data[23];
			$warna_kulit = $data[24];
			$ciri_khas = $data[25];
			$cacat_tubuh = $data[26];
			$kegemaran = $data[27];
			$tmt_kgb = $data[28];
			$tmt_kgbyad = $data[29];
			$mkgolt = $data[30];
			$gaji_pokok = $data[31];
			$tmt_berlaku = $data[32];
			$id_pangkat = $data[33];
			$tmt_capeg = $data[34];
			$tmt_pns = $data[35];
			// $id_skpd = $data[36];
			// $id_jabatan = $data[37];
			$plt = $data[38];
			$foto = $data[39];
			$status_pegawai = $data[40];
			$status_pegawai_kerja = $data[41];
			$jabatan_honor = $data[42];
			$jabatan_cpns = $data[43];
			$status_aktif = $data[44];
			$status_verifikasi = $data[45];
			$status_hk = $data[46];
			$no_hp = str_replace("'", '', $data[47]);

			$check = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(nip) as tot from pegawai where nik='$nik'"));

			if ($nik != "" && $nik != "NIK" && $nip != "" && $nip != "NIP") {
				if ($check['tot'] > 0) {
					$update = "UPDATE pegawai SET nama_pegawai='$nama', nip='$nip' WHERE nik='$nik'";
					mysqli_query($conn, $update);
				} elseif ($nik != 'NIK') {

					$sql = "INSERT INTO pegawai (nik, nama_pegawai, gelar_depan, gelar_belakang, nip,nip_lama,tempat_lahir, jenkel, usia, npwp, id_agama, status_kawin, alamat_jalan, alamat_kecamatan, alamat_id_kabupaten, alamat_id_propinsi, tinggi_badan, berat_badan, rambut, bentuk_muka, ciri_khas, cacat_tubuh, kegemaran, tmtkgb, tmtkgbyad, mkgolt, gaji_pokok, tmtberlaku, id_pangkat, tmtcapeg, tmtpns, id_skpd, id_jabatan,plt, foto, status_pegawai, status_pegawai_kerja, jabatan_honor, jabatan_cpns, status_aktif, status_verifikasi, status_hk, no_hp)
						VALUES ('$nik', '$nama','$gelar_depan','$gelar_belakang','$nip','$niplama','$tempat_lahir','$jenkel','$usia','$npwp','$id_agama','$status_kawin','$alamat_jalan','$alamat_kecamatan','$alamat_id_kabupaten','$alamat_id_propinsi','$tinggi_badan','$berat_badan','$rambut','$bentuk_muka','$ciri_khas','$cacat_tubuh','$kegemaran','$tmt_kgb','$tmt_kgbyad','$mkgolt','$gaji_pokok','$tmt_berlaku','$id_pangkat','$tmt_capeg','$tmt_pns','$id_skpd','$id_jabatan','$plt','$foto','$status_pegawai','$status_pegawai_kerja','$jabatan_honor','$jabatan_cpns','$status_aktif','$status_verifikasi','$status_hk','$no_hp')";
					mysqli_query($conn, $sql);
				}
				$id_pegawai = mysqli_insert_id($conn);
				$password = md5("12345678");
				$check_akun = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(username) as tot from users where username='$nip'"));
				if ($check_akun['tot'] > 0) {

					$update1 = "UPDATE users SET username='$nip' WHERE username='$nip'";
					mysqli_query($conn, $update1);
				} elseif ($nik != 'NIK') {

					$sql1 = "INSERT INTO users(username, password, level_1, level_2, level_3, status, id_pegawai) VALUES('$nip', '$password', 'pegawai', 'pegawai', 'pegawai', 'Y', '$id_pegawai')";
					mysqli_query($conn, $sql1);
				}
			}
		}

		//    Data anak
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(9);
		foreach ($Reader as $key => $readerRow) {

			$data = null;
            $data = $readerRow;
            
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$jenkel = $data[2];
			$tempat_lahir = $data[3];
			$tanggal_lahir = $data[4];
			$pekerjaan = $data[5];
			$keterangan = $data[6];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_anak(id_pegawai,nik,nama,jenkel,tempat_lahir, pekerjaan, keterangan)VALUES('$id_pegawai','$nik','$nama','$jenkel','$tempat_lahir','$tanggal_lahir','$pekerjaan','$keterangan')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data ortu
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(10);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$status = $data[2];
			$tanggal_lahir = $data[3];
			$pekerjaan = $data[4];
			$keterangan = $data[5];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_orangtua(id_pegawai,nik,nik_orangtua,nama,status,tanggal_lahir,pekerjaan,keterangan,tempat_lahir)VALUES('$id_pegawai','$nik','$nik_orangtua', '$nama','$status','$tanggal_lahir','$pekerjaan','$keterangan','$tempat_lahir')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data mertua
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(11);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$status = $data[2];
			$tanggal_lahir = $data[3];
			$pekerjaan = $data[4];
			$keterangan = $data[5];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_mertua(id_pegawai,nik,nik_mertua,nama,status,tanggal_lahir,pekerjaan,keterangan,tempat_lahir)VALUES('$id_pegawai','$nik','$nik_mertua', '$nama','$status','$tanggal_lahir','$pekerjaan','$keterangan','$tempat_lahir')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data saudara
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(12);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$jenkel = $data[2];
			$tanggal_lahir = $data[3];
			$pekerjaan = $data[4];
			$keterangan = $data[5];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_saudara(id_pegawai,nik,nama,jenkel,tanggal_lahir,pekerjaan,keterangan,tempat_lahir)VALUES('$id_pegawai','$nik', '$nama','$jenkel','$tanggal_lahir','$pekerjaan','$keterangan','$tempat_lahir')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data SLTA
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(13);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$kedudukan = $data[2];
			$tahun_awal = $data[3];
			$tahun_akhir = $data[4];
			$waktu = $data[5];
			$tempat = $data[6];
			$pimpinan = $data[7];
			$keterangan = $data[8];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_organisasi(id_pegawai,nama,kedudukan,tahun_awal,tahun_akhir,waktu,tempat,pemimpin,keterangan)VALUES('$id_pegawai','$nama','$kedudukan', '$tahun_awal','$tahun_akhir','$waktu','$tempat','$pemimpin','$keterangan')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data perguruan
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(14);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
            $kedudukan = $data[2];
            $tahun_awal = $data[3];
            $tahun_akhir = $data[4];
            $waktu = $data[5];
            $tempat = $data[6];
            $pimpinan = $data[7];
            $keterangan = $data[8];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_organisasi(id_pegawai,nama,kedudukan,tahun_awal,tahun_akhir,waktu,tempat,pemimpin,keterangan)VALUES('$id_pegawai','$nama','$kedudukan', '$tahun_awal','$tahun_akhir','$waktu','$tempat','$pemimpin','$keterangan')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		//    Data lainnya
		$Reader = new PHPExcelReader($file_task);
		$Reader->ChangeSheet(15);
		foreach ($Reader as $key => $readerRow) {
			$data = null;
			$data = $readerRow;
			// looping data
			// $no = $data[0];
			$nama = $data[1];
			$pejabat_keterangan = $data[2];
			$nomor_keterangan = $data[3];
			$tanggal_keterangan = $data[4];

			if($id_pegawai != 0){
				if($nama != 'nama') {
					$insert = "INSERT pegawai_keterangan(id_pegawai,nik,nama,pejabat_keterangan,nomor_keterangan,tanggal_keterangan)VALUES('$id_pegawai','$nik','$nama', '$pejabat_keterangan','$nomor_keterangan','$tanggal_keterangan')";
					mysqli_query($conn, $insert);
				} else {
					echo "Data Sudah Ada!!!";
				}
			}
		}
		echo "data berhasil";
		echo "$insert $sql";
	}
	catch (Exception $e) {
		die($e->getMessage());

		unlink($file_task); //hapus file
		//unlink($file_grup); //hapus file
		//die();
		// alert("Data Berhasil Di Input");
		// header('location:pegawai');

	}
}
