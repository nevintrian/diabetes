
<?php


class M_uji extends CI_Model
{

    public $table = 'uji';
    public $id = 'id';
    public $order = 'DESC';

    public function total_rows()
    {
        $this->db->like('nama');
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    function get_limit_data()
    {
        $this->db->like('nama');
        $this->db->select('*');
        $this->db->from('uji');
        return $this->db->get()->result();
    }

    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

    function get_by_id($id)
    {
        $this->db->select('*');
        $this->db->from('uji');
        $this->db->where($this->id, $id);
        return $this->db->get()->row();
    }


    function getLvq($data_latih, $target_latih, $data_uji)
    {
        //inisialisasi data dan target
        $data = $data_latih;
        $target = $target_latih;
        
        //inisialisasi bobot
        $bobot = [
            $data[0],
            $data[count($data) - 1]
        ];

        //inisialisasi epoch dan alpha
        $epoch = 100;
        $alpha = 0.01;

        //iterasi metode lvq
        for ($l = 0; $l < $epoch; $l++) {
            for ($i = 0; $i < count($data); $i++) {
                $kelas1 = 0;
                $kelas2 = 0;
                $pemenang = 0;

                //looping untuk menentukan kelas
                for ($j = 0; $j < count($data[$i]); $j++) {
                    $kelas1 += ($data[$i][$j] - $bobot[0][$j]) ** 2;
                    $kelas2 += ($data[$i][$j] - $bobot[1][$j]) ** 2;
                }

                //kondisi lvq untuk menentukan pemenang
                if (sqrt($kelas1) < sqrt($kelas2) || sqrt($kelas1) == sqrt($kelas2)) {
                    $pemenang = 0;
                } else {
                    $pemenang = 1;
                }

                //update bobot, jika pemenang == target maka (+), jika pemenang != target maka (-)
                if ($pemenang == $target[$i]) {
                    for ($k = 0; $k < count($bobot[$pemenang]); $k++) {
                        $bobot[$pemenang][$k] += ($alpha * ($data[$i][$k] - $bobot[$pemenang][$k]));
                    }
                } else {
                    for ($k = 0; $k < count($bobot[$pemenang]); $k++) {
                        $bobot[$pemenang][$k] -= ($alpha * ($data[$i][$k] - $bobot[$pemenang][$k]));
                    }
                }
            }
        }


        //inisialisasi
        $data_test = array_values($data_uji);
        $kelas1_test = 0;
        $kelas2_test = 0;
        $pemenang_test = 0;

        //looping untuk menentukan kelas
        for ($m = 0; $m < count($data_test); $m++) {
            $kelas1_test += ($data_test[$m] - $bobot[0][$m]) ** 2;
            $kelas2_test += ($data_test[$m] - $bobot[1][$m]) ** 2;
        }

         //kondisi lvq untuk menentukan pemenang
        if (sqrt($kelas1_test) < sqrt($kelas2_test) || sqrt($kelas1_test) == sqrt($kelas2_test)) {
            $pemenang_test = 0;
        } else {
            $pemenang_test = 1;
        }

        return $pemenang_test;
    }
}
