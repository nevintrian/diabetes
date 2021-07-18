<?php
class Login extends CI_Controller
{

    public function index()
    {
        if ($this->input->post() == NULL) {
            $this->load->view('v_header');
            $this->load->view('v_login');
            $this->load->view('v_footer');
        } else {
            $username = $this->input->post('username');
            $password = md5($this->input->post('password'));
            $cek_user = $this->db->query("SELECT * FROM user WHERE username='$username' and password='$password' ");
            if ($cek_user->num_rows() == 1) {
                foreach ($cek_user->result() as $row) {
                    $sess_data['id'] = $row->id;
                    $sess_data['nama'] = $row->nama;
                    $sess_data['username'] = $row->username;
                    $sess_data['status'] = $row->status;
                    $this->session->set_userdata($sess_data);
                }
                redirect('home');
            } else {
?>
                <script type="text/javascript">
                    alert('Username dan password kamu salah !');
                    window.location = "<?php echo base_url('login'); ?>";
                </script>
<?php
            }
        }
    }

    function logout()
    {
        $this->session->unset_userdata('id');
        $this->session->unset_userdata('username');
        $this->session->unset_userdata('nama');
        $this->session->unset_userdata('status');
        session_destroy();
        redirect('login');
    }
}
