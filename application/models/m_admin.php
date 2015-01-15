<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_admin extends CI_Model {

	public function __construct() {
		parent::__construct();

		$this->load->database();
		
	}

	/* ================ User Area ================ */

	public function getUserTipe($user_tipe_id='')
	{
		$this->db->select('user_tipe_id', FALSE);
		$this->db->select('user_tipe_nama', FALSE);
		$this->db->from('user_tipe');
		if ($user_tipe_id) {
			$this->db->where('user_tipe_id', $user_tipe_id, FALSE);
		}
		$query = $this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result_array();
		}
		return null;
	}

	public function getUser($user_id=null,$user_tipe_id=null) {
		$this->db->select('user_id', FALSE);
		$this->db->select('user_nama', FALSE);
		$this->db->select('user_email', FALSE);
		$this->db->from('user');
		if ($user_id){
			$this->db->where('user_id', $user_id, FALSE);
		}
		if ($user_tipe_id){
			$this->db->where('user_tipe_id', $user_tipe_id, FALSE);
		}
		$query = $this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result_array();
		}
		return null;
	}

	/* ================ Apotek Area ================ */
	
	public function getApotek($apotek_id=null) {
		$this->db->from('apotek');
		if ($apotek_id) {
			$this->db->where('apotek_id', $apotek_id);
		}
		$query = $this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result_array();
		}
		return null; 
	}
}

/* End of file m_admin.php */
/* Location: ./application/models/m_admin.php */