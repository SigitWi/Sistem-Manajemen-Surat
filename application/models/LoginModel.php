<?php

/**
 * Created by PhpStorm.
 * User: doxa
 * Date: 31/01/18
 * Time: 08.58
 */

defined('BASEPATH') or exit('No direct script access allowed');

class LoginModel extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function check_user()
    {
        $nip = $this->input->post('nip', TRUE);
        $pass = $this->input->post('password', TRUE);

        $query = $this->db->join('jabatan', 'jabatan.id_jabatan = pegawai.id_jabatan')
            ->where('nip', $this->input->post('nip'))
            ->where('password', password_verify($pass, $this->input->post('password')))
            ->get('pegawai');

        if ($query->num_rows() > 0) {
            $data_pegawai = $query->row();
            $session = array(
                'logged_in' => true,
                'nip' => $data_pegawai->nip,
                'id_pegawai' => $data_pegawai->id_pegawai,
                'id_jabatan' => $data_pegawai->id_jabatan,
                'nama_pegawai' => $data_pegawai->nama_pegawai,
                'nama_jabatan' => $data_pegawai->nama_jabatan,
                'level' => $data_pegawai->level
            );

            $this->session->set_userdata($session);
            return true;
        } else {
            return false;
        }
    }
}
