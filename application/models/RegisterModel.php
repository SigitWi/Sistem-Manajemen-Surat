<?php

defined('BASEPATH') or exit('No direct script access allowed');

class RegisterModel extends CI_Model
{

  public function __construct()
  {
    parent::__construct();
  }

  function register($nama, $nip, $id_jabatan, $password)
  {

    $data_user = array(
      'nama_pegawai' => $nama,
      'nip' => $nip,
      'id_jabatan' => $id_jabatan,
      'password' => password_hash($password, PASSWORD_DEFAULT)

    );
    // $sql = $this->db->query("SELECT id_jabatan from pegawai WHERE id_jabatan='$id_jabatan'");
    // $cek_id = $sql->num_rows();
    // if ($cek_id > 0) {
    //   $this->session->set_flashdata('message', 'Anda sudah terdaftar');
    //   redirect(site_url('/register'));
    // } else {
    //   //insert db
    $this->db->insert('pegawai', $data_user);
    // }

    // $this->db->insert('pegawai', $data_user);
  }

  public function get_category()
  {
    $query = $this->db->get('jabatan')->result_array();
    return $query;
  }
}
