<?php
class Daftar extends CI_Controller
{
	public function index()
	{
		$this->load->view('v_header');
		$this->load->view('v_daftar');
		$this->load->view('v_footer');
	}

	public function simpan_daftar()
	{
		$email = $this->input->post('email');
		$username = $this->input->post('username');
		$password = md5($this->input->post('password'));
		$nama = $this->input->post('nama');
		$data = array(
			'email' => $email,
			'username' => $username,
			'password' => $password,
			'status' => 'admin',
			'nama' => $nama,
		);

		$this->db->insert('user', $data);
?>
		<script type="text/javascript">
			alert('Pendaftaran Berhasil, Silahkan Login');
			window.location = '<?php echo base_url('login'); ?>'
		</script>
<?php

	}
}
