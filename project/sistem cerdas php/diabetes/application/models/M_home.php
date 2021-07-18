<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_home extends CI_Model
{

    public $table = 'mata';
    public $id = 'id';
    public $order = 'ASC';

    public function total_rows($q = NULL)
    { 
        $this->db->like('nama', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    function get_limit_data($limit, $per_page = 0, $q = NULL)
    { 
        $this->db->order_by($this->id, $this->order);
        $this->db->or_like('nama', $q);
        $this->db->select('*');
        $this->db->from('mata');
        $this->db->limit($limit, $per_page);
        return $this->db->get()->result();
    }
}
