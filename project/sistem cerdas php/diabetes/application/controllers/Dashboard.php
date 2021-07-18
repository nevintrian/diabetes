<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('html');
		$this->load->helper(array('form', 'url'));
		$this->load->model('m_mata');
		$this->load->model('m_user');
		$this->load->model('m_uji');
	}

	public function index()
	{
		$this->load->view('v_header');
		$this->load->view('v_sidebar');
		if ($this->session->userdata('status') == "") {
			redirect('login');
		}
		if ($this->session->userdata('status') != null) {

			$data = array(
				'total_asset_mata' => $this->m_mata->total_rows(),
				'total_asset_uji' => $this->m_uji->total_rows(),
				'total_asset_user' => $this->m_user->total_rows(),
				'total_akurasi' => $this->m_mata->getAkurasi()
			);
		}
		$this->load->view('v_dashboard', $data);
	}
}
