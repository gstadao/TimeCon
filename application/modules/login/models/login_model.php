<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model
{
    
    /**
     * This function used to check the login credentials of the user
     * @param string $email : This is email of the user
     * @param string $password : This is encrypted password of the user
     */
    function loginMe($email, $ecryptPassword)
    {
        $this->db->select('US.us_id_usuario, US.nombre, US.us_id_rol, ROL.role');
        $this->db->from('us_usuario as US');
        $this->db->join('us_rol as ROL','ROL.us_id_rol = US.us_id_rol');
        $this->db->where('US.email', $email);
        $this->db->where('US.password', $ecryptPassword);
        $this->db->where('US.activo', 0);
        $query = $this->db->get();
        
        return $query->result();
    }
    
    
}

?>