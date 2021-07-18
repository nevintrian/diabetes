<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Tutorial extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('html');
		$this->load->helper(array('form', 'url'));
	}

	public function index()
	{
		$this->load->view('v_header');
		$this->load->view('v_tutorial');
		$this->load->view('v_footer');
	}
}
