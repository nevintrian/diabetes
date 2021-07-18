<?php
class user extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('html');
        $this->load->model('m_user');
        $this->load->library('pagination');
        $this->load->library('upload');
        $this->load->helper('form');
        $this->load->library('cetak_pdf');
    }


    public function index()
    {
        $this->load->view('v_header');
        $this->load->view('v_sidebar');

        $config['total_rows'] = $this->m_user->total_rows();
        $user = $this->m_user->get_limit_data();
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'user_data' => $user,
            'total_rows' => $config['total_rows'],
        );

        $this->load->view('v_user', $data);
    }

    public function create()
    {

        $this->load->view('v_header');
        $this->load->view('v_sidebar');

        $data = array(
            'button' => 'Create',
            'action' => site_url('user/create_action'),
            'id' => set_value('id'),
            'email' => set_value('email'),
            'nama' => set_value('nama'),
            'username' => set_value('username'),
            'password' => set_value('password'),
            'status' => set_value('status'),
        );

        $this->load->view('v_user1', $data);
    }



    public function create_action()
    {
        $data = array(
            'email' => $this->input->post('email', TRUE),
            'nama' => $this->input->post('nama', TRUE),
            'username' => $this->input->post('username', TRUE),
            'password' => md5($this->input->post('password', TRUE)),
            'status' => 'admin',
        );

        $this->m_user->insert($data);
?>
        <script type="text/javascript">
            alert('Data Berhasil di Tambahkan');
            window.location = '<?php echo base_url('user'); ?>'
        </script>
    <?php

    }

    public function update($id)
    {

        $this->load->view('v_header');
        $this->load->view('v_sidebar');
        $row = $this->m_user->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('user/update_action'),
                'id' => set_value('id', $row->id),
                'nama' => set_value('nama', $row->nama),
                'password' => set_value('password', $row->password),
            );

            $this->load->view('v_user1', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user'));
        }
    }

    public function update_action()
    {

        $password = $this->input->post('password', TRUE);
        if ($password != null) {
            $data = array(
                'nama' => $this->input->post('nama', TRUE),
                'password' => md5($this->input->post('password', TRUE)),
            );
        } else {
            $data = array(
                'nama' => $this->input->post('nama', TRUE),
            );
        }

        $this->m_user->update($this->input->post('id', TRUE), $data);
    ?>
        <script type="text/javascript">
            alert('Data Berhasil di Update');
            window.location = '<?php echo base_url('user'); ?>'
        </script>
<?php

    }

    public function delete($id)
    {
        $row = $this->m_user->get_by_id($id);

        if ($row) {
            $this->m_user->delete($id);
            redirect(site_url('user'));
        }
    }
}


?>