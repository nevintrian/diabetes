<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('html');
        $this->load->helper(array('form', 'url'));
        $this->load->model('m_home');
        $this->load->model('m_uji');
        $this->load->model('m_mata');
    }

    public function index()
    {
        $this->load->view('v_header');
        $this->load->view('v_home');
        $this->load->view('v_footer');
    }

    public function create()
    {
        $this->load->view('v_header');

        $nmfile = "home_" . time();
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

        if ($lvq == 0) {
            $hasil = "Tidak terdeteksi diabetes";
        } else {
            $hasil = "Terdeteksi diabetes";
        }
        $data = array(
            'hasil' => $hasil,
            'gambar' => $dfile
        );

        $this->load->view('v_home1', $data);
        $this->load->view('v_footer');
    }
}
