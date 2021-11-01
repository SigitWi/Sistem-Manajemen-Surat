<?php

/**
 * Created by PhpStorm.
 * User: doxa
 * Date: 31/01/18
 * Time: 07.50
 */

defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property  RegisterModel $LoginModel
 */
class Register extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('RegisterModel');
  }

  public function index()
  {
    $this->data['jabatan'] = $this->RegisterModel->get_category();
    $this->load->view('register', $this->data);
  }

  public function proses()
  {
    $this->form_validation->set_rules('nip', 'NIP', 'trim|required|min_length[1]|max_length[255]|is_unique[pegawai.nip]');
    $this->form_validation->set_rules('nama', 'nama', 'trim|required|min_length[1]|max_length[255]');
    $this->form_validation->set_rules('id_jabatan', 'id_jabatan', 'trim|required|min_length[1]|max_length[255]|is_unique[pegawai.id_jabatan]');
    $this->form_validation->set_rules('password', 'password', 'trim|required|min_length[1]|max_length[255]');

    if ($this->form_validation->run() == true) {
      $nip = $this->input->post('nip');
      $nama = $this->input->post('nama');
      $id_jabatan = $this->input->post('id_jabatan');
      $password = $this->input->post('password');

      $this->RegisterModel->register($nama, $nip, $id_jabatan, $password);
      $this->session->set_flashdata('success_register', 'Proses Pendaftaran Berhasil');
      redirect('login');
    } else {
      $this->session->set_flashdata('error', validation_errors());
      redirect('register');
    }
  }
}
