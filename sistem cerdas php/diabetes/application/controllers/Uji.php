<?php
class Uji extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('html');
        $this->load->model('m_uji');
        $this->load->model('m_mata');
        $this->load->library('pagination');
        $this->load->library('upload');
        $this->load->helper('form');
        $this->load->library('cetak_pdf');
    }


    public function index()
    {
        $this->load->view('v_header');
        $this->load->view('v_sidebar');

        $config['total_rows'] = $this->m_uji->total_rows();
        $uji = $this->m_uji->get_limit_data();
        $data = array(
            'uji_data' => $uji,
            'total_rows' => $config['total_rows'],
        );
        $this->load->view('v_uji', $data);
    }

    public function create()
    {
        $this->load->view('v_header');
        $this->load->view('v_sidebar');

        $data = array(
            'button' => 'Create',
            'action' => site_url('uji/create_action'),
            'id' => set_value('id'),
            'nama' => set_value('nama'),
            'korelasi' => set_value('korelasi'),
            'energi' => set_value('energi'),
            'homogenitas' => set_value('homogenitas'),
            'kontras' => set_value('kontras'),
            'status' => set_value('status'),

        );
        $this->load->view('v_uji1', $data);
    }

    public function create_action()
    {
        $nmfile = "uji_" . time();
        $config['upload_path'] = './image/mata';
        $config['allowed_types'] = 'jpg|png|bmp';
        $config['max_size'] = '20000';
        $config['file_name'] = $nmfile;
        $this->load->library('upload');
        $this->upload->initialize($config);
        $this->upload->do_upload('gambar');
        $result1 = $this->upload->data();
        $result = array('gambar' => $result1);
        $dfile = $result['gambar']['file_name'];

        $glcm = $this->m_mata->getGlcm($dfile);
        $data_latih = $this->m_mata->getDataLatih();
        $target_latih = $this->m_mata->getTargetLatih();
        $lvq = $this->m_uji->getLvq($data_latih, $target_latih, $glcm);

        $data = array(
            'nama' => $this->input->post('nama', TRUE),
            'status' => $this->input->post('status', TRUE),
            'kontras' => $glcm['kontras'],
            'energi' => $glcm['energi'],
            'homogenitas' => $glcm['homogenitas'],
            'korelasi' => $glcm['korelasi'],
            'uji' => $lvq,
            'gambar' => $dfile,
        );

        $this->m_uji->insert($data);
?>
        <script type="text/javascript">
            alert('Data Berhasil di Tambahkan');
            window.location = '<?php echo base_url('uji'); ?>'
        </script>
    <?php

    }

    public function update($id)
    {
        $this->load->view('v_header');
        $this->load->view('v_sidebar');
        $row = $this->m_uji->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('uji/update_action'),
                'id' => set_value('id', $row->id),
                'nama' => set_value('nama', $row->nama),
                'korelasi' => set_value('korelasi', $row->korelasi),
                'energi' => set_value('energi', $row->energi),
                'homogenitas' => set_value('homogenitas', $row->homogenitas),
                'kontras' => set_value('kontras', $row->kontras),
                'status' => set_value('status', $row->status),

            );

            $this->load->view('v_uji1', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('uji'));
        }
    }

    public function update_action()
    {
        $data = array(
            'nama' => $this->input->post('nama', TRUE),
            'status' => $this->input->post('status', TRUE),
        );
        $this->m_uji->update($this->input->post('id', TRUE), $data);
    ?>
        <script type="text/javascript">
            alert('Data Berhasil di Update');
            window.location = '<?php echo base_url('uji'); ?>'
        </script>
<?php


    }

    public function delete($id)
    {
        $row = $this->m_uji->get_by_id($id);

        if ($row) {
            $this->m_uji->delete($id);
            redirect(site_url('uji'));
        }
    }
}
