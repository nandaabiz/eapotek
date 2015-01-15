<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Apoteker extends MY_Controller {
	private $data = array();

	function __construct() {
		parent::__construct();
	}

	public function index() {
		$this->load->model('m_apoteker');
		$this->data['usertipe'] = $this->m_admin->getUserTipe(2);
		$this->data['test'] = array(1,2,3);
		$this->data['nama_user'] = 'Helena';
		$this->render_admin('admin/v_apoteker_dash', $this->data);
	}
	

}

/* End of file apoteker.php */
/* Location: ./application/controllers/apoteker.php */