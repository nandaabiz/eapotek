<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {
	var $data = array();

	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->load->view('view_login');   
		//$data = array();
		//$this->load->view('login/view_login', $data, TRUE);
	}

}

/* End of file login.php */
/* Location: ./application/controllers/login.php */