
<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_mata extends CI_Model
{

    public $table = 'mata';
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
        $this->db->from('mata');
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
        $this->db->from('mata');
        $this->db->where($this->id, $id);
        return $this->db->get()->row();
    }

    function getAkurasi()
    {
        $data_salah = $this->db->query('select id from uji where status-uji!=0')->num_rows();
        $jumlah_data = $this->total_rows();
        if ($jumlah_data != 0) {
            $hasil =  ((($jumlah_data - $data_salah) / $jumlah_data) * 100);
            return round($hasil, 2);
        } else {
            return 0;
        }
    }

    function getDataLatih()
    {
        $this->db->select('kontras, energi, homogenitas, korelasi');
        $this->db->from('mata');
        $array_new = [];
        $array = $this->db->get()->result_array();
        foreach ($array as $a) {
            array_push($array_new, array_values($a));
        }
        return $array_new;
    }

    function getTargetLatih()
    {
        $this->db->select('status');
        $this->db->from('mata');
        $array_new = [];
        $arrays = $this->db->get()->result_array();
        foreach ($arrays as $array) {
            foreach ($array as $a) {
                array_push($array_new, $a);
            }
        }
        return $array_new;
    }

    function getGlcm($img)
    {
        //resource gambar dan ambil panjang dan lebar
        $resource = imagecreatefrompng(base_url("image/mata/" . $img));
        $width = imagesx($resource);
        $height = imagesy($resource);

        //ubah image ke grayscale
        $maxGrayValue = 0;
        for ($x = 0; $x < $width; $x++) {
            for ($y = 0; $y < $height; $y++) {
                //mengambil warna dan konversi ke grayscale
                $color = imagecolorat($resource, $x, $y);
                $grayColor = round(((($color >> 16) & 0xFF) + (($color >> 8) & 0xFF) + ($color & 0xFF)) / 3);

                //set pixel gambar menjadi gray
                $rgb = imagecolorallocate($resource, $grayColor, $grayColor, $grayColor);
                imagesetpixel($resource, round($x), round($y), $rgb);

                //mencari nilai max gray dalam gambar
                if ($grayColor > $maxGrayValue) {
                    $maxGrayValue = round($grayColor);
                }
            }
        }

        //matrix glcm
        $matrix = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
        ];

        $maxMatrix = round($maxGrayValue / count($matrix));

        //update matrix glcm
        for ($i = 0; $i < $width; $i++) {
            for ($j = 0; $j < $height - 1; $j++) {
                //ambil warna grey dalam gambar dan tetangganya lalu masukkan ke array
                $colorMatrix = (imagecolorat($resource, $i, $j)) & 0xFF;
                $colorMatrixNext = (imagecolorat($resource, $i, ($j + 1))) & 0xFF;
                $matrix[round($colorMatrix / $maxMatrix) - 1][round($colorMatrixNext / $maxMatrix) - 1] += 1;
            }
        }

        //ditambah dengan transpose matrix
        $transpose_matrix = $matrix;
        $pembagi_normalisasi = 0;
        for ($m = 0; $m < count($matrix); $m++) {
            for ($n = 0; $n < count($matrix[$m]); $n++) {
                $matrix[$m][$n] += $transpose_matrix[$n][$m];
                $pembagi_normalisasi += $matrix[$m][$n];
            }
        }

        //estraksi fitur GLCM
        $kontras = 0;
        $energi = 0;
        $homogenitas = 0;

        $uk = 0;
        $ul = 0;
        $sk = 0;
        $sl = 0;
        $korelasi = 0;

        for ($k = 0; $k < count($matrix); $k++) {
            for ($l = 0; $l < count($matrix[$k]); $l++) {
                if ($matrix[$k][$l] != 0) {
                    $normalisasi = $matrix[$k][$l] / $pembagi_normalisasi;
                    //kontras
                    $kontras += (($k - $l) ** 2) * $normalisasi;
                    //energi
                    $energi += $normalisasi ** 2;
                    //homogenitas
                    $homogenitas += $normalisasi / (1 + abs($k - $l));
                    //korelasi miu dan sigma
                    $uk += $k  * $normalisasi;
                    $ul += $l * $normalisasi;
                    $sk += sqrt((($k - $uk) ** 2) * $normalisasi);
                    $sl += sqrt((($l - $ul) ** 2) * $normalisasi);
                }
            }
        }

        //korelasi
        for ($kk = 0; $kk < count($matrix); $kk++) {
            for ($kl = 0; $kl < count($matrix[$kk]); $kl++) {
                if ($matrix[$kk][$kl] != 0) {
                    $normalisasi = $matrix[$kk][$kl] / $pembagi_normalisasi;
                    $korelasi += (($kk - $uk) * ($kl - $ul) * $normalisasi) / $sk * $sl;
                }
            }
        }

        $data = [
            "kontras" => round($kontras, 9),
            "energi" => round($energi, 9),
            "homogenitas" => round($homogenitas, 9),
            "korelasi" => round($korelasi, 9)
        ];

        return $data;
    }
}
