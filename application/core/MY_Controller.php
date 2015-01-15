<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

	public function __construct() {
		parent::__construct();
	}

	protected function render_admin($view, $data=null) {
		$this->load->view('templates/v_admin_header');
		$this->load->view($view, $data);
		$this->load->view('templates/v_admin_footer');
	}

}

/* End of file MY_Controller.php */
/* Location: ./controllers/MY_Controller.php */