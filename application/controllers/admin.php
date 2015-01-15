<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends MY_Controller {
	private $data = array();

	public function __construct() {
		parent::__construct();
		$this->load->model('m_admin');
	}

	public function index() {
		$this->pasien();
	}

	public function apotek() {
		$this->data['apotek'] = $this->m_admin->getApotek();
		$this->render_admin('admin/v_apotek', $this->data);
	}

	public function apoteker() {
		$this->data['apoteker'] = $this->m_admin->getUser(null,2);
		$this->render_admin('admin/v_apoteker', $this->data);
	}

	public function pasien() {
		$this->data['pasien'] = $this->m_admin->getUser(null,3);
		$this->render_admin('admin/v_pasien', $this->data);
	}
	

}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */